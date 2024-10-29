#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <math.h>
#include "../headers/mlp_types.h"

#ifndef M_PI
#define M_PI 3.14159265358979323846
#endif

void print_training_set(TrainingSet * training_set, size_t number_samples){
    for (int i = 0; i < number_samples; i++)
    {
        for (int j = 0; j < SIZE_BLOCK; j++)
        {
            printf("%c", training_set->X[i * SIZE_BLOCK + j]);
        }
        printf(" --> %c", training_set->Y[i]);
        printf("\n");
    }
}

int readNames(char ***names, const char *filename){
    FILE *file;
    char buffer[MAX_LENGTH];
    int count = 0;
    int capacity = INITIAL_SIZE;

    // Open the file for reading
    file = fopen(filename, "r");
    if (file == NULL) {
        printf("Error opening file %s", filename);
        return 1;
    }

    // Allocate initial memory for the array of strings
    *names = malloc(capacity * sizeof(char *));
    if (*names == NULL) {
        perror("Error allocating memory");
        fclose(file);
        return 1;
    }

    // Read strings from the file into the array
    while (fgets(buffer, MAX_LENGTH, file) != NULL) {
        // Remove the newline character if present
        buffer[strcspn(buffer, "\n")] = '\0';

        // Check if we need to reallocate memory
        if (count >= capacity) {
            capacity *= 2;
            *names = realloc(*names, capacity * sizeof(char *));
            if (*names == NULL) {
                perror("Error reallocating memory");
                fclose(file);
                return 1;
            }
        }

        // Allocate memory for the string and copy it from the buffer
        (*names)[count] = malloc((strlen(buffer) + 1) * sizeof(char));
        if ((*names)[count] == NULL) {
            perror("Error allocating memory for string");
            fclose(file);
            return 1;
        }
        strcpy((*names)[count], buffer);
        count++;
    }

    // Close the file
    fclose(file);
    return count;

}

float generate_normal_random_number()
{
    // 2 uniformly distributed random numbers between 0 and 1
    float u1 = ((float)rand() / RAND_MAX);
    float u2 = ((float)rand() / RAND_MAX);

    // use Box-Muller to return a normally distributed number
    return sqrt(-2.0 * log(u1)) * cos(2.0 * M_PI * u2);
}


int encode(char c)
{
    if (c == '.')
    {
        return 0;
    }
    else
    {
        return c - 'a' + 1;
    }
}


void print_embeddings(MLP * model){
    printf("\n.\t");
    printf("%f\t", model->parameters.table_embedding[0]);
    printf("%f\n", model->parameters.table_embedding[1]);
    for (size_t idx_vocab = 0; idx_vocab < SIZE_VOCAB - 1; idx_vocab++){
        printf("\n%c \t", 'a' + idx_vocab);
        for (size_t idx_embed_dim = 0; idx_embed_dim < DIM_EMBEDDINGS; idx_embed_dim++){
            printf("%f\t", model->parameters.table_embedding[(idx_vocab + 1) * DIM_EMBEDDINGS + idx_embed_dim]);
        }
        printf("\n");
    }
}

void print_token_embeddings(MLP * model, TrainingSet * training_set){
    for (size_t idx_sample = 0; idx_sample < training_set->size; idx_sample++){
        printf("\nsample %ld:\n", idx_sample);
        for (int idx_char = 0; idx_char < SIZE_BLOCK; idx_char++){
            printf("%c\t", training_set->X[idx_sample * SIZE_BLOCK + idx_char]);
            for (int idx_dim = 0; idx_dim < DIM_EMBEDDINGS; idx_dim++){
                printf("%f\t", model->activations.input[idx_sample * SIZE_BLOCK + idx_char * DIM_EMBEDDINGS + idx_dim]);
            }
        }
    }
    printf("\n");
}