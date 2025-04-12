#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

#define SIZE_CLASSES 10

typedef struct {
    unsigned char *images, *labels;
    int nImages;
} InputData;


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


int main() {
    InputData data = {0};
    const char *training_images_path = "/home/rickojn/coding/deep/data/train-images.idx3-ubyte";
    const char *training_labels_path = "/home/rickojn/coding/deep/data/train-labels.idx1-ubyte";
    read_mnist_images(training_images_path, &data.images, &data.nImages);
    read_mnist_labels(training_labels_path, &data.labels, &data.nImages);
    printf("Number of training labels: %d\n", data.nImages);
    printf("Number of training images: %d\n", data.nImages);
    return 0;
}