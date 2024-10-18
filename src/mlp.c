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

TrainingSet * createTrainingSet(char **names, int name_count){
    
    TrainingSet * training_set = malloc(sizeof(TrainingSet));

    training_set->size = 0;

    for (int i = 0; i < name_count; i++){
        training_set->size+= strlen(names[i]) +1;
    }

    training_set->X = (char*)malloc(training_set->size * BLOCK_SIZE * sizeof(char));
    training_set->Y = (char*)malloc(training_set->size * sizeof(char));


    // assume block size = 3
    // X = ["...", "..e", ".em","emm", "mma" ]
    // Y = ['e', 'm', 'm', 'a', '.']

    char x_padding[BLOCK_SIZE];
    for (int i = 0; i < BLOCK_SIZE; i++){
        x_padding[i] = '.';
    } 
    char *name = NULL;
    int ts_idx = 0;

    for (int n_idx = 0; n_idx < name_count; n_idx++){
        name = names[n_idx];
        int name_len = strlen(name);
        strcpy((training_set->X) + (ts_idx * BLOCK_SIZE), x_padding);
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
            for (int x_idx = 0; x_idx < BLOCK_SIZE - 1; x_idx++){
                training_set->X[ts_idx * BLOCK_SIZE + x_idx] =
                    training_set->X[(ts_idx - 1) * BLOCK_SIZE + x_idx + 1];
                }
            training_set->X[(ts_idx * BLOCK_SIZE) + BLOCK_SIZE - 1 ] = c;
        }
    }

    return training_set;
}



int main()
{
    char ** names = NULL;
    int count = readNames(&names, "/home/patrick/coding/mlp/training/names.txt");
    printf("\n%d names loaded\n", count);
    TrainingSet * trainingSet = createTrainingSet(names, count);
    for (int i = 0; i < 50; i++){
        for (int j = 0; j < BLOCK_SIZE; j++){
            printf("%c",trainingSet->X[i * BLOCK_SIZE + j]);
        }
        printf(" --> %c", trainingSet->Y[i]);
        printf("\n");
    }

    return 0;
}
