#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

#define SIZE_CLASSES 10
#define SIZE_MINI_BATCH 100
#define SIZE_OUTPUT 10
#define SIZE_HIDDEN 10

typedef struct {
    unsigned char *images, *labels;
    int nImages;
} InputData;

typedef struct{
    float *weights, *biases;
    size_t size_inputs, size_outputs;
} Layer;

typedef struct {
    Layer **layers;
    size_t size_layers;
} Model;


void read_mnist_images(const char *filename, unsigned char **images, int *nImages) {
    FILE *file = fopen(filename, "rb");
    if (!file) exit(1);

    int temp, rows, cols;
    fread(&temp, sizeof(int), 1, file);
    fread(nImages, sizeof(int), 1, file);
    *nImages = __builtin_bswap32(*nImages);

    fread(&rows, sizeof(int), 1, file);
    fread(&cols, sizeof(int), 1, file);

    rows = __builtin_bswap32(rows);
    cols = __builtin_bswap32(cols);
    printf("rows: %d, cols: %d\n", rows, cols);

    *images = malloc((*nImages) * rows * cols);
    fread(*images, sizeof(unsigned char), (*nImages) * rows * cols, file);
    fclose(file);

}


void read_mnist_labels(const char *filename, unsigned char **labels, int *nLabels) {
    FILE *file = fopen(filename, "rb");
    if (!file) exit(1);

    int temp;
    fread(&temp, sizeof(int), 1, file);
    fread(nLabels, sizeof(int), 1, file);
    *nLabels = __builtin_bswap32(*nLabels);

    *labels = malloc((*nLabels) * sizeof(unsigned char));
    fread(*labels, sizeof(unsigned char), (*nLabels), file);
    fclose(file);
}

float generate_normal_random_number()
{
    // 2 uniformly distributed random numbers between 0 and 1
    float u1 = ((float)rand() / RAND_MAX);
    float u2 = ((float)rand() / RAND_MAX);

    // use Box-Muller to return a normally distributed number
    return sqrt(-2.0 * log(u1)) * cos(2.0 * M_PI * u2);
}

// Xavier (Glorot) Normal Initialization
float generate_xavier_number(size_t inputs, size_t outputs)
{
    float stddev = sqrt(2.0f / (inputs + outputs));
    return generate_normal_random_number() * stddev;
}

// Kaiming Normal Initialization
float generate_kaiming_number(size_t inputs, size_t outputs)
{
    float stddev = sqrt(2.0f / inputs);
    return generate_normal_random_number() * stddev;
}

void kaiming_initialize_layer(Layer *layer, size_t inputs, size_t outputs)
{
    layer->size_inputs = inputs;
    layer->size_outputs = outputs;

    layer->weights = malloc(inputs * outputs * sizeof(float));
    layer->biases = malloc(outputs * sizeof(float));

    for (size_t i = 0; i < inputs * outputs; i++)
        layer->weights[i] = generate_xavier_number(inputs, outputs);

    for (size_t i = 0; i < outputs; i++)
        layer->biases[i] = 0.0f;
}

void xavier_initialize_layer(Layer *layer, size_t inputs, size_t outputs)
{
    layer->size_inputs = inputs;
    layer->size_outputs = outputs;

    layer->weights = malloc(inputs * outputs * sizeof(float));
    layer->biases = malloc(outputs * sizeof(float));

    for (size_t i = 0; i < inputs * outputs; i++)
        layer->weights[i] = generate_xavier_number(inputs, outputs);

    for (size_t i = 0; i < outputs; i++)
        layer->biases[i] = 0.0f;
}

void add_layer(Model *model, Layer *layer)
{
    if (model->size_layers == 0) {
        model->layers = malloc(sizeof(Layer *));
    } else {
        model->layers = realloc(model->layers, (model->size_layers + 1) * sizeof(Layer *));
    }
    model->layers[model->size_layers] = layer;
    model->size_layers++;
}

void print_layer(Layer *layer)
{
    printf("Layer: %zu inputs, %zu outputs\n", layer->size_inputs, layer->size_outputs);
    printf("Weights:\n");
    for (size_t i = 0; i < layer->size_inputs * layer->size_outputs; i++)
        printf("%f ", layer->weights[i]);
    printf("\nBiases:\n");
    for (size_t i = 0; i < layer->size_outputs; i++)
        printf("%f ", layer->biases[i]);
    printf("\n");
}



void free_layer(Layer *layer)
{
    free(layer->weights);
    free(layer->biases);
}
void free_model(Model *model)
{
    for (size_t i = 0; i < model->size_layers; i++)
      free_layer(model->layers[i]);
    free(model->layers);
}

int main() {
    // read input data
    InputData data_training, data_test = {0};

    const char *training_images_path = "/home/rickojn/coding/deep/data/train-images.idx3-ubyte";
    const char *training_labels_path = "/home/rickojn/coding/deep/data/train-labels.idx1-ubyte";
    read_mnist_images(training_images_path, &data_training.images, &data_training.nImages);
    read_mnist_labels(training_labels_path, &data_training.labels, &data_training.nImages);
    printf("Number of training images: %d\n", data_training.nImages);

    const char *test_images_path = "/home/rickojn/coding/deep/data/t10k-images.idx3-ubyte";
    const char *test_labels_path = "/home/rickojn/coding/deep/data/t10k-labels.idx1-ubyte";
    read_mnist_images(test_images_path, &data_test.images, &data_test.nImages);
    read_mnist_labels(test_labels_path, &data_test.labels, &data_test.nImages);
    printf("Number of test images: %d\n", data_test.nImages);

    // create model
    Model model = {0};
    printf("\nlayers: %zu\n", model.size_layers);
    // create layers
    Layer layer_hidden, layer_output;
    kaiming_initialize_layer(&layer_hidden, SIZE_CLASSES, SIZE_HIDDEN);
    xavier_initialize_layer(&layer_output, SIZE_HIDDEN, SIZE_OUTPUT);
    // add layers to model
    add_layer(&model, &layer_hidden);
    add_layer(&model, &layer_output);
    // print model
    printf("Model:\n");
    for (size_t i = 0; i < model.size_layers; i++)
        print_layer(model.layers[i]);
    // free model
    free_model(&model);
    // free layers
    free(data_training.images);
    free(data_training.labels);
    free(data_test.images);
    free(data_test.labels);








    return 0;
}