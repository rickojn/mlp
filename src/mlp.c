#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <omp.h>
#include <time.h>
#include <dirent.h>
#include <sys/stat.h>
#include "../headers/mlp_types.h"
#include "../headers/custard_flow.h"

#ifndef M_PI
#define M_PI 3.14159265358979323846
#endif







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

    training_set->X = (char*)malloc(training_set->size * SIZE_BLOCK * sizeof(char));
    training_set->Y = (char*)malloc(training_set->size * sizeof(char));


    // assume block size = 3
    // X = ["...", "..e", ".em","emm", "mma" ]
    // Y = ['e', 'm', 'm', 'a', '.']

    char x_padding[SIZE_BLOCK];
    for (int i = 0; i < SIZE_BLOCK; i++){
        x_padding[i] = '.';
    } 
    char *name = NULL;
    int idx_training_sample = 0;

    for (int idx_name = 0; idx_name < name_count; idx_name++){
        name = names[idx_name];
        int name_len = strlen(name);
        strcpy((training_set->X) + (idx_training_sample * SIZE_BLOCK), x_padding);
        for (int idx_char_in_name = 0; idx_char_in_name < name_len +1; idx_char_in_name++){
            char character = name[idx_char_in_name];
            if (character != '\0'){
                training_set->Y[idx_training_sample] = character;
            }
            else {
                training_set->Y[idx_training_sample] = '.';
            }
            // [...]
            // [.....e]
            // [.....e.em]
            if (idx_char_in_name != 0)
            {
                for (int x_idx = 0; x_idx < SIZE_BLOCK - 1; x_idx++)
                {
                    training_set->X[idx_training_sample * SIZE_BLOCK + x_idx] =
                        training_set->X[(idx_training_sample - 1) * SIZE_BLOCK + x_idx + 1];
                }
                training_set->X[(idx_training_sample * SIZE_BLOCK) + SIZE_BLOCK - 1] = name[idx_char_in_name - 1];
            }
            idx_training_sample++;
        }
    }

    return training_set;
}


void create_model(Model * model, size_t size_batch){    
    size_t size_model_params_memory = SIZE_VOCAB * DIM_EMBEDDINGS // embedding table
    + SIZE_BLOCK * DIM_EMBEDDINGS * SIZE_HIDDEN // hidden weights
    + SIZE_HIDDEN // hidden biases
    + SIZE_HIDDEN * SIZE_VOCAB // output weights
    + SIZE_VOCAB; // output biases

    size_t size_model_activations = size_batch * (SIZE_BLOCK * DIM_EMBEDDINGS // inputs
    + SIZE_HIDDEN * 2 // hidden pre and activations
    + SIZE_VOCAB * 2); // output logits and probs

    size_t size_model_gradients = size_batch * (SIZE_VOCAB * DIM_EMBEDDINGS //embeddings weights
    + SIZE_BLOCK * DIM_EMBEDDINGS // embedding activations
    + SIZE_BLOCK * DIM_EMBEDDINGS * SIZE_HIDDEN  // hidden weights
    + SIZE_HIDDEN // hidden biases
    + SIZE_HIDDEN * 2 // hidden pre-activations and activations
    + SIZE_HIDDEN * SIZE_VOCAB // output weights
    + SIZE_VOCAB //output biases
    + SIZE_VOCAB); // output pre-activations

    size_t size_model_memory = size_model_params_memory + size_model_activations + size_model_gradients;
    float * model_memory = calloc(size_model_memory, sizeof(float));
    model->parameters.table_embedding = model_memory;
    model->parameters.weights_hidden = model_memory + SIZE_VOCAB * DIM_EMBEDDINGS;
    model->parameters.biases_hidden = model->parameters.weights_hidden + SIZE_BLOCK * DIM_EMBEDDINGS * SIZE_HIDDEN;
    model->parameters.weights_output = model->parameters.biases_hidden + SIZE_HIDDEN;    
    model->parameters.biases_output = model->parameters.weights_output + SIZE_HIDDEN * SIZE_VOCAB;

    model->activations.input = model->parameters.biases_output + SIZE_VOCAB;
    model->activations.pre_hidden = model->activations.input +  SIZE_BLOCK * DIM_EMBEDDINGS * size_batch;

    model->activations.hidden = model->activations.pre_hidden 
    + SIZE_HIDDEN * size_batch;
    model->activations.output = model->activations.hidden
    + size_batch * SIZE_HIDDEN;
    model->activations.probs = model->activations.output
    + size_batch * SIZE_VOCAB;

    model->gradients.pre_activations_output = model->activations.probs + size_batch * SIZE_VOCAB;
    model->gradients.weights_output = model->gradients.pre_activations_output + size_batch * SIZE_VOCAB;
    // bias pointer
    model->gradients.biases_output = model->gradients.weights_output + size_batch * SIZE_HIDDEN * SIZE_VOCAB;
    model->gradients.activations_hidden = model->gradients.biases_output + size_batch * SIZE_VOCAB;
    model->gradients.pre_activations_hidden = model->gradients.activations_hidden + size_batch * SIZE_HIDDEN;
    model->gradients.weights_hidden = model->gradients.pre_activations_hidden + size_batch * SIZE_HIDDEN;
    model->gradients.biases_hidden = model->gradients.weights_hidden + size_batch * SIZE_HIDDEN * SIZE_BLOCK * DIM_EMBEDDINGS;
    model->gradients.activations_embeddings = model->gradients.biases_hidden + size_batch * SIZE_HIDDEN;
    model->gradients.weights_embeddings = model->gradients.activations_embeddings + size_batch * SIZE_BLOCK * DIM_EMBEDDINGS;



    model->size_batch = size_batch;
}

