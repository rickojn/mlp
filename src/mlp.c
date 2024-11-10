#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <omp.h>
#include <time.h>
#include <dirent.h>
#include <sys/stat.h>
#include "../headers/mlp_types.h"
#include "../headers/custard_flow.h"

#ifndef M_PI
#define M_PI 3.14159265358979323846
#endif







char decode(int code){
    if (code == 0){
        return '.';
    }
    else {
        return code + 'a' -1; 
    }
}

TrainingSet * createTrainingSet(char **names, int name_count){
    
    TrainingSet * training_set = malloc(sizeof(TrainingSet));

    training_set->size = 0;

    for (int i = 0; i < name_count; i++){
        training_set->size+= strlen(names[i]) +1;
    }

    training_set->X = (char*)malloc(training_set->size * SIZE_BLOCK * sizeof(char));
    training_set->Y = (char*)malloc(training_set->size * sizeof(char));


    // assume block size = 3
    // X = ["...", "..e", ".em","emm", "mma" ]
    // Y = ['e', 'm', 'm', 'a', '.']

    char x_padding[SIZE_BLOCK];
    for (int i = 0; i < SIZE_BLOCK; i++){
        x_padding[i] = '.';
    } 
    char *name = NULL;
    int idx_training_sample = 0;

    for (int idx_name = 0; idx_name < name_count; idx_name++){
        name = names[idx_name];
        int name_len = strlen(name);
        strcpy((training_set->X) + (idx_training_sample * SIZE_BLOCK), x_padding);
        for (int idx_char_in_name = 0; idx_char_in_name < name_len +1; idx_char_in_name++){
            char character = name[idx_char_in_name];
            if (character != '\0'){
                training_set->Y[idx_training_sample] = character;
            }
            else {
                training_set->Y[idx_training_sample] = '.';
            }
            // [...]
            // [.....e]
            // [.....e.em]
            if (idx_char_in_name != 0)
            {
                for (int x_idx = 0; x_idx < SIZE_BLOCK - 1; x_idx++)
                {
                    training_set->X[idx_training_sample * SIZE_BLOCK + x_idx] =
                        training_set->X[(idx_training_sample - 1) * SIZE_BLOCK + x_idx + 1];
                }
                training_set->X[(idx_training_sample * SIZE_BLOCK) + SIZE_BLOCK - 1] = name[idx_char_in_name - 1];
            }
            idx_training_sample++;
        }
    }

    return training_set;
}


void create_model(Model * model, size_t size_batch){    
    size_t size_model_params_memory = SIZE_VOCAB * DIM_EMBEDDINGS // embedding table
    + SIZE_BLOCK * DIM_EMBEDDINGS * SIZE_HIDDEN // hidden weights
    + SIZE_HIDDEN // hidden biases
    + SIZE_HIDDEN * SIZE_VOCAB // output weights
    + SIZE_VOCAB; // output biases

    size_t size_model_activations = size_batch * (SIZE_BLOCK * DIM_EMBEDDINGS
    + SIZE_HIDDEN
    + SIZE_VOCAB * 2);

    size_t size_model_gradients = size_batch * (SIZE_VOCAB * DIM_EMBEDDINGS
    + SIZE_BLOCK * DIM_EMBEDDINGS * SIZE_HIDDEN
    + SIZE_HIDDEN * SIZE_VOCAB);

    size_t size_model_memory = size_model_params_memory + size_model_activations + size_model_gradients;
    float * model_memory = calloc(size_model_memory, sizeof(float));

    model->parameters.table_embedding = model_memory;
    model->parameters.weights_hidden = model_memory + SIZE_VOCAB * DIM_EMBEDDINGS;
    model->parameters.biases_hidden = model->parameters.weights_hidden + SIZE_BLOCK * DIM_EMBEDDINGS * SIZE_HIDDEN;
    model->parameters.weights_output = model->parameters.weights_hidden + SIZE_HIDDEN;    
    model->parameters.biases_output = model->parameters.weights_output + SIZE_HIDDEN * SIZE_VOCAB;
    model->activations.input = model->parameters.weights_output + SIZE_VOCAB;
    model->activations.hidden = model->activations.input 
    + SIZE_BLOCK * DIM_EMBEDDINGS * size_batch;
    model->activations.output = model->activations.hidden
    + size_batch * SIZE_HIDDEN;
    model->activations.probs = model->activations.output
    + size_batch * SIZE_VOCAB;

    model->gradients.embeddings = model->activations.probs + size_batch * SIZE_VOCAB;
    model->gradients.hidden = model->gradients.embeddings + size_batch * SIZE_VOCAB * DIM_EMBEDDINGS;
    model->gradients.output = model->gradients.hidden + size_batch * SIZE_BLOCK * DIM_EMBEDDINGS * SIZE_HIDDEN;

    model->size_batch = size_batch;
}

