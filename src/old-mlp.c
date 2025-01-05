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
    + SIZE_HIDDEN * 2
    + SIZE_VOCAB * 2);

    size_t size_model_gradients = size_batch * (SIZE_VOCAB * DIM_EMBEDDINGS //embeddings weights
    + SIZE_BLOCK * DIM_EMBEDDINGS // embedding activations
    + SIZE_BLOCK * DIM_EMBEDDINGS * SIZE_HIDDEN  // hidden weights
    + SIZE_HIDDEN // hidden biases
    + SIZE_HIDDEN * 2 // hidden pre-activations and activations
    + SIZE_HIDDEN * SIZE_VOCAB // output weights
    + SIZE_VOCAB //output biases
    + SIZE_VOCAB); // output pre-activations

    size_t size_model_memory = size_model_params_memory + size_model_activations + size_model_gradients;
    float * model_memory = calloc(size_model_memory, sizeof(float));
    model->parameters.table_embedding = model_memory;
    model->parameters.weights_hidden = model_memory + SIZE_VOCAB * DIM_EMBEDDINGS;
    model->parameters.biases_hidden = model->parameters.weights_hidden + SIZE_BLOCK * DIM_EMBEDDINGS * SIZE_HIDDEN;
    model->parameters.weights_output = model->parameters.biases_hidden + SIZE_HIDDEN;    
    model->parameters.biases_output = model->parameters.weights_output + SIZE_HIDDEN * SIZE_VOCAB;

    model->activations.input = model->parameters.biases_output + SIZE_VOCAB;
    model->activations.pre_hidden = model->activations.input + SIZE_VOCAB * SIZE_BLOCK * DIM_EMBEDDINGS * size_batch;
    model->activations.hidden = model->activations.pre_hidden 
    + SIZE_HIDDEN * size_batch;
    model->activations.output = model->activations.hidden
    + size_batch * SIZE_HIDDEN;
    model->activations.probs = model->activations.output
    + size_batch * SIZE_VOCAB;

    model->gradients.pre_activations_output = model->activations.probs + size_batch * SIZE_VOCAB;
    model->gradients.weights_output = model->gradients.pre_activations_output + size_batch * SIZE_VOCAB;
    // bias pointer
    model->gradients.biases_output = model->gradients.weights_output + size_batch * SIZE_HIDDEN * SIZE_VOCAB;
    model->gradients.activations_hidden = model->gradients.biases_output + size_batch * SIZE_VOCAB;
    model->gradients.pre_activations_hidden = model->gradients.activations_hidden + size_batch * SIZE_HIDDEN;
    model->gradients.weights_hidden = model->gradients.pre_activations_hidden + size_batch * SIZE_HIDDEN;
    model->gradients.biases_hidden = model->gradients.weights_hidden + size_batch * SIZE_HIDDEN * SIZE_BLOCK * DIM_EMBEDDINGS;
    model->gradients.activations_embeddings = model->gradients.biases_hidden + size_batch * SIZE_HIDDEN;
    model->gradients.weights_embeddings = model->gradients.activations_embeddings + size_batch * SIZE_BLOCK * DIM_EMBEDDINGS;



    model->size_batch = size_batch;
}

void initialise_model(Model *model)
{
    size_t size_params = SIZE_VOCAB * DIM_EMBEDDINGS 
    + SIZE_HIDDEN
    + SIZE_BLOCK * DIM_EMBEDDINGS * SIZE_HIDDEN
    + SIZE_VOCAB
    + SIZE_HIDDEN * SIZE_VOCAB;

    srand(42);

    for (int i = 0; i < size_params; i++)
    {
        //*(model->parameters.table_embedding + i) = generate_normal_random_number();
        *(model->parameters.table_embedding + i) = 1.0;
    }
}


