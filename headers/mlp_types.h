#ifndef size_t
#include<stdlib.h>
#endif

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
    size_t size_input, size_output;
    float * weights, biases;
} Layer;

typedef struct 
{
    Layer layer_embedding;
    Layer layer_hidden;
    Layer layer_output;
} Parameters;

typedef struct
{

} Activations;

#endif // STRUCTS_H

#define VOCAB_SIZE 27
#define BLOCK_SIZE 3
#define INITIAL_SIZE 1000 // Initial number of strings
#define MAX_LENGTH 256  // Maximum length of each string
#define NUM_EPOCHS 10
#define LEARNING_RATE 0.1

