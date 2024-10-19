CFLAGS = -g -fopenmp -Wall
all: bin/mlp
bin/mlp: obj/mlp.o obj/custard_flow.o
	gcc $(CFLAGS) $^ -o $@ -lm
obj/mlp.o: src/mlp.c headers/mlp_types.h
	gcc $(CFLAGS) $< -c -o $@
obj/custard_flow.o: src/custard_flow.c headers/mlp_types.h
	gcc $(CFLAGS) $< -c -o $@
clean:
	rm -f obj/mlp.o obj/custard_flow.o bin/mlp 


