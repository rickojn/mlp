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
    int ts_idx = 0;

    for (int n_idx = 0; n_idx < name_count; n_idx++){
        name = names[n_idx];
        int name_len = strlen(name);
        strcpy((training_set->X) + (ts_idx * SIZE_BLOCK), x_padding);
        for (int c_idx = 0; c_idx < name_len +1; c_idx++){
            char c = name[c_idx];
            if (c != '\0'){
                training_set->Y[ts_idx] = name[c_idx];
            }
            else {
                training_set->Y[ts_idx] = '.';
            }
            // [...]
            // [.....e]
            // [.....e.em]
            ts_idx++;
            for (int x_idx = 0; x_idx < SIZE_BLOCK - 1; x_idx++){
                training_set->X[ts_idx * SIZE_BLOCK + x_idx] =
                    training_set->X[(ts_idx - 1) * SIZE_BLOCK + x_idx + 1];
                }
            training_set->X[(ts_idx * SIZE_BLOCK) + SIZE_BLOCK - 1 ] = c;
        }
    }

    return training_set;
}


void create_model(MLP * model, size_t size_batch){    
    size_t size_model_params_memory = SIZE_VOCAB * DIM_EMBEDDINGS
    + SIZE_BLOCK * DIM_EMBEDDINGS * SIZE_HIDDEN
    + SIZE_HIDDEN * SIZE_VOCAB; 

    size_t size_model_activations = size_batch * (SIZE_BLOCK * DIM_EMBEDDINGS
    + SIZE_HIDDEN
    + SIZE_VOCAB * 2);

    size_t size_model_gradients = SIZE_BATCH * (SIZE_VOCAB * DIM_EMBEDDINGS
    + SIZE_BLOCK * DIM_EMBEDDINGS * SIZE_HIDDEN
    + SIZE_HIDDEN * SIZE_VOCAB);

    size_t size_model_memory = size_model_params_memory + size_model_activations + size_model_gradients;
    float * model_memory = calloc(size_model_memory, sizeof(float));

    model->parameters.table_embedding = model_memory;
    model->parameters.layer_hidden = model_memory + SIZE_VOCAB * DIM_EMBEDDINGS;
    model->parameters.layer_output= model->parameters.layer_hidden + SIZE_BLOCK * DIM_EMBEDDINGS * SIZE_HIDDEN;
    
    model->activations.input = model->parameters.layer_output + SIZE_HIDDEN * SIZE_VOCAB;
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

void initialise_model(MLP *model)
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


void embed_tokens(MLP * model, TrainingSet * training_set ){
    for (size_t idx_token = 0; idx_token < training_set->size; idx_token++){
        for (size_t idx_embed_dim = 0; idx_embed_dim < DIM_EMBEDDINGS; idx_embed_dim++){
            model->activations.input[idx_token * DIM_EMBEDDINGS + idx_embed_dim] = 
            model->parameters.table_embedding[encode(training_set->X[idx_token]) + idx_embed_dim];
        }        
    }
}

void model_forward(MLP * model, TrainingSet * training_set ){ // need to change params
    embed_tokens(model, training_set);
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
    print_training_set(training_set, 32);

    // create model
    printf("\ncreating model ...\n");
    MLP model;
    create_model(&model, training_set->size);
    printf("\n... model created.\n");
    
    // initialise model
    printf("\ninitialising model ....\n");
    initialise_model(&model);
    printf("\nmodel initialised ....\n");

    print_embeddings(&model);
    model_forward(&model, training_set);

    print_token_embeddings(&model, training_set);
    
    return 0;
}
