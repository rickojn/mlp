#include <stdio.h>
#include <string.h>
#include <stdlib.h>
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

int readNames(char ***names, char *filename){
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