void initialise_model(Model *model)
{
    size_t size_params = SIZE_VOCAB * DIM_EMBEDDINGS 
    + SIZE_HIDDEN
    + SIZE_BLOCK * DIM_EMBEDDINGS * SIZE_HIDDEN
    + SIZE_VOCAB
    + SIZE_HIDDEN * SIZE_VOCAB;

    srand(42);
    // srand(time(NULL));

    for (int i = 0; i < size_params; i++)
    {
        *(model->parameters.table_embedding + i) = generate_normal_random_number();
        // *(model->parameters.table_embedding + i) = 1.0;
    }
}

void embed_tokens(Model * model, char * tokens, size_t size_tokens){
    for (size_t idx_sample = 0; idx_sample < size_tokens; idx_sample ++){
        for (size_t idx_token = 0; idx_token < SIZE_BLOCK; idx_token++){
            size_t offset_embedding_activation = idx_sample * SIZE_BLOCK * DIM_EMBEDDINGS +idx_token;
            size_t offset_token = idx_sample * SIZE_BLOCK + idx_token;
            size_t idx_embedding_element = encode(tokens[offset_token]) * DIM_EMBEDDINGS;
            for (size_t idx_dim = 0; idx_dim < DIM_EMBEDDINGS; idx_dim++){
                model->activations.input[offset_embedding_activation + idx_dim] = model->parameters.table_embedding[idx_embedding_element + idx_dim];
            }
        }
    }
}

/*

a b c  X  p q r
d e f     s t u
          v w x

=  (a*p + b*s + c*v), (a*q + b*t + c*w), (a*r + b*u + c*x)
   (d*p + e*s + f*v), (d*q + e*t + f*w), (d*r + e*u + f*x)

*/

/*

xxx   x  yyyyy
xxx      yyyyy
         yyyyy

zzzz
zzzz

*/

