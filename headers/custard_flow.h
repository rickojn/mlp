#include "./mlp_types.h"
void print_training_set(TrainingSet * training_set, size_t number_samples);
int readNames(char ***names, const char *filename);
float generate_normal_random_number();
int encode(char c);
void print_embeddings(MLP * model);
void print_token_embeddings(MLP * model, TrainingSet * training_set);