void embed_tokens(Model * model, char * tokens, size_t size_batch){
    for (size_t idx_token = 0; idx_token < size_batch * SIZE_BLOCK; idx_token++){
        for (size_t idx_embed_dim = 0; idx_embed_dim < DIM_EMBEDDINGS; idx_embed_dim++){
            size_t idx_activation_input = idx_token * DIM_EMBEDDINGS + idx_embed_dim;
            int code_char = encode(tokens[idx_token]);
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

/*

xxx   x  yyyyy
xxx      yyyyy
         yyyyy

zzzz
zzzz

*/

void mat_mul_forward(const float * matrix_inputs, size_t size_batch, size_t size_inputs,
                     const float * matrix_weights, const float * matrix_biases, size_t size_neurons, float * matrix_output)
{
    // #pragma omp parallel for collapse(2)
    for (size_t idx_batch = 0; idx_batch < size_batch; idx_batch++ ){
        for (size_t idx_neuron = 0; idx_neuron < size_neurons; idx_neuron++){
            size_t offset_neural_activation = idx_batch * size_neurons + idx_neuron;
            if (matrix_biases != NULL){
                matrix_output[offset_neural_activation] = matrix_biases[idx_neuron];
            }
            else {
                matrix_output[offset_neural_activation] = 0.0;
            }
            for (size_t idx_weight = 0; idx_weight < size_inputs; idx_weight++){
                size_t offset_weight_factor = idx_neuron * size_inputs + idx_weight;
                size_t offset_input_factor = idx_batch * size_inputs + idx_weight;
                matrix_output[offset_neural_activation] += matrix_inputs[offset_input_factor]
                  * matrix_weights[offset_weight_factor];
            }
        }
    }
}

void tanh_forward(float * matrix_input, float * matrix_output, size_t size_activations, size_t size_batch){
    for (size_t idx_batch = 0; idx_batch < size_batch; idx_batch++){
        for (size_t idx_activation = 0; idx_activation < size_activations; idx_activation++){
            size_t offset_activation = idx_batch * size_activations + idx_activation;
            matrix_output[offset_activation] = tanh(matrix_input[offset_activation]);
        }
    }
}

void softmax_forward(float * logits, float * probs, size_t size_batch){
    //exp logits:
    for (size_t idx_batch = 0; idx_batch < size_batch; idx_batch++){
        // each logits & probs row

        // find the max logit
        float max_logit = logits[idx_batch * SIZE_VOCAB];

        for (size_t idx_logit = 0; idx_logit < SIZE_VOCAB; idx_logit++){
            size_t offset_logit = idx_batch * SIZE_VOCAB + idx_logit;
            if (logits[offset_logit] > max_logit){
                max_logit = logits[offset_logit];
            }
        }

        // exponentiate logits and accumulate softmax denominator
        float softmax_denominator = 0.0;
        for (int j = 0; j < SIZE_VOCAB; j++){
            probs[(idx_batch * SIZE_VOCAB) + j] = exp(logits[(idx_batch * SIZE_VOCAB) + j] - max_logit);
            softmax_denominator += probs[(idx_batch * SIZE_VOCAB) + j];
        }
        // normalise exponentiated logits:
        for (int j = 0; j < SIZE_VOCAB; j++){
            probs[(idx_batch * SIZE_VOCAB) + j] = probs[(idx_batch * SIZE_VOCAB) + j] / softmax_denominator;
        }

    }

}

void model_forward(Model * model, char * tokens, size_t size_batch ){ 
    clock_t begin = clock();

    embed_tokens(model, tokens, size_batch);
    mat_mul_forward(model->activations.input, size_batch, DIM_EMBEDDINGS * SIZE_BLOCK, 
        model->parameters.weights_hidden, model->parameters.biases_hidden,
    SIZE_HIDDEN, model->activations.hidden);
    float after_mm_hidden = model->parameters.biases_output[0];
    tanh_forward(model->activations.hidden, model->activations.hidden, SIZE_HIDDEN, model->size_batch);
        float before_w = model->parameters.biases_output[0];

    mat_mul_forward(model->activations.hidden, size_batch, SIZE_HIDDEN, model->parameters.weights_output, 
    model->parameters.biases_output, SIZE_VOCAB, model->activations.output);
    softmax_forward(model->activations.output, model->activations.probs, model->size_batch);
    clock_t end = clock();
    double time_spent = (end - begin)/CLOCKS_PER_SEC;
}

float cross_entropy_loss(float * probs, char * labels, size_t size_batch){
    static float prev_loss = 100;
    float batch_loss = 0.0;
    for (int idx_batch = 0; idx_batch < size_batch; idx_batch++){
        size_t offset_predicted_prob_for_expected_token = idx_batch * SIZE_VOCAB + encode(labels[idx_batch]);
        float prob = probs[offset_predicted_prob_for_expected_token];
        //printf("\nprob [%d] = %f\n", offset_predicted_prob_for_expected_token, prob);
        printf("\ncorrect index is %d\n", offset_predicted_prob_for_expected_token);
        int offset_batch = idx_batch * SIZE_VOCAB;
        printf("\nprob [%d] = %f\n", offset_batch,  probs[idx_batch * SIZE_VOCAB + 0]);
        printf("\nprob [%d] = %f\n", offset_batch + 1,  probs[idx_batch * SIZE_VOCAB + 1]);
        batch_loss += log(probs[offset_predicted_prob_for_expected_token]) * -1;
    }
    float loss = batch_loss/size_batch;
    if (loss > prev_loss){
        printf("\n new loss is greater: %f\n", loss);
        exit(0);
    }
    else {
        prev_loss = loss;
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
            size_t offset_grad_logit = idx_batch * SIZE_VOCAB + idx_vocab;
            grads_logit[offset_grad_logit] = probs[offset_grad_logit] - label;
        }
    }
}

/*
dLoss/dZ = dLoss/dAct * dAct/dZ 
dAct/dZ = 1 - tanh2(Z)
*/
void tanh_backward(const float * activations, float * grads_pre_activations, const float * grads_activations, const float * pre_activations,
 size_t size_neurons, size_t size_batch){
    for (size_t idx_batch = 0; idx_batch < size_batch; idx_batch++){
        for (size_t idx_neuron = 0; idx_neuron < size_neurons; idx_neuron++){
            size_t offset_grad = idx_batch * size_neurons + idx_neuron;
            grads_pre_activations[offset_grad] = grads_activations[offset_grad] * (1 - pow(tanh(pre_activations[offset_grad]),2));
        }
    }
}

/*
x1 x2 x3
*
w1 w2  w3  w4
w5 w6  w7  w8
w9 w10 w11 w12
=
z1 z2 z3 z4

z1 = x1 * w1 + x2 * w5 + x3 * w9
z2 = x1 * w2 + x2 * w6 + x3 * w10
z3 = x1 * w3 + x2 * w7 + x3 * w11
z2 = x1 * w4 + x8 * w6 + x3 * w12

L = y1 * SM(z1) + y2 * SM(z2) + y3 * SM(z3) + y4 * SM(z4)


dL/w6 = dL/dz1 * dz1/dw6 + dL/z2 * dz2/dw6 + dL/z3 * dz3/dw6  + dL/z4 * dz4/dw6

dL/z1 = SM(z1) - y1
dL/z2 = SM(z2) - y2

dz1/dw6 = 0
dz2/dw6 = x2

dL/dw6 = DL/dz2 * dz2/dw6 + DL
dL/d

dz2/dx2 = w6
dz1/dx2 = w5


*/

void matmul_backward(const float * grads_z, float * grads_w, float * grads_b, const float * input_activations, const float * weights, 
                     float * grads_input_activations, size_t size_batch, size_t size_neurons, size_t size_input_activations){ 
    for (size_t idx_batch = 0; idx_batch < size_batch; idx_batch++){
        for (size_t idx_neuron = 0; idx_neuron < size_neurons; idx_neuron++){
            size_t offset_grad_z = idx_batch * size_neurons + idx_neuron;
            float grad_z = grads_z[offset_grad_z];
            if (grads_b){
                grads_b[offset_grad_z] = grad_z;
            }
            for (size_t idx_weight = 0; idx_weight < size_input_activations; idx_weight++){
                size_t offset_input_activation_grad = idx_batch * size_input_activations + idx_weight; 
                float input_activation = input_activations[offset_input_activation_grad];
                size_t offset_weight = size_neurons * idx_neuron + idx_weight;
                float weight = weights[offset_weight];
                size_t offset_grad_w = idx_batch * size_neurons * size_input_activations + idx_neuron * size_input_activations + idx_weight;
                grads_w[offset_grad_w] = grad_z * input_activation;
                grads_input_activations[offset_input_activation_grad] += grad_z * weight;
            }
        }
    }
}

/*
A => w1,w2
B => w3,w4
c => w4,w5
d => w6,w7
e => w8,w9
f =>  w10,w11


Cab => w4,w5,w1,w2,w3,w4


Dw4/dw1 = 0
Dw4/dw4 = 1

*/
void embedding_backwards(float * grads_z, float * grads_w, const char * inputs, size_t size_activations, 
size_t  size_grads_w, size_t size_inputs, size_t size_batch){
    for (size_t idx_batch = 0; idx_batch < size_batch; idx_batch++){
        for (size_t idx_input = 0; idx_input < size_inputs; idx_input++){
            size_t offset_input = idx_batch * size_inputs + idx_input;
            size_t offset_grad = idx_batch * size_grads_w + encode(inputs[offset_input]) * DIM_EMBEDDINGS;
            for (size_t idx_dim = 0; idx_dim < DIM_EMBEDDINGS; idx_dim++){
                grads_w[offset_grad + idx_dim] = grads_z[offset_grad + idx_dim];
            }
        }
    }
}


void update_weights(Model * model, size_t size_batchs){    
    for (size_t idx_embedding_weight = 0; idx_embedding_weight < SIZE_VOCAB * DIM_EMBEDDINGS; idx_embedding_weight++){
        float delta_embedding = 0.0;
        for (size_t idx_batch = 0; idx_batch < size_batchs; idx_batch++){
            size_t offset_grad = idx_batch * SIZE_VOCAB * DIM_EMBEDDINGS + idx_embedding_weight;
            delta_embedding += model->gradients.weights_embeddings[offset_grad];
        }
        delta_embedding /= size_batchs;
        model->parameters.table_embedding[idx_embedding_weight] -= delta_embedding * LEARNING_RATE;
    }



    for (size_t idx_hidden_bias = 0; idx_hidden_bias < SIZE_HIDDEN; idx_hidden_bias++){
        float delta_hidden_biase = 0.0;
        for (size_t idx_batch = 0; idx_batch < size_batchs; idx_batch++){
            size_t offset_grad = idx_batch * SIZE_HIDDEN + idx_hidden_bias;
            delta_hidden_biase += model->gradients.biases_hidden[offset_grad];
        }
        delta_hidden_biase /= size_batchs;
        model->parameters.biases_hidden[idx_hidden_bias] -= delta_hidden_biase * LEARNING_RATE;
    }

    for (size_t idx_hidden_weight = 0; idx_hidden_weight < SIZE_HIDDEN * DIM_EMBEDDINGS * SIZE_BLOCK; idx_hidden_weight++){
        float delta_hidden = 0.0;
        for (size_t idx_batch = 0; idx_batch < size_batchs; idx_batch++){
            size_t offset_grad = idx_batch * SIZE_HIDDEN * DIM_EMBEDDINGS * SIZE_BLOCK + idx_hidden_weight;
            delta_hidden += model->gradients.weights_hidden[offset_grad];
        }
        delta_hidden /= size_batchs;
        model->parameters.weights_hidden[idx_hidden_weight] -= delta_hidden * LEARNING_RATE;        
    }

    for (size_t idx_output_bias = 0; idx_output_bias < SIZE_VOCAB; idx_output_bias++){
        float delta_output_bias = 0;
        for (size_t idx_batch = 0; idx_batch < size_batchs; idx_batch++){
            size_t offset_grad = idx_batch * SIZE_VOCAB + idx_output_bias;
            delta_output_bias += model->gradients.biases_output[offset_grad];
        }
        delta_output_bias /= size_batchs;
        model->parameters.biases_output[idx_output_bias] -= delta_output_bias * LEARNING_RATE;
    }

    for (size_t idx_output_weight = 0; idx_output_weight < SIZE_VOCAB * SIZE_HIDDEN; idx_output_weight++){
        float delta_output_weight = 0;
        for (size_t idx_batch = 0; idx_batch < size_batchs; idx_batch++){
            size_t offset_grad = idx_batch * size_batchs * SIZE_HIDDEN * SIZE_VOCAB + idx_output_weight;
            delta_output_weight += model->gradients.weights_output[offset_grad];
        }
        delta_output_weight /= size_batchs;
        printf("\n delta output = %f \n", delta_output_weight);
        model->parameters.weights_output[idx_output_weight] -= delta_output_weight * LEARNING_RATE;
    }
}


void model_backwards(Model * model, TrainingSet * training_set){
    printf("\n backwards pass ...\n");
    clock_t begin, end;
    double time_spent;
    begin = clock();
    memset(model->gradients.pre_activations_output, 0, training_set->size * ( SIZE_VOCAB * DIM_EMBEDDINGS //embeddings weights
    + SIZE_BLOCK * DIM_EMBEDDINGS // embedding activations
    + SIZE_BLOCK * DIM_EMBEDDINGS * SIZE_HIDDEN  // hidden weights
    + SIZE_HIDDEN // hidden biases
    + SIZE_HIDDEN * 2 // hidden pre-activations and activations
    + SIZE_HIDDEN * SIZE_VOCAB // output weights
    + SIZE_VOCAB //output biases
    + SIZE_VOCAB)
    );
    loss_softmax_backward(training_set->Y, model->activations.probs, model->gradients.pre_activations_output, model->size_batch);
    matmul_backward(model->gradients.pre_activations_output, model->gradients.weights_output, model->gradients.biases_output,
    model->activations.hidden, model->parameters.weights_output, model->gradients.activations_hidden, training_set->size, SIZE_VOCAB, SIZE_HIDDEN);
    tanh_backward(model->activations.hidden, model->gradients.pre_activations_hidden, model->gradients.activations_hidden,
     model->activations.pre_hidden, SIZE_VOCAB, training_set->size);
    matmul_backward(model->gradients.pre_activations_hidden, model->gradients.weights_hidden, model->gradients.biases_hidden, 
    model->activations.input, model->parameters.weights_hidden, model->gradients.activations_embeddings, training_set->size,
    SIZE_HIDDEN, SIZE_BLOCK * DIM_EMBEDDINGS);
    embedding_backwards(model->activations.input, model->gradients.weights_embeddings, training_set->X, SIZE_BLOCK * DIM_EMBEDDINGS,
     DIM_EMBEDDINGS * SIZE_VOCAB, SIZE_BLOCK, training_set->size);
    update_weights(model, training_set->size);
    end = clock();

    time_spent = (double)(end - begin) / CLOCKS_PER_SEC;
    // printf("\t ... took %2lf seconds.\n", time_spent);
    float after_w = model->parameters.biases_output[0];
}


int sample_from_multinomial(float* probabilities, int size) {
    float r = ((float) rand() / (RAND_MAX));
    float cumulative_probability = 0.0;

    for (int i = 0; i < size; i++) {
        cumulative_probability += probabilities[i];
        if (r < cumulative_probability) {
            return i;
        }
    }
    return size - 1; // Return the last index if none is selected (to handle rounding errors)
}

void generate(Model *model, int number_of_names){
    printf("\n\nGenerating names....\n\n");
    for (int i = 0; i < number_of_names; i++){
        char input_tokens[SIZE_BLOCK];
        for (size_t idx_token = 0; idx_token < SIZE_BLOCK; idx_token++){
            input_tokens[idx_token] = '.';
        }
        model_forward(model, input_tokens, 1);
        char predicted_char = decode(sample_from_multinomial(model->activations.probs, SIZE_VOCAB));
        while (predicted_char != '.'){
            printf("%c", predicted_char);
            fflush(stdout);
            for (size_t idx_token = 0; idx_token < SIZE_BLOCK - 1; idx_token++){
                input_tokens[idx_token] = input_tokens[idx_token + 1];
            }
            input_tokens[SIZE_BLOCK - 1] = predicted_char;
            model_forward(model, input_tokens, 1);
            predicted_char = decode(sample_from_multinomial(model->activations.probs, SIZE_VOCAB));            
        }
         printf("\n");
    }
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
    // print_model(&model);
    

    // generate
    // generate(&model, 5);

    //training loop
    for (int idx_epoch = 0; idx_epoch < NUM_EPOCHS; idx_epoch++){
        printf("\nepoch %d \n", idx_epoch);
        model_forward(&model, training_set->X, training_set->size);
        printf("\n");

        for (int i = 0; i < 4; i++){
          printf(""); 
        }

        
        printf("\n");
        printf("\n");
        printf("\nloss = %f\n", cross_entropy_loss(model.activations.probs, training_set->Y, training_set->size));
        model_backwards(&model, training_set);
    }

    // generate after training
    // generate(&model, 5);

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