void matmul_forward(const float * inputs, const float * weights, const float * biases, float * outputs, 
    size_t size_outputs, size_t size_inputs, size_t size_batch){
        for (size_t idx_batch = 0; idx_batch <  size_batch; idx_batch++){
            for (size_t idx_neuron = 0; idx_neuron < size_outputs; idx_neuron++){
                float pre_activation = biases ? biases[idx_neuron] : 0;
                for (size_t idx_input = 0; idx_input < size_inputs; idx_input++){
                    size_t offset_input = idx_batch * size_inputs + idx_input;
                    size_t offset_weight = idx_neuron * size_inputs + idx_input;
                    pre_activation += inputs[offset_input] * weights[offset_weight];
                }
                size_t offset_output = idx_batch * size_outputs + idx_neuron;
                outputs[offset_output] = pre_activation;
            }            
        }
}

void tanh_foward(const float * pre_activations, float * activations, size_t size_neurons, size_t size_batch ){
    for (size_t idx_batch = 0; idx_batch < size_batch; idx_batch++){
        for (size_t idx_neuron = 0; idx_neuron < size_neurons; idx_neuron++){
            size_t offset_activation = idx_batch * size_neurons + idx_neuron;
            activations[offset_activation] = tanh(pre_activations[offset_activation]);
        }
    }
}


void softmax_foward(const float * logits, float * probs, size_t size_batch){
    for (size_t idx_batch = 0; idx_batch < size_batch; idx_batch++){
        size_t offset_batch_start = idx_batch * SIZE_VOCAB;
        float max_logit = logits[offset_batch_start];
        for (size_t idx_logit = 0; idx_logit < SIZE_VOCAB; idx_logit++){
            size_t offset_logit = offset_batch_start + idx_logit;
            if (logits[offset_logit] > max_logit ){
                max_logit = logits[offset_logit];
            }
        }

        float denominator = 0;
        for (size_t idx_logit = 0; idx_logit < SIZE_VOCAB; idx_logit++){
            size_t offset_logit = offset_batch_start + idx_logit;
            float exp_shifted_logit = exp(logits[offset_logit] - max_logit);
            probs[offset_logit] = exp_shifted_logit;
            denominator += exp_shifted_logit;
        }

        for (size_t idx_logit = 0; idx_logit < SIZE_VOCAB; idx_logit++){
            size_t offset_logit = offset_batch_start + idx_logit;
            probs[offset_logit] /= denominator;
        }
    }
}
    

void model_forward(Model * model, char * tokens, size_t size_batch ){ 
    clock_t begin = clock();
    embed_tokens(model, tokens, model->size_batch);
    matmul_forward(model->activations.input, model->parameters.weights_hidden, model->parameters.biases_hidden,
    model->activations.pre_hidden, SIZE_HIDDEN, SIZE_BLOCK * DIM_EMBEDDINGS, size_batch);
    tanh_foward(model->activations.pre_hidden, model->activations.hidden, SIZE_HIDDEN, size_batch);
    matmul_forward(model->activations.hidden, model->parameters.weights_output, model->parameters.biases_output, model->activations.output,
        SIZE_VOCAB, SIZE_HIDDEN, size_batch);
    for (int i = 0; i < 4; i++){
        // printf("\nlogit %d: %f \n",i,model->activations.output[i]);
    }
    softmax_foward(model->activations.output, model->activations.probs, size_batch);
    clock_t end = clock();
    double time_spent = (end - begin)/CLOCKS_PER_SEC;
}

float cross_entropy_loss(float * probs, char * labels, size_t size_batch){
    static float prev_loss = 100;
    float batch_loss = 0.0;
    for (int idx_batch = 0; idx_batch < size_batch; idx_batch++){
        size_t offset_predicted_prob_for_expected_token = idx_batch * SIZE_VOCAB + encode(labels[idx_batch]);
        float prob = probs[offset_predicted_prob_for_expected_token];
        //printf("\nprob [%d] = %f\n", offset_predicted_prob_for_expected_token, prob);
        // printf("\ncorrect index is %d\n", offset_predicted_prob_for_expected_token);
        int offset_batch = idx_batch * SIZE_VOCAB;

        // printf("\nprob [%d] = %f\n", offset_batch,  probs[idx_batch * SIZE_VOCAB + 0]);
        // printf("\nprob [%d] = %f\n", offset_batch + 1,  probs[idx_batch * SIZE_VOCAB + 1]);
        // printf("\nprob [%d] = %f\n", offset_batch + 2,  probs[idx_batch * SIZE_VOCAB + 2]);
        batch_loss += log(probs[offset_predicted_prob_for_expected_token]) * -1;
    }
    float loss = batch_loss/size_batch;
    if (loss > prev_loss){
        printf("\n new loss is greater: %f\n", loss);
        // exit(0);
    }
    else {
        prev_loss = loss;
    }
    prev_loss = loss;
    return batch_loss/size_batch;
}