void initialise_model(Model *model)
{
    size_t size_params = SIZE_VOCAB * DIM_EMBEDDINGS
    + SIZE_BLOCK * DIM_EMBEDDINGS * SIZE_HIDDEN
    + SIZE_HIDDEN * SIZE_VOCAB;

    srand(42);

    for (int i = 0; i < size_params; i++)
    {
        *(model->parameters.table_embedding + i) = generate_normal_random_number();
    }
}


void embed_tokens(Model * model, TrainingSet * training_set ){
    for (size_t idx_token = 0; idx_token < training_set->size * SIZE_BLOCK; idx_token++){
        for (size_t idx_embed_dim = 0; idx_embed_dim < DIM_EMBEDDINGS; idx_embed_dim++){
            size_t idx_activation_input = idx_token * DIM_EMBEDDINGS + idx_embed_dim;
            int code_char = encode(training_set->X[idx_token]);
            model->activations.input[idx_activation_input] = 
            model->parameters.table_embedding[code_char * DIM_EMBEDDINGS + idx_embed_dim];
        }        
    }
}

/*

a b c  X  p q r
d e f     s t u
          v w x

=  (a*p + b*s + c*v), (a*q + b*t + c*w), (a*r + b*u + c*x)
   (d*p + e*s + f*v), (d*q + e*t + f*w), (d*r + e*u + f*x)

*/

void mat_mul_forward( float * matrix_inputs, unsigned int size_rows_inputs, unsigned int size_cols_inputs_rows_weights,
                      float * matrix_weights, float * matrix_biases, unsigned int size_cols_weights, float * matrix_output)
{
    clock_t begin, end;
    double time_spent;

    // Record the beginning time
    begin = clock();
    // #pragma omp parallel for collapse(2)
    for (size_t idx_row_input = 0; idx_row_input < size_rows_inputs; idx_row_input++ ){
        for (size_t idx_col_weight = 0; idx_col_weight < size_cols_weights; idx_col_weight++){
            if (matrix_biases != NULL){
                matrix_output[(idx_row_input * size_cols_inputs_rows_weights) + idx_col_weight] = 
                    matrix_biases[idx_row_input * size_cols_inputs_rows_weights + idx_col_weight];
            }
            else {
                matrix_output[(idx_row_input * size_cols_inputs_rows_weights) + idx_col_weight] = 0.0;
            }
            for (size_t k = 0; k < size_cols_inputs_rows_weights; k++){
                matrix_output[(idx_row_input * size_cols_inputs_rows_weights) + idx_col_weight] +=
                matrix_inputs[(idx_row_input * size_cols_inputs_rows_weights) + k]
                * matrix_weights[(idx_col_weight * size_cols_inputs_rows_weights) + k];
            }
        }
    }
    end = clock();
    time_spent = (double)(end - begin) / CLOCKS_PER_SEC;

    printf("\nTime spent: %.2lf seconds\n", time_spent);

}

void tanh_forward(float * matrix_input, float * matrix_output, size_t size_cols, size_t size_rows){
    for (size_t idx_row = 0; idx_row < size_rows; idx_row++){
        for (size_t idx_col = 0; idx_col < size_cols; idx_col++){
            size_t idx_activation = idx_row * size_cols + idx_col;
            matrix_output[idx_activation] = tanh(matrix_input[idx_activation]);
        }
    }
}

void softmax_forward(float * logits, float * probs, size_t size_batch){
    //exp logits:
    for (int i = 0; i < size_batch; i++){
        // each logits & probs row

        // find the max logit
        float max_logit = logits[i * SIZE_VOCAB];

        for (int j = 0; j < SIZE_VOCAB; j++){
            if (logits[(i * SIZE_VOCAB) + j] > max_logit){
                max_logit = logits[(i * SIZE_VOCAB) + j];
            }
        }

        // exponentiate logits and accumulate softmax denominator
        float softmax_denominator = 0.0;
        for (int j = 0; j < SIZE_VOCAB; j++){
            probs[(i * SIZE_VOCAB) + j] = exp(logits[(i * SIZE_VOCAB) + j] - max_logit);
            softmax_denominator += probs[(i * SIZE_VOCAB) + j];
        }
        // normalise exponentiated logits:
        for (int j = 0; j < SIZE_VOCAB; j++){
            probs[(i * SIZE_VOCAB) + j] = probs[(i * SIZE_VOCAB) + j] / softmax_denominator;
        }

    }

}

