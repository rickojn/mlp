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

void embed_tokens(Model * model, char * tokens, size_t size_tokens){
    for (size_t idx_batch = 0; idx_batch < size_tokens; idx_batch ++){
        for (size_t idx_token = 0; idx_token < SIZE_BLOCK; idx_token++){
            size_t offset_embedding_activation = idx_batch * SIZE_BLOCK * DIM_EMBEDDINGS +idx_token;
            size_t offset_token = idx_batch * SIZE_BLOCK + idx_token;
            size_t idx_embedding = encode(tokens[offset_token]);
            for (size_t idx_dim = 0; idx_dim < DIM_EMBEDDINGS; idx_dim++){
                model->activations.input[offset_embedding_activation + idx_dim] = model->parameters.table_embedding[idx_embedding + idx_dim];
            }
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

void matmul_forward(const float * inputs, const float * weights, const float * biases, float * outputs, 
    size_t size_neurons, size_t size_inputs, size_t size_batch){
        for (size_t idx_batch = 0; idx_batch <  size_batch; idx_batch++){
            for (size_t idx_input = 0; idx_input < size_inputs; idx_input++){                
                // TBC
                float output = 0;
                for (size_t idx_neuron = 0; idx_neuron < size_neurons; idx_neuron++){

                }
            }
        }
}
    

void model_forward(Model * model, char * tokens, size_t size_batch ){ 
    clock_t begin = clock();
    embed_tokens(model, tokens, model->size_batch);
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

void model_backwards(Model * model, TrainingSet * training_set){
    printf("\n backwards pass ...\n");
    clock_t begin, end;
    double time_spent;
    begin = clock();
   end = clock();

    time_spent = (double)(end - begin) / CLOCKS_PER_SEC;
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
        printf("\n");
        model_forward(&model, training_set->X, training_set->size);


        printf("\n");
        printf("\n");
        printf("\nloss = %f\n", cross_entropy_loss(model.activations.probs, training_set->Y, training_set->size));
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