void loss_softmax_backwards(const char * labels, float * grad_logits, const float * probs, size_t size_batch){
    for (size_t idx_batch = 0; idx_batch < size_batch; idx_batch++){
        for (size_t idx_logit = 0; idx_logit < SIZE_VOCAB; idx_logit++){
            float label = idx_logit == encode(labels[idx_batch]) ? 1.0 : 0.0;
            size_t offset_grad_logit = idx_batch * SIZE_VOCAB + idx_logit;
            float db_prob = probs[offset_grad_logit]; 
            grad_logits[offset_grad_logit] = probs[offset_grad_logit] - label;
            float db_grad_logit = grad_logits[offset_grad_logit];
            int db = 0;
        }
    }
}

/*
x1 x2 x3
*
w1 w2  w3  w4
w5 w6  w7  w8
w9 w10 w11 w12
=
z1 z2 z3 z4

z1 = x1 * w1 + x2 * w5 + x3 * w9
z2 = x1 * w2 + x2 * w6 + x3 * w10
z3 = x1 * w3 + x2 * w7 + x3 * w11
z2 = x1 * w4 + x8 * w6 + x3 * w12

d

L = y1 * SM(z1) + y2 * SM(z2) + y3 * SM(z3) + y4 * SM(z4)


dL/w6 = dL/dz1 * dz1/dw6 + dL/z2 * dz2/dw6 + dL/z3 * dz3/dw6  + dL/z4 * dz4/dw6

dL/z1 = SM(z1) - y1
dL/z2 = SM(z2) - y2

dz1/dw6 = 0
dz2/dw6 = x2

dL/dw6 = DL/dz2 * dz2/dw6 + DL
dL/d

dz2/dx2 = w6
dz1/dx2 = w5


*/



void matmul_backwards(const float * grads_pre_activations, const float * weights, const float * inputs, float * grads_weights,
float * grads_biases, float * grads_inputs, size_t size_neurons, size_t size_inputs, size_t size_batch){
    for (size_t idx_sample = 0; idx_sample < size_batch; idx_sample++){
        for (size_t idx_neuron = 0; idx_neuron < size_neurons; idx_neuron++){
            size_t offset_grad_bias = idx_sample * size_neurons + idx_neuron;
            if (grads_biases){
                float db_1 = grads_pre_activations[offset_grad_bias];
                grads_biases[offset_grad_bias] = grads_pre_activations[offset_grad_bias];
            }
            for (size_t idx_weight = 0; idx_weight < size_inputs; idx_weight++){
                size_t offset_weight = idx_neuron * size_inputs + idx_weight;
                size_t offset_grad_weight = offset_grad_bias * size_inputs + idx_weight;
                size_t offset_grad_input = idx_sample * size_inputs + idx_weight;
                float db_input = inputs[offset_grad_input];
                float db_grad  = grads_pre_activations[offset_grad_bias];
                grads_weights[offset_grad_weight] = inputs[offset_grad_input] * grads_pre_activations[offset_grad_bias];
                grads_inputs[offset_grad_input] += weights[offset_weight] * grads_pre_activations[offset_grad_bias]; //??
            }
        }
    }
}


