#include <stdio.h>
#include "../headers/mlp_types.h"

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
