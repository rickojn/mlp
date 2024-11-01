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
    float * weights_hidden;
    float * biases_hidden;
    float * weights_output;
    float * biases_output;
} Parameters;

typedef struct
{
    float * input;
    float * hidden;
    float * output;
    float * probs;

} Activations;


typedef struct 
{
  float * embeddings;
  float * hidden;
  float * output;  
} Gradients;


typedef struct 
{
    size_t size_batch;
    Parameters parameters;
    Activations activations;
    Gradients gradients;
} MLP;


#endif // STRUCTS_H