void tanh_backwards(const float * inputs, float * outputs, size_t size_neurons, size_t size_batch){
    for (size_t idx_batch = 0; idx_batch < size_batch; idx_batch++){
        for (size_t idx_neuron = 0; idx_neuron < size_neurons; idx_neuron++){
            size_t offset_grad = idx_batch * size_batch + idx_neuron;
            float db_input = inputs[offset_grad];
            outputs[offset_grad] = 1 - pow(tanh(inputs[offset_grad]), 2);
            float db_grad = outputs[offset_grad];
            int db = 0;
        }
    }
}

/*

.        .        .
x11,x12, x13,x14, x15,x16
.        .        e
x21,x22, x23,x24, x25,x26



*/


void embedding_backwards(const float * grad_activations, const char * inputs, float * grad_embeddings, size_t size_batch){
    for (size_t idx_block = 0; idx_block < size_batch; idx_block++){
        for (size_t idx_input_token = 0; idx_input_token < SIZE_BLOCK; idx_input_token++){
        // for (size_t idx_input_token = 0; idx_input_token < 1; idx_input_token++){
            size_t offset_input_token = idx_block * SIZE_BLOCK + idx_input_token;
            // size_t offset_input_token = idx_block + idx_input_token;
            size_t idx_token_embedding = encode(inputs[offset_input_token]);
            for (size_t idx_embedding_element = 0; idx_embedding_element < DIM_EMBEDDINGS; idx_embedding_element++){
                size_t offset_grad_embedding_element = idx_block * SIZE_VOCAB * DIM_EMBEDDINGS + 
                    idx_token_embedding * DIM_EMBEDDINGS + idx_embedding_element;
                size_t offset_grad_embedding_activation = offset_input_token * DIM_EMBEDDINGS + idx_embedding_element;
                float db_grad = grad_activations[offset_grad_embedding_activation];
                grad_embeddings[offset_grad_embedding_element] += grad_activations[offset_grad_embedding_activation];
            }
        }
    }
}


void update_weights(Model * model, size_t size_batch){
    float delta = 0.0;
    // update outputs
    for (size_t idx_neuron = 0; idx_neuron < SIZE_VOCAB; idx_neuron++){
        // printf("\n");
        for (size_t idx_batch = 0; idx_batch < size_batch; idx_batch++){
            size_t offset_bias_output = idx_batch * SIZE_VOCAB + idx_neuron;
            // printf(" %f ",model->gradients.biases_output[offset_bias_output]);
            delta += model->gradients.biases_output[offset_bias_output] * LEARNING_RATE;
        }
        // printf("\n");
        // printf("\n total delta = %f \n", delta);
        delta /= size_batch;
        // printf("\n bias [%d] = %f  delta = %f \n", idx_neuron, model->parameters.biases_output[idx_neuron], delta);
        model->parameters.biases_output[idx_neuron] -= delta;
    }

    for (size_t idx_neuron = 0; idx_neuron < SIZE_VOCAB; idx_neuron++ ){
        for (size_t idx_weight = 0; idx_weight < SIZE_HIDDEN; idx_weight++){
            delta = 0.0;
            for (size_t idx_batch = 0; idx_batch < size_batch; idx_batch++){
                size_t offset_batch_weight = idx_batch * SIZE_VOCAB * SIZE_HIDDEN + idx_neuron * SIZE_HIDDEN + idx_weight;
                // printf("\n neuron %zu, weight %zu batch %zu grad: %f\n", idx_neuron, idx_weight, idx_batch, model->gradients.weights_output[offset_batch_weight]);
                delta += model->gradients.weights_output[offset_batch_weight];
            }
            // printf("\nweight delta[%zu] = %f\n", idx_weight, delta);
            delta /= size_batch; 
            size_t offset_weight = idx_neuron * SIZE_HIDDEN + idx_weight;
            float db_weight_before = model->parameters.weights_output[offset_weight];
            model->parameters.weights_output[offset_weight] -= delta * LEARNING_RATE;
            float db_weight_after = model->parameters.weights_output[offset_weight];
            int db = 0;
        }
    }

    //update hidden layer
    delta = 0.0;

        for (size_t idx_neuron = 0; idx_neuron < SIZE_VOCAB; idx_neuron++){
        printf("\n");
        for (size_t idx_batch = 0; idx_batch < size_batch; idx_batch++){
            size_t offset_bias_output = idx_batch * SIZE_VOCAB + idx_neuron;
            // printf(" %f ",model->gradients.biases_output[offset_bias_output]);
            delta += model->gradients.biases_output[offset_bias_output] * LEARNING_RATE;
        }
        // printf("\n");
        // printf("\n total delta = %f \n", delta);
        delta /= size_batch;
        // printf("\n bias [%d] = %f  delta = %f \n", idx_neuron, model->parameters.biases_output[idx_neuron], delta);
        model->parameters.biases_output[idx_neuron] -= delta;
    }

    for (size_t idx_neuron = 0; idx_neuron < SIZE_HIDDEN; idx_neuron++ ){
        for (size_t idx_weight = 0; idx_weight < DIM_EMBEDDINGS * SIZE_BLOCK; idx_weight++){
            delta = 0.0;
            size_t offset_weight = idx_neuron * SIZE_BLOCK * DIM_EMBEDDINGS + idx_weight;
            for (size_t idx_sample = 0; idx_sample < size_batch; idx_sample++){
                size_t offset_grad_weight = idx_sample * SIZE_BLOCK * DIM_EMBEDDINGS * SIZE_HIDDEN + offset_weight;
                // printf("\n neuron %zu, weight %zu batch %zu grad: %f\n", idx_neuron, idx_weight, idx_batch, model->gradients.weights_output[offset_batch_weight]);
                float db_grad = model->gradients.weights_hidden[offset_grad_weight];
                delta += model->gradients.weights_hidden[offset_grad_weight];
                
            }
            // printf("\nweight delta[%zu] = %f\n", idx_weight, delta);
            delta /= size_batch; 
            // float db_weight_before = model->parameters.weights_output[offset_weight];
            model->parameters.weights_hidden[offset_weight] -= delta * LEARNING_RATE;
            // float db_weight_after = model->parameters.weights_output[offset_weight];
            int db = 0;
        }
    }

    print_embedding_table(model);

//    update embedding table
    for (size_t idx_embedding_component = 0; idx_embedding_component < SIZE_VOCAB * DIM_EMBEDDINGS; idx_embedding_component++){
        delta = 0.0;
        for (size_t idx_batch = 0; idx_batch < size_batch; idx_batch++){
            size_t offset_embedding_gradient = idx_batch * SIZE_VOCAB * DIM_EMBEDDINGS + idx_embedding_component;
            delta += model->gradients.weights_embeddings[offset_embedding_gradient];
        }
        delta /= size_batch;
        model->parameters.table_embedding[idx_embedding_component] -= delta * LEARNING_RATE;
    }

    
}


void model_backwards(Model * model, TrainingSet * training_set){
    printf("\n backwards pass ...\n");
    clock_t begin, end;
    double time_spent;
    begin = clock();
    memset(model->gradients.pre_activations_output, 0, training_set->size * ( SIZE_VOCAB * DIM_EMBEDDINGS //embeddings weights
        + SIZE_BLOCK * DIM_EMBEDDINGS // embedding activations
        + SIZE_BLOCK * DIM_EMBEDDINGS * SIZE_HIDDEN  // hidden weights
        + SIZE_HIDDEN // hidden biases
        + SIZE_HIDDEN * 2 // hidden pre-activations and activations
        + SIZE_HIDDEN * SIZE_VOCAB // output weights
        + SIZE_VOCAB //output biases
        + SIZE_VOCAB)
        );

    loss_softmax_backwards(training_set->Y, model->gradients.pre_activations_output, model->activations.probs, training_set->size);
    // printf("\n before mm back:\n");
    // print_model(model);
    matmul_backwards(model->gradients.pre_activations_output, model->parameters.weights_output, model->activations.hidden, model->gradients.weights_output,
    model->gradients.biases_output, model->gradients.activations_hidden, SIZE_VOCAB, SIZE_HIDDEN, training_set->size);
    tanh_backwards(model->activations.pre_hidden, model->gradients.pre_activations_hidden, SIZE_HIDDEN, training_set->size);
    matmul_backwards(model->gradients.pre_activations_hidden, model->parameters.weights_hidden, model->activations.input, model->gradients.weights_hidden,
    model->gradients.biases_hidden, model->gradients.activations_embeddings, SIZE_HIDDEN, SIZE_BLOCK * DIM_EMBEDDINGS, training_set->size);
    embedding_backwards(model->gradients.activations_embeddings, training_set->X, model->gradients.weights_embeddings, training_set->size);
    update_weights(model, training_set->size);


    // printf("\n after update weights:\n");
    // print_model(model);

    end = clock();

    time_spent = (double)(end - begin) / CLOCKS_PER_SEC;
}


