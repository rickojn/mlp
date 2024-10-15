CFLAGS = -g -fopenmp -Wall
all: bin/mlp
bin/mlp: obj/mlp.o
	gcc $(CFLAGS) $^ -o $@ -lm
obj/mlp.o: src/mlp.c
	gcc $(CFLAGS) $< -c -o $@
clean:
	rm -f obj/mlp.o bin/mlp
