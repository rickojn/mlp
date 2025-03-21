#include "./mlp_types.h"
void print_training_set(TrainingSet * training_set, size_t number_samples);
int readNames(char ***names, const char *filename);
float generate_normal_random_number();
float generate_xavier_number(size_t inputs, size_t outputs);
size_t get_size_model_params_memory();
char decode(int code);
int encode(char c);
void print_embeddings(Model * model);
void print_token_embeddings(Model * model, TrainingSet * training_set);
void print_model(Model * model);