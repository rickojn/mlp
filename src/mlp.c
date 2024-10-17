#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <omp.h>
#include <time.h>
#include <dirent.h>
#include <sys/stat.h>

#ifndef M_PI
#define M_PI 3.14159265358979323846
#endif

#define VOCAB_SIZE 27
#define BLOCK_SIZE 3
#define INITIAL_SIZE 1000 // Initial number of strings
#define MAX_LENGTH 256  // Maximum length of each string
#define NUM_EPOCHS 10
#define LEARNING_RATE 0.1

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

int encode(char c){
    if (c=='.'){
        return 0;
    }
    else {
        return c- 'a' + 1;
    }
}

char decode(int code){
    if (code == 0){
        return '.';
    }
    else {
        return code + 'a' -1; 
    }
}


int main()
{
    char ** names = NULL;
    int count = readNames(&names, "/home/patrick/coding/mlp/training/names.txt");
    printf("\n%d names loaded\n", count);
    return 0;
}