int sample_from_multinomial(float* probabilities, int size) {
    float r = ((float) rand() / (RAND_MAX));
    float cumulative_probability = 0.0;

    for (int i = 0; i < size; i++) {
        cumulative_probability += probabilities[i];
        if (r < cumulative_probability) {
            return i;
        }
    }
    return size - 1; // Return the last index if none is selected (to handle rounding errors)
}

void generate(Model *model, int number_of_names){
    printf("\n\nGenerating names....\n\n");
    for (int i = 0; i < number_of_names; i++){
        char input_tokens[SIZE_BLOCK];
        for (size_t idx_token = 0; idx_token < SIZE_BLOCK; idx_token++){
            input_tokens[idx_token] = '.';
        }
        model_forward(model, input_tokens, 1);
        char predicted_char = decode(sample_from_multinomial(model->activations.probs, SIZE_VOCAB));
        while (predicted_char != '.'){
            printf("%c", predicted_char);
            fflush(stdout);
            for (size_t idx_token = 0; idx_token < SIZE_BLOCK - 1; idx_token++){
                input_tokens[idx_token] = input_tokens[idx_token + 1];
            }
            input_tokens[SIZE_BLOCK - 1] = predicted_char;
            model_forward(model, input_tokens, 1);
            predicted_char = decode(sample_from_multinomial(model->activations.probs, SIZE_VOCAB));            
        }
         printf("\n");
    }
}

int main()
{
    // read in names file
    char ** names = NULL;
    const char * training_path = getenv("TRAINING_PATH");
    int count = readNames(&names, training_path);
    printf("\n%d names loaded\n", count);
    // create training set from names array
    TrainingSet * training_set = createTrainingSet(names, count);

    // create model
    printf("\ncreating model ...\n");
    Model model;
    create_model(&model, training_set->size);
    printf("\n... model created.\n");
    
    // initialise model
    printf("\ninitialising model ....\n");
    initialise_model(&model);
    printf("\nmodel initialised ....\n");
    // print_model(&model);
    

    // generate
    // generate(&model, 5);

    //training loop
    // printf("\nmodel before training:\n");
    // print_model(&model);
    for (int idx_epoch = 0; idx_epoch < NUM_EPOCHS; idx_epoch++){
        printf("\nepoch %d \n", idx_epoch);
        printf("\n");
        model_forward(&model, training_set->X, training_set->size);
        printf("\nloss before back = %f\n", cross_entropy_loss(model.activations.probs, training_set->Y, training_set->size));
        model_backwards(&model, training_set);
       // print_model(&model);


        printf("\n");
        model_forward(&model, training_set->X, training_set->size);
        printf("\n");
        printf("\nloss after back = %f\n", cross_entropy_loss(model.activations.probs, training_set->Y, training_set->size));
    }

    // generate after training
    // generate(&model, 5);

    for (size_t i = 0; i < count; i++){
        free(names[i]);
    }
    free(names);
    free(training_set->X);
    free(training_set->Y);
    free(training_set);
    free(model.parameters.table_embedding);
    return 0;
}