void model_forward(Model * model, TrainingSet * training_set ){ // need to change params
    printf("\nembedding tokens ...\t");
    embed_tokens(model, training_set);
    printf("tokens embedded ...\n");
    printf("linear processing of embeddings ...\t");
    mat_mul_forward(model->activations.input, model->size_batch, DIM_EMBEDDINGS * SIZE_BLOCK, 
        model->parameters.weights_hidden, model->parameters.biases_hidden,
    SIZE_HIDDEN, model->activations.hidden);
    printf("embeddings processed linearly ...\n");
    tanh_forward(model->activations.hidden, model->activations.hidden, SIZE_HIDDEN, model->size_batch);
    printf("apply out layer ...\n");
    mat_mul_forward(model->activations.hidden, model->size_batch, SIZE_HIDDEN, model->parameters.weights_output, 
    model->parameters.biases_output, SIZE_VOCAB, model->activations.output);
    softmax_forward(model->activations.output, model->activations.probs, model->size_batch);
}

float cross_entropy_loss(float * probs, char * labels, size_t size_batch){
    printf("\nreal batch size = %zu\n", size_batch);
    float batch_loss = 0.0;
    // size_batch = 220000;
    printf("\nused batch size = %zu\n", size_batch);
    for (int i = 0; i < size_batch; i++){
         batch_loss += log(probs[(i * SIZE_VOCAB) + encode(labels[i])]) * -1;
    }
    return batch_loss/size_batch;
}

void loss_softmax_backward(char * labels, float * probs, float * grads_logit, int batch_size){
    for (int idx_batch = 0; idx_batch < batch_size; idx_batch++){
        for (int idx_vocab = 0; idx_vocab < SIZE_VOCAB; idx_vocab++){
            float label = 0.0;
            if (idx_vocab == encode(labels[idx_batch])){
                label = 1;
            }
            size_t idx_grad = idx_batch * SIZE_VOCAB + idx_vocab;
            grads_logit[idx_grad] = probs[idx_grad] - label;
        }
    }
}


void mat_mul_backward(float * matrix_inputs, size_t size_rows_inputs, size_t size_cols_inputs_rows_weights,
                      float * matrix_weights, size_t size_cols_weights, float * matrix_activations,
                      float * grads_weights){
                        for (size_t idx_batch_row = 0; idx_batch_row < size_rows_inputs; idx_batch_row++){
                            for (size_t idx_logit = 0; idx_logit < size_cols_inputs_rows_weights; idx_logit++){
                                for (size_t idx_weight = 0; idx_weight < size_cols_inputs_rows_weights; idx_weight++){
                                    size_t offset_grad_weight = idx_batch_row * size_cols_inputs_rows_weights * size_cols_weights
                                    + idx_logit * size_cols_inputs_rows_weights + idx_weight;
                                    size_t offset_input = idx_batch_row * size_cols_inputs_rows_weights +
                                    idx_weight;
                                    grads_weights[offset_grad_weight] = matrix_inputs[offset_input];
                                }
                            }
                        }
}

void model_backwards(Model * model, TrainingSet * training_set){
    loss_softmax_backward(training_set->Y, model->activations.probs, model->gradients.output, model->size_batch);
    printf("\n model backwards\n");
}

int main()
{
    // read in names file
    char ** names = NULL;
    const char * training_path = getenv("TRAINING_PATH");
    int count = readNames(&names, training_path);
    printf("\n%d names loaded\n", count);
    // create training set from names array
    TrainingSet * training_set = createTrainingSet(names, count);

    // create model
    printf("\ncreating model ...\n");
    Model model;
    create_model(&model, training_set->size);
    printf("\n... model created.\n");
    
    // initialise model
    printf("\ninitialising model ....\n");
    initialise_model(&model);
    printf("\nmodel initialised ....\n");

    model_forward(&model, training_set);
    printf("\nloss = %f\n", cross_entropy_loss(model.activations.probs, training_set->Y, training_set->size));
    model_backwards(&model, training_set);

    for (size_t i = 0; i < count; i++){
        free(names[i]);
    }
    free(names);
    free(training_set->X);
    free(training_set->Y);
    free(training_set);
    free(model.parameters.table_embedding);
    return 0;
}
