#ifndef size_t
#include<stdlib.h>
#endif


#define SIZE_VOCAB 27
#define SIZE_BLOCK 3
#define SIZE_HIDDEN 100
#define INITIAL_SIZE 1000 // Initial number of strings
#define MAX_LENGTH 256  // Maximum length of each string
#define NUM_EPOCHS 10
#define LEARNING_RATE 0.1
#define DIM_EMBEDDINGS 2
#define SIZE_BATCH 32



#ifndef STRUCTS_H
#define STRUCTS_H

typedef struct 
{
    size_t size;
    char * X; // input sequence e.g. "emm","mma" where block size is 3
    char * Y; // label e.g "a", "."
} TrainingSet;


typedef struct 
{
    float * table_embedding;
    float * layer_hidden;
    float * layer_output;
} Parameters;

typedef struct
{
    float * activations_hidden;
    float * activations_output;
    float * activations_probs;

} Activations;


typedef struct 
{
  float * grads_embeddings;
  float * grads_hidden;
  float * grads_output;  
} Gradients;


typedef struct 
{
    size_t size_batch;
    Parameters parameters;
    Activations activations;
} MLP;


#endif // STRUCTS_H


