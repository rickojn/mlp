	.file	"deep.c"
# GNU C17 (Ubuntu 9.4.0-1ubuntu1~20.04.2) version 9.4.0 (x86_64-linux-gnu)
#	compiled by GNU C version 9.4.0, GMP version 6.2.0, MPFR version 4.0.2, MPC version 1.1.0, isl version isl-0.22.1-GMP

# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed:  -imultiarch x86_64-linux-gnu src/deep.c -mtune=generic
# -march=x86-64 -auxbase-strip deep.s -g -fverbose-asm
# -fasynchronous-unwind-tables -fstack-protector-strong -Wformat
# -Wformat-security -fstack-clash-protection -fcf-protection
# options enabled:  -fPIC -fPIE -faggressive-loop-optimizations
# -fassume-phsa -fasynchronous-unwind-tables -fauto-inc-dec -fcommon
# -fdelete-null-pointer-checks -fdwarf2-cfi-asm -fearly-inlining
# -feliminate-unused-debug-types -ffp-int-builtin-inexact -ffunction-cse
# -fgcse-lm -fgnu-runtime -fgnu-unique -fident -finline-atomics
# -fipa-stack-alignment -fira-hoist-pressure -fira-share-save-slots
# -fira-share-spill-slots -fivopts -fkeep-static-consts
# -fleading-underscore -flifetime-dse -flto-odr-type-merging -fmath-errno
# -fmerge-debug-strings -fpeephole -fplt -fprefetch-loop-arrays
# -freg-struct-return -fsched-critical-path-heuristic
# -fsched-dep-count-heuristic -fsched-group-heuristic -fsched-interblock
# -fsched-last-insn-heuristic -fsched-rank-heuristic -fsched-spec
# -fsched-spec-insn-heuristic -fsched-stalled-insns-dep -fschedule-fusion
# -fsemantic-interposition -fshow-column -fshrink-wrap-separate
# -fsigned-zeros -fsplit-ivs-in-unroller -fssa-backprop
# -fstack-clash-protection -fstack-protector-strong -fstdarg-opt
# -fstrict-volatile-bitfields -fsync-libcalls -ftrapping-math -ftree-cselim
# -ftree-forwprop -ftree-loop-if-convert -ftree-loop-im -ftree-loop-ivcanon
# -ftree-loop-optimize -ftree-parallelize-loops= -ftree-phiprop
# -ftree-reassoc -ftree-scev-cprop -funit-at-a-time -funwind-tables
# -fverbose-asm -fzero-initialized-in-bss -m128bit-long-double -m64 -m80387
# -malign-stringops -mavx256-split-unaligned-load
# -mavx256-split-unaligned-store -mfancy-math-387 -mfp-ret-in-387 -mfxsr
# -mglibc -mieee-fp -mlong-double-80 -mmmx -mno-sse4 -mpush-args -mred-zone
# -msse -msse2 -mstv -mtls-direct-seg-refs -mvzeroupper

	.text
.Ltext0:
	.section	.rodata
.LC0:
	.string	"Memory allocation failed"
	.text
	.globl	concatStrings
	.type	concatStrings, @function
concatStrings:
.LFB6:
	.file 1 "src/deep.c"
	.loc 1 54 57
	.cfi_startproc
	endbr64	
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	pushq	%rbx	#
	subq	$40, %rsp	#,
	.cfi_offset 3, -24
	movq	%rdi, -40(%rbp)	# str1, str1
	movq	%rsi, -48(%rbp)	# str2, str2
# src/deep.c:56:     char *newStr = malloc(strlen(str1) + strlen(str2) + 1);  // +1 for null terminator
	.loc 1 56 27
	movq	-40(%rbp), %rax	# str1, tmp88
	movq	%rax, %rdi	# tmp88,
	call	strlen@PLT	#
	movq	%rax, %rbx	#, _1
# src/deep.c:56:     char *newStr = malloc(strlen(str1) + strlen(str2) + 1);  // +1 for null terminator
	.loc 1 56 42
	movq	-48(%rbp), %rax	# str2, tmp89
	movq	%rax, %rdi	# tmp89,
	call	strlen@PLT	#
# src/deep.c:56:     char *newStr = malloc(strlen(str1) + strlen(str2) + 1);  // +1 for null terminator
	.loc 1 56 40
	addq	%rbx, %rax	# _1, _3
# src/deep.c:56:     char *newStr = malloc(strlen(str1) + strlen(str2) + 1);  // +1 for null terminator
	.loc 1 56 20
	addq	$1, %rax	#, _4
	movq	%rax, %rdi	# _4,
	call	malloc@PLT	#
	movq	%rax, -24(%rbp)	# tmp90, newStr
# src/deep.c:57:     if (newStr == NULL) {
	.loc 1 57 8
	cmpq	$0, -24(%rbp)	#, newStr
	jne	.L2	#,
# src/deep.c:58:         printf("Memory allocation failed\n");
	.loc 1 58 9
	leaq	.LC0(%rip), %rdi	#,
	call	puts@PLT	#
# src/deep.c:59:         return NULL;  // Return NULL if memory allocation fails
	.loc 1 59 16
	movl	$0, %eax	#, _5
	jmp	.L3	#
.L2:
# src/deep.c:63:     strcpy(newStr, str1);
	.loc 1 63 5
	movq	-40(%rbp), %rdx	# str1, tmp91
	movq	-24(%rbp), %rax	# newStr, tmp92
	movq	%rdx, %rsi	# tmp91,
	movq	%rax, %rdi	# tmp92,
	call	strcpy@PLT	#
# src/deep.c:66:     strcat(newStr, str2);
	.loc 1 66 5
	movq	-48(%rbp), %rdx	# str2, tmp93
	movq	-24(%rbp), %rax	# newStr, tmp94
	movq	%rdx, %rsi	# tmp93,
	movq	%rax, %rdi	# tmp94,
	call	strcat@PLT	#
# src/deep.c:68:     return newStr;  // Return the concatenated string
	.loc 1 68 12
	movq	-24(%rbp), %rax	# newStr, _5
.L3:
# src/deep.c:69: }
	.loc 1 69 1
	addq	$40, %rsp	#,
	popq	%rbx	#
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE6:
	.size	concatStrings, .-concatStrings
	.globl	matmul_forward
	.type	matmul_forward, @function
matmul_forward:
.LFB7:
	.loc 1 74 1
	.cfi_startproc
	endbr64	
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movq	%rdi, -40(%rbp)	# layer, layer
	movq	%rsi, -48(%rbp)	# input, input
	movq	%rdx, -56(%rbp)	# output, output
	movq	%rcx, -64(%rbp)	# size_batch, size_batch
.LBB2:
# src/deep.c:75:     for (size_t idx_image = 0; idx_image < size_batch; idx_image++) {
	.loc 1 75 17
	movq	$0, -24(%rbp)	#, idx_image
# src/deep.c:75:     for (size_t idx_image = 0; idx_image < size_batch; idx_image++) {
	.loc 1 75 5
	jmp	.L5	#
.L10:
.LBB3:
# src/deep.c:76:         for (size_t idx_neuron = 0; idx_neuron < layer->size_neurons; idx_neuron++) {
	.loc 1 76 21
	movq	$0, -16(%rbp)	#, idx_neuron
# src/deep.c:76:         for (size_t idx_neuron = 0; idx_neuron < layer->size_neurons; idx_neuron++) {
	.loc 1 76 9
	jmp	.L6	#
.L9:
# src/deep.c:77:             output[idx_image * layer->size_neurons + idx_neuron] = layer->biases[idx_neuron];
	.loc 1 77 73
	movq	-40(%rbp), %rax	# layer, tmp119
	movq	8(%rax), %rax	# layer_48(D)->biases, _1
# src/deep.c:77:             output[idx_image * layer->size_neurons + idx_neuron] = layer->biases[idx_neuron];
	.loc 1 77 81
	movq	-16(%rbp), %rdx	# idx_neuron, tmp120
	salq	$2, %rdx	#, _2
	addq	%rax, %rdx	# _1, _3
# src/deep.c:77:             output[idx_image * layer->size_neurons + idx_neuron] = layer->biases[idx_neuron];
	.loc 1 77 37
	movq	-40(%rbp), %rax	# layer, tmp121
	movq	72(%rax), %rax	# layer_48(D)->size_neurons, _4
# src/deep.c:77:             output[idx_image * layer->size_neurons + idx_neuron] = layer->biases[idx_neuron];
	.loc 1 77 30
	imulq	-24(%rbp), %rax	# idx_image, _4
	movq	%rax, %rcx	# _4, _5
# src/deep.c:77:             output[idx_image * layer->size_neurons + idx_neuron] = layer->biases[idx_neuron];
	.loc 1 77 52
	movq	-16(%rbp), %rax	# idx_neuron, tmp122
	addq	%rcx, %rax	# _5, _6
# src/deep.c:77:             output[idx_image * layer->size_neurons + idx_neuron] = layer->biases[idx_neuron];
	.loc 1 77 19
	leaq	0(,%rax,4), %rcx	#, _7
	movq	-56(%rbp), %rax	# output, tmp123
	addq	%rcx, %rax	# _7, _8
# src/deep.c:77:             output[idx_image * layer->size_neurons + idx_neuron] = layer->biases[idx_neuron];
	.loc 1 77 81
	movss	(%rdx), %xmm0	# *_3, _9
# src/deep.c:77:             output[idx_image * layer->size_neurons + idx_neuron] = layer->biases[idx_neuron];
	.loc 1 77 66
	movss	%xmm0, (%rax)	# _9, *_8
.LBB4:
# src/deep.c:78:             for (size_t idx_input = 0; idx_input < layer->size_inputs; idx_input++) {
	.loc 1 78 25
	movq	$0, -8(%rbp)	#, idx_input
# src/deep.c:78:             for (size_t idx_input = 0; idx_input < layer->size_inputs; idx_input++) {
	.loc 1 78 13
	jmp	.L7	#
.L8:
# src/deep.c:79:                 output[idx_image * layer->size_neurons + idx_neuron] += 
	.loc 1 79 41 discriminator 3
	movq	-40(%rbp), %rax	# layer, tmp124
	movq	72(%rax), %rax	# layer_48(D)->size_neurons, _10
# src/deep.c:79:                 output[idx_image * layer->size_neurons + idx_neuron] += 
	.loc 1 79 70 discriminator 3
	imulq	-24(%rbp), %rax	# idx_image, _10
	movq	%rax, %rdx	# _10, _11
	movq	-16(%rbp), %rax	# idx_neuron, tmp125
	addq	%rdx, %rax	# _11, _12
	leaq	0(,%rax,4), %rdx	#, _13
	movq	-56(%rbp), %rax	# output, tmp126
	addq	%rdx, %rax	# _13, _14
	movss	(%rax), %xmm1	# *_14, _15
# src/deep.c:80:                 layer->weights[idx_input * layer->size_neurons + idx_neuron] * input[idx_image * layer->size_inputs + idx_input];
	.loc 1 80 22 discriminator 3
	movq	-40(%rbp), %rax	# layer, tmp127
	movq	(%rax), %rdx	# layer_48(D)->weights, _16
# src/deep.c:80:                 layer->weights[idx_input * layer->size_neurons + idx_neuron] * input[idx_image * layer->size_inputs + idx_input];
	.loc 1 80 49 discriminator 3
	movq	-40(%rbp), %rax	# layer, tmp128
	movq	72(%rax), %rax	# layer_48(D)->size_neurons, _17
# src/deep.c:80:                 layer->weights[idx_input * layer->size_neurons + idx_neuron] * input[idx_image * layer->size_inputs + idx_input];
	.loc 1 80 42 discriminator 3
	imulq	-8(%rbp), %rax	# idx_input, _17
	movq	%rax, %rcx	# _17, _18
# src/deep.c:80:                 layer->weights[idx_input * layer->size_neurons + idx_neuron] * input[idx_image * layer->size_inputs + idx_input];
	.loc 1 80 64 discriminator 3
	movq	-16(%rbp), %rax	# idx_neuron, tmp129
	addq	%rcx, %rax	# _18, _19
# src/deep.c:80:                 layer->weights[idx_input * layer->size_neurons + idx_neuron] * input[idx_image * layer->size_inputs + idx_input];
	.loc 1 80 31 discriminator 3
	salq	$2, %rax	#, _20
	addq	%rdx, %rax	# _16, _21
	movss	(%rax), %xmm2	# *_21, _22
# src/deep.c:80:                 layer->weights[idx_input * layer->size_neurons + idx_neuron] * input[idx_image * layer->size_inputs + idx_input];
	.loc 1 80 103 discriminator 3
	movq	-40(%rbp), %rax	# layer, tmp130
	movq	64(%rax), %rax	# layer_48(D)->size_inputs, _23
# src/deep.c:80:                 layer->weights[idx_input * layer->size_neurons + idx_neuron] * input[idx_image * layer->size_inputs + idx_input];
	.loc 1 80 96 discriminator 3
	imulq	-24(%rbp), %rax	# idx_image, _23
	movq	%rax, %rdx	# _23, _24
# src/deep.c:80:                 layer->weights[idx_input * layer->size_neurons + idx_neuron] * input[idx_image * layer->size_inputs + idx_input];
	.loc 1 80 117 discriminator 3
	movq	-8(%rbp), %rax	# idx_input, tmp131
	addq	%rdx, %rax	# _24, _25
# src/deep.c:80:                 layer->weights[idx_input * layer->size_neurons + idx_neuron] * input[idx_image * layer->size_inputs + idx_input];
	.loc 1 80 85 discriminator 3
	leaq	0(,%rax,4), %rdx	#, _26
	movq	-48(%rbp), %rax	# input, tmp132
	addq	%rdx, %rax	# _26, _27
	movss	(%rax), %xmm0	# *_27, _28
# src/deep.c:80:                 layer->weights[idx_input * layer->size_neurons + idx_neuron] * input[idx_image * layer->size_inputs + idx_input];
	.loc 1 80 78 discriminator 3
	mulss	%xmm2, %xmm0	# _22, _29
# src/deep.c:79:                 output[idx_image * layer->size_neurons + idx_neuron] += 
	.loc 1 79 41 discriminator 3
	movq	-40(%rbp), %rax	# layer, tmp133
	movq	72(%rax), %rax	# layer_48(D)->size_neurons, _30
# src/deep.c:79:                 output[idx_image * layer->size_neurons + idx_neuron] += 
	.loc 1 79 70 discriminator 3
	imulq	-24(%rbp), %rax	# idx_image, _30
	movq	%rax, %rdx	# _30, _31
	movq	-16(%rbp), %rax	# idx_neuron, tmp134
	addq	%rdx, %rax	# _31, _32
	leaq	0(,%rax,4), %rdx	#, _33
	movq	-56(%rbp), %rax	# output, tmp135
	addq	%rdx, %rax	# _33, _34
	addss	%xmm1, %xmm0	# _15, _35
	movss	%xmm0, (%rax)	# _35, *_34
# src/deep.c:78:             for (size_t idx_input = 0; idx_input < layer->size_inputs; idx_input++) {
	.loc 1 78 81 discriminator 3
	addq	$1, -8(%rbp)	#, idx_input
.L7:
# src/deep.c:78:             for (size_t idx_input = 0; idx_input < layer->size_inputs; idx_input++) {
	.loc 1 78 57 discriminator 1
	movq	-40(%rbp), %rax	# layer, tmp136
	movq	64(%rax), %rax	# layer_48(D)->size_inputs, _36
# src/deep.c:78:             for (size_t idx_input = 0; idx_input < layer->size_inputs; idx_input++) {
	.loc 1 78 13 discriminator 1
	cmpq	%rax, -8(%rbp)	# _36, idx_input
	jb	.L8	#,
.LBE4:
# src/deep.c:76:         for (size_t idx_neuron = 0; idx_neuron < layer->size_neurons; idx_neuron++) {
	.loc 1 76 81 discriminator 2
	addq	$1, -16(%rbp)	#, idx_neuron
.L6:
# src/deep.c:76:         for (size_t idx_neuron = 0; idx_neuron < layer->size_neurons; idx_neuron++) {
	.loc 1 76 55 discriminator 1
	movq	-40(%rbp), %rax	# layer, tmp137
	movq	72(%rax), %rax	# layer_48(D)->size_neurons, _37
# src/deep.c:76:         for (size_t idx_neuron = 0; idx_neuron < layer->size_neurons; idx_neuron++) {
	.loc 1 76 9 discriminator 1
	cmpq	%rax, -16(%rbp)	# _37, idx_neuron
	jb	.L9	#,
.LBE3:
# src/deep.c:75:     for (size_t idx_image = 0; idx_image < size_batch; idx_image++) {
	.loc 1 75 65 discriminator 2
	addq	$1, -24(%rbp)	#, idx_image
.L5:
# src/deep.c:75:     for (size_t idx_image = 0; idx_image < size_batch; idx_image++) {
	.loc 1 75 5 discriminator 1
	movq	-24(%rbp), %rax	# idx_image, tmp138
	cmpq	-64(%rbp), %rax	# size_batch, tmp138
	jb	.L10	#,
.LBE2:
# src/deep.c:84: } 
	.loc 1 84 1
	nop	
	nop	
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE7:
	.size	matmul_forward, .-matmul_forward
	.globl	relu_forward
	.type	relu_forward, @function
relu_forward:
.LFB8:
	.loc 1 88 1
	.cfi_startproc
	endbr64	
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	pushq	%rbx	#
	subq	$40, %rsp	#,
	.cfi_offset 3, -24
	movq	%rdi, -40(%rbp)	# layer, layer
	movq	%rsi, -48(%rbp)	# size_batch, size_batch
.LBB5:
# src/deep.c:89:     for (size_t idx_image = 0; idx_image < size_batch; idx_image++) {
	.loc 1 89 17
	movq	$0, -32(%rbp)	#, idx_image
# src/deep.c:89:     for (size_t idx_image = 0; idx_image < size_batch; idx_image++) {
	.loc 1 89 5
	jmp	.L12	#
.L15:
.LBB6:
# src/deep.c:90:         for (size_t idx_neuron = 0; idx_neuron < layer->size_neurons; idx_neuron++) {
	.loc 1 90 21
	movq	$0, -24(%rbp)	#, idx_neuron
# src/deep.c:90:         for (size_t idx_neuron = 0; idx_neuron < layer->size_neurons; idx_neuron++) {
	.loc 1 90 9
	jmp	.L13	#
.L14:
# src/deep.c:91:             layer->activations_output[idx_image * layer->size_neurons + idx_neuron] = fmaxf(0.0f, layer->activations_input[idx_image * layer->size_neurons + idx_neuron]);
	.loc 1 91 104 discriminator 3
	movq	-40(%rbp), %rax	# layer, tmp97
	movq	16(%rax), %rdx	# layer_24(D)->activations_input, _1
# src/deep.c:91:             layer->activations_output[idx_image * layer->size_neurons + idx_neuron] = fmaxf(0.0f, layer->activations_input[idx_image * layer->size_neurons + idx_neuron]);
	.loc 1 91 141 discriminator 3
	movq	-40(%rbp), %rax	# layer, tmp98
	movq	72(%rax), %rax	# layer_24(D)->size_neurons, _2
# src/deep.c:91:             layer->activations_output[idx_image * layer->size_neurons + idx_neuron] = fmaxf(0.0f, layer->activations_input[idx_image * layer->size_neurons + idx_neuron]);
	.loc 1 91 134 discriminator 3
	imulq	-32(%rbp), %rax	# idx_image, _2
	movq	%rax, %rcx	# _2, _3
# src/deep.c:91:             layer->activations_output[idx_image * layer->size_neurons + idx_neuron] = fmaxf(0.0f, layer->activations_input[idx_image * layer->size_neurons + idx_neuron]);
	.loc 1 91 156 discriminator 3
	movq	-24(%rbp), %rax	# idx_neuron, tmp99
	addq	%rcx, %rax	# _3, _4
# src/deep.c:91:             layer->activations_output[idx_image * layer->size_neurons + idx_neuron] = fmaxf(0.0f, layer->activations_input[idx_image * layer->size_neurons + idx_neuron]);
	.loc 1 91 123 discriminator 3
	salq	$2, %rax	#, _5
	addq	%rdx, %rax	# _1, _6
# src/deep.c:91:             layer->activations_output[idx_image * layer->size_neurons + idx_neuron] = fmaxf(0.0f, layer->activations_input[idx_image * layer->size_neurons + idx_neuron]);
	.loc 1 91 87 discriminator 3
	movss	(%rax), %xmm0	# *_6, _7
# src/deep.c:91:             layer->activations_output[idx_image * layer->size_neurons + idx_neuron] = fmaxf(0.0f, layer->activations_input[idx_image * layer->size_neurons + idx_neuron]);
	.loc 1 91 18 discriminator 3
	movq	-40(%rbp), %rax	# layer, tmp100
	movq	24(%rax), %rdx	# layer_24(D)->activations_output, _8
# src/deep.c:91:             layer->activations_output[idx_image * layer->size_neurons + idx_neuron] = fmaxf(0.0f, layer->activations_input[idx_image * layer->size_neurons + idx_neuron]);
	.loc 1 91 56 discriminator 3
	movq	-40(%rbp), %rax	# layer, tmp101
	movq	72(%rax), %rax	# layer_24(D)->size_neurons, _9
# src/deep.c:91:             layer->activations_output[idx_image * layer->size_neurons + idx_neuron] = fmaxf(0.0f, layer->activations_input[idx_image * layer->size_neurons + idx_neuron]);
	.loc 1 91 49 discriminator 3
	imulq	-32(%rbp), %rax	# idx_image, _9
	movq	%rax, %rcx	# _9, _10
# src/deep.c:91:             layer->activations_output[idx_image * layer->size_neurons + idx_neuron] = fmaxf(0.0f, layer->activations_input[idx_image * layer->size_neurons + idx_neuron]);
	.loc 1 91 71 discriminator 3
	movq	-24(%rbp), %rax	# idx_neuron, tmp102
	addq	%rcx, %rax	# _10, _11
# src/deep.c:91:             layer->activations_output[idx_image * layer->size_neurons + idx_neuron] = fmaxf(0.0f, layer->activations_input[idx_image * layer->size_neurons + idx_neuron]);
	.loc 1 91 38 discriminator 3
	salq	$2, %rax	#, _12
	leaq	(%rdx,%rax), %rbx	#, _13
# src/deep.c:91:             layer->activations_output[idx_image * layer->size_neurons + idx_neuron] = fmaxf(0.0f, layer->activations_input[idx_image * layer->size_neurons + idx_neuron]);
	.loc 1 91 87 discriminator 3
	movaps	%xmm0, %xmm1	# _7,
	pxor	%xmm0, %xmm0	#
	call	fmaxf@PLT	#
	movd	%xmm0, %eax	#, _14
# src/deep.c:91:             layer->activations_output[idx_image * layer->size_neurons + idx_neuron] = fmaxf(0.0f, layer->activations_input[idx_image * layer->size_neurons + idx_neuron]);
	.loc 1 91 85 discriminator 3
	movl	%eax, (%rbx)	# _14, *_13
# src/deep.c:90:         for (size_t idx_neuron = 0; idx_neuron < layer->size_neurons; idx_neuron++) {
	.loc 1 90 81 discriminator 3
	addq	$1, -24(%rbp)	#, idx_neuron
.L13:
# src/deep.c:90:         for (size_t idx_neuron = 0; idx_neuron < layer->size_neurons; idx_neuron++) {
	.loc 1 90 55 discriminator 1
	movq	-40(%rbp), %rax	# layer, tmp103
	movq	72(%rax), %rax	# layer_24(D)->size_neurons, _15
# src/deep.c:90:         for (size_t idx_neuron = 0; idx_neuron < layer->size_neurons; idx_neuron++) {
	.loc 1 90 9 discriminator 1
	cmpq	%rax, -24(%rbp)	# _15, idx_neuron
	jb	.L14	#,
.LBE6:
# src/deep.c:89:     for (size_t idx_image = 0; idx_image < size_batch; idx_image++) {
	.loc 1 89 65 discriminator 2
	addq	$1, -32(%rbp)	#, idx_image
.L12:
# src/deep.c:89:     for (size_t idx_image = 0; idx_image < size_batch; idx_image++) {
	.loc 1 89 5 discriminator 1
	movq	-32(%rbp), %rax	# idx_image, tmp104
	cmpq	-48(%rbp), %rax	# size_batch, tmp104
	jb	.L15	#,
.LBE5:
# src/deep.c:94: }
	.loc 1 94 1
	nop	
	nop	
	addq	$40, %rsp	#,
	popq	%rbx	#
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE8:
	.size	relu_forward, .-relu_forward
	.globl	softmax_forward
	.type	softmax_forward, @function
softmax_forward:
.LFB9:
	.loc 1 97 1
	.cfi_startproc
	endbr64	
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	pushq	%rbx	#
	subq	$72, %rsp	#,
	.cfi_offset 3, -24
	movq	%rdi, -72(%rbp)	# layer, layer
	movq	%rsi, -80(%rbp)	# size_batch, size_batch
.LBB7:
# src/deep.c:98:     for (size_t idx_image = 0; idx_image < size_batch; idx_image++) {
	.loc 1 98 17
	movq	$0, -48(%rbp)	#, idx_image
# src/deep.c:98:     for (size_t idx_image = 0; idx_image < size_batch; idx_image++) {
	.loc 1 98 5
	jmp	.L17	#
.L26:
.LBB8:
# src/deep.c:99:         float max_logit = layer->activations_output[idx_image * layer->size_neurons];
	.loc 1 99 32
	movq	-72(%rbp), %rax	# layer, tmp139
	movq	24(%rax), %rdx	# layer_71(D)->activations_output, _1
# src/deep.c:99:         float max_logit = layer->activations_output[idx_image * layer->size_neurons];
	.loc 1 99 70
	movq	-72(%rbp), %rax	# layer, tmp140
	movq	72(%rax), %rax	# layer_71(D)->size_neurons, _2
# src/deep.c:99:         float max_logit = layer->activations_output[idx_image * layer->size_neurons];
	.loc 1 99 63
	imulq	-48(%rbp), %rax	# idx_image, _3
# src/deep.c:99:         float max_logit = layer->activations_output[idx_image * layer->size_neurons];
	.loc 1 99 52
	salq	$2, %rax	#, _4
	addq	%rdx, %rax	# _1, _5
# src/deep.c:99:         float max_logit = layer->activations_output[idx_image * layer->size_neurons];
	.loc 1 99 15
	movss	(%rax), %xmm0	# *_5, tmp141
	movss	%xmm0, -56(%rbp)	# tmp141, max_logit
.LBB9:
# src/deep.c:100:         for (size_t idx_neuron = 1; idx_neuron < layer->size_neurons; idx_neuron++) {
	.loc 1 100 21
	movq	$1, -40(%rbp)	#, idx_neuron
# src/deep.c:100:         for (size_t idx_neuron = 1; idx_neuron < layer->size_neurons; idx_neuron++) {
	.loc 1 100 9
	jmp	.L18	#
.L21:
# src/deep.c:101:             if (layer->activations_output[idx_image * layer->size_neurons + idx_neuron] > max_logit) {
	.loc 1 101 22
	movq	-72(%rbp), %rax	# layer, tmp142
	movq	24(%rax), %rdx	# layer_71(D)->activations_output, _6
# src/deep.c:101:             if (layer->activations_output[idx_image * layer->size_neurons + idx_neuron] > max_logit) {
	.loc 1 101 60
	movq	-72(%rbp), %rax	# layer, tmp143
	movq	72(%rax), %rax	# layer_71(D)->size_neurons, _7
# src/deep.c:101:             if (layer->activations_output[idx_image * layer->size_neurons + idx_neuron] > max_logit) {
	.loc 1 101 53
	imulq	-48(%rbp), %rax	# idx_image, _7
	movq	%rax, %rcx	# _7, _8
# src/deep.c:101:             if (layer->activations_output[idx_image * layer->size_neurons + idx_neuron] > max_logit) {
	.loc 1 101 75
	movq	-40(%rbp), %rax	# idx_neuron, tmp144
	addq	%rcx, %rax	# _8, _9
# src/deep.c:101:             if (layer->activations_output[idx_image * layer->size_neurons + idx_neuron] > max_logit) {
	.loc 1 101 42
	salq	$2, %rax	#, _10
	addq	%rdx, %rax	# _6, _11
	movss	(%rax), %xmm0	# *_11, _12
# src/deep.c:101:             if (layer->activations_output[idx_image * layer->size_neurons + idx_neuron] > max_logit) {
	.loc 1 101 16
	comiss	-56(%rbp), %xmm0	# max_logit, _12
	jbe	.L19	#,
# src/deep.c:102:                 max_logit = layer->activations_output[idx_image * layer->size_neurons + idx_neuron];
	.loc 1 102 34
	movq	-72(%rbp), %rax	# layer, tmp145
	movq	24(%rax), %rdx	# layer_71(D)->activations_output, _13
# src/deep.c:102:                 max_logit = layer->activations_output[idx_image * layer->size_neurons + idx_neuron];
	.loc 1 102 72
	movq	-72(%rbp), %rax	# layer, tmp146
	movq	72(%rax), %rax	# layer_71(D)->size_neurons, _14
# src/deep.c:102:                 max_logit = layer->activations_output[idx_image * layer->size_neurons + idx_neuron];
	.loc 1 102 65
	imulq	-48(%rbp), %rax	# idx_image, _14
	movq	%rax, %rcx	# _14, _15
# src/deep.c:102:                 max_logit = layer->activations_output[idx_image * layer->size_neurons + idx_neuron];
	.loc 1 102 87
	movq	-40(%rbp), %rax	# idx_neuron, tmp147
	addq	%rcx, %rax	# _15, _16
# src/deep.c:102:                 max_logit = layer->activations_output[idx_image * layer->size_neurons + idx_neuron];
	.loc 1 102 54
	salq	$2, %rax	#, _17
	addq	%rdx, %rax	# _13, _18
# src/deep.c:102:                 max_logit = layer->activations_output[idx_image * layer->size_neurons + idx_neuron];
	.loc 1 102 27
	movss	(%rax), %xmm0	# *_18, tmp148
	movss	%xmm0, -56(%rbp)	# tmp148, max_logit
.L19:
# src/deep.c:100:         for (size_t idx_neuron = 1; idx_neuron < layer->size_neurons; idx_neuron++) {
	.loc 1 100 81 discriminator 2
	addq	$1, -40(%rbp)	#, idx_neuron
.L18:
# src/deep.c:100:         for (size_t idx_neuron = 1; idx_neuron < layer->size_neurons; idx_neuron++) {
	.loc 1 100 55 discriminator 1
	movq	-72(%rbp), %rax	# layer, tmp149
	movq	72(%rax), %rax	# layer_71(D)->size_neurons, _19
# src/deep.c:100:         for (size_t idx_neuron = 1; idx_neuron < layer->size_neurons; idx_neuron++) {
	.loc 1 100 9 discriminator 1
	cmpq	%rax, -40(%rbp)	# _19, idx_neuron
	jb	.L21	#,
.LBE9:
# src/deep.c:106:         float sum_exp = 0.0f;
	.loc 1 106 15
	pxor	%xmm0, %xmm0	# tmp150
	movss	%xmm0, -52(%rbp)	# tmp150, sum_exp
.LBB10:
# src/deep.c:107:         for (size_t idx_neuron = 0; idx_neuron < layer->size_neurons; idx_neuron++) {
	.loc 1 107 21
	movq	$0, -32(%rbp)	#, idx_neuron
# src/deep.c:107:         for (size_t idx_neuron = 0; idx_neuron < layer->size_neurons; idx_neuron++) {
	.loc 1 107 9
	jmp	.L22	#
.L23:
# src/deep.c:108:             layer->activations_output[idx_image * layer->size_neurons + idx_neuron] = expf(layer->activations_output[idx_image * layer->size_neurons + idx_neuron] - max_logit);
	.loc 1 108 97 discriminator 3
	movq	-72(%rbp), %rax	# layer, tmp151
	movq	24(%rax), %rdx	# layer_71(D)->activations_output, _20
# src/deep.c:108:             layer->activations_output[idx_image * layer->size_neurons + idx_neuron] = expf(layer->activations_output[idx_image * layer->size_neurons + idx_neuron] - max_logit);
	.loc 1 108 135 discriminator 3
	movq	-72(%rbp), %rax	# layer, tmp152
	movq	72(%rax), %rax	# layer_71(D)->size_neurons, _21
# src/deep.c:108:             layer->activations_output[idx_image * layer->size_neurons + idx_neuron] = expf(layer->activations_output[idx_image * layer->size_neurons + idx_neuron] - max_logit);
	.loc 1 108 128 discriminator 3
	imulq	-48(%rbp), %rax	# idx_image, _21
	movq	%rax, %rcx	# _21, _22
# src/deep.c:108:             layer->activations_output[idx_image * layer->size_neurons + idx_neuron] = expf(layer->activations_output[idx_image * layer->size_neurons + idx_neuron] - max_logit);
	.loc 1 108 150 discriminator 3
	movq	-32(%rbp), %rax	# idx_neuron, tmp153
	addq	%rcx, %rax	# _22, _23
# src/deep.c:108:             layer->activations_output[idx_image * layer->size_neurons + idx_neuron] = expf(layer->activations_output[idx_image * layer->size_neurons + idx_neuron] - max_logit);
	.loc 1 108 117 discriminator 3
	salq	$2, %rax	#, _24
	addq	%rdx, %rax	# _20, _25
	movss	(%rax), %xmm0	# *_25, _26
# src/deep.c:108:             layer->activations_output[idx_image * layer->size_neurons + idx_neuron] = expf(layer->activations_output[idx_image * layer->size_neurons + idx_neuron] - max_logit);
	.loc 1 108 87 discriminator 3
	subss	-56(%rbp), %xmm0	# max_logit, _27
# src/deep.c:108:             layer->activations_output[idx_image * layer->size_neurons + idx_neuron] = expf(layer->activations_output[idx_image * layer->size_neurons + idx_neuron] - max_logit);
	.loc 1 108 18 discriminator 3
	movq	-72(%rbp), %rax	# layer, tmp154
	movq	24(%rax), %rdx	# layer_71(D)->activations_output, _28
# src/deep.c:108:             layer->activations_output[idx_image * layer->size_neurons + idx_neuron] = expf(layer->activations_output[idx_image * layer->size_neurons + idx_neuron] - max_logit);
	.loc 1 108 56 discriminator 3
	movq	-72(%rbp), %rax	# layer, tmp155
	movq	72(%rax), %rax	# layer_71(D)->size_neurons, _29
# src/deep.c:108:             layer->activations_output[idx_image * layer->size_neurons + idx_neuron] = expf(layer->activations_output[idx_image * layer->size_neurons + idx_neuron] - max_logit);
	.loc 1 108 49 discriminator 3
	imulq	-48(%rbp), %rax	# idx_image, _29
	movq	%rax, %rcx	# _29, _30
# src/deep.c:108:             layer->activations_output[idx_image * layer->size_neurons + idx_neuron] = expf(layer->activations_output[idx_image * layer->size_neurons + idx_neuron] - max_logit);
	.loc 1 108 71 discriminator 3
	movq	-32(%rbp), %rax	# idx_neuron, tmp156
	addq	%rcx, %rax	# _30, _31
# src/deep.c:108:             layer->activations_output[idx_image * layer->size_neurons + idx_neuron] = expf(layer->activations_output[idx_image * layer->size_neurons + idx_neuron] - max_logit);
	.loc 1 108 38 discriminator 3
	salq	$2, %rax	#, _32
	leaq	(%rdx,%rax), %rbx	#, _33
# src/deep.c:108:             layer->activations_output[idx_image * layer->size_neurons + idx_neuron] = expf(layer->activations_output[idx_image * layer->size_neurons + idx_neuron] - max_logit);
	.loc 1 108 87 discriminator 3
	call	expf@PLT	#
	movd	%xmm0, %eax	#, _34
# src/deep.c:108:             layer->activations_output[idx_image * layer->size_neurons + idx_neuron] = expf(layer->activations_output[idx_image * layer->size_neurons + idx_neuron] - max_logit);
	.loc 1 108 85 discriminator 3
	movl	%eax, (%rbx)	# _34, *_33
# src/deep.c:109:             sum_exp += layer->activations_output[idx_image * layer->size_neurons + idx_neuron];
	.loc 1 109 29 discriminator 3
	movq	-72(%rbp), %rax	# layer, tmp157
	movq	24(%rax), %rdx	# layer_71(D)->activations_output, _35
# src/deep.c:109:             sum_exp += layer->activations_output[idx_image * layer->size_neurons + idx_neuron];
	.loc 1 109 67 discriminator 3
	movq	-72(%rbp), %rax	# layer, tmp158
	movq	72(%rax), %rax	# layer_71(D)->size_neurons, _36
# src/deep.c:109:             sum_exp += layer->activations_output[idx_image * layer->size_neurons + idx_neuron];
	.loc 1 109 60 discriminator 3
	imulq	-48(%rbp), %rax	# idx_image, _36
	movq	%rax, %rcx	# _36, _37
# src/deep.c:109:             sum_exp += layer->activations_output[idx_image * layer->size_neurons + idx_neuron];
	.loc 1 109 82 discriminator 3
	movq	-32(%rbp), %rax	# idx_neuron, tmp159
	addq	%rcx, %rax	# _37, _38
# src/deep.c:109:             sum_exp += layer->activations_output[idx_image * layer->size_neurons + idx_neuron];
	.loc 1 109 49 discriminator 3
	salq	$2, %rax	#, _39
	addq	%rdx, %rax	# _35, _40
	movss	(%rax), %xmm0	# *_40, _41
# src/deep.c:109:             sum_exp += layer->activations_output[idx_image * layer->size_neurons + idx_neuron];
	.loc 1 109 21 discriminator 3
	movss	-52(%rbp), %xmm1	# sum_exp, tmp161
	addss	%xmm1, %xmm0	# tmp161, tmp160
	movss	%xmm0, -52(%rbp)	# tmp160, sum_exp
# src/deep.c:107:         for (size_t idx_neuron = 0; idx_neuron < layer->size_neurons; idx_neuron++) {
	.loc 1 107 81 discriminator 3
	addq	$1, -32(%rbp)	#, idx_neuron
.L22:
# src/deep.c:107:         for (size_t idx_neuron = 0; idx_neuron < layer->size_neurons; idx_neuron++) {
	.loc 1 107 55 discriminator 1
	movq	-72(%rbp), %rax	# layer, tmp162
	movq	72(%rax), %rax	# layer_71(D)->size_neurons, _42
# src/deep.c:107:         for (size_t idx_neuron = 0; idx_neuron < layer->size_neurons; idx_neuron++) {
	.loc 1 107 9 discriminator 1
	cmpq	%rax, -32(%rbp)	# _42, idx_neuron
	jb	.L23	#,
.LBE10:
.LBB11:
# src/deep.c:112:         for (size_t idx_neuron = 0; idx_neuron < layer->size_neurons; idx_neuron++) {
	.loc 1 112 21
	movq	$0, -24(%rbp)	#, idx_neuron
# src/deep.c:112:         for (size_t idx_neuron = 0; idx_neuron < layer->size_neurons; idx_neuron++) {
	.loc 1 112 9
	jmp	.L24	#
.L25:
# src/deep.c:113:             layer->activations_output[idx_image * layer->size_neurons + idx_neuron] /= sum_exp;
	.loc 1 113 18 discriminator 3
	movq	-72(%rbp), %rax	# layer, tmp163
	movq	24(%rax), %rdx	# layer_71(D)->activations_output, _43
# src/deep.c:113:             layer->activations_output[idx_image * layer->size_neurons + idx_neuron] /= sum_exp;
	.loc 1 113 56 discriminator 3
	movq	-72(%rbp), %rax	# layer, tmp164
	movq	72(%rax), %rax	# layer_71(D)->size_neurons, _44
# src/deep.c:113:             layer->activations_output[idx_image * layer->size_neurons + idx_neuron] /= sum_exp;
	.loc 1 113 85 discriminator 3
	imulq	-48(%rbp), %rax	# idx_image, _44
	movq	%rax, %rcx	# _44, _45
	movq	-24(%rbp), %rax	# idx_neuron, tmp165
	addq	%rcx, %rax	# _45, _46
	salq	$2, %rax	#, _47
	addq	%rdx, %rax	# _43, _48
	movss	(%rax), %xmm0	# *_48, _49
# src/deep.c:113:             layer->activations_output[idx_image * layer->size_neurons + idx_neuron] /= sum_exp;
	.loc 1 113 18 discriminator 3
	movq	-72(%rbp), %rax	# layer, tmp166
	movq	24(%rax), %rdx	# layer_71(D)->activations_output, _50
# src/deep.c:113:             layer->activations_output[idx_image * layer->size_neurons + idx_neuron] /= sum_exp;
	.loc 1 113 56 discriminator 3
	movq	-72(%rbp), %rax	# layer, tmp167
	movq	72(%rax), %rax	# layer_71(D)->size_neurons, _51
# src/deep.c:113:             layer->activations_output[idx_image * layer->size_neurons + idx_neuron] /= sum_exp;
	.loc 1 113 85 discriminator 3
	imulq	-48(%rbp), %rax	# idx_image, _51
	movq	%rax, %rcx	# _51, _52
	movq	-24(%rbp), %rax	# idx_neuron, tmp168
	addq	%rcx, %rax	# _52, _53
	salq	$2, %rax	#, _54
	addq	%rdx, %rax	# _50, _55
	divss	-52(%rbp), %xmm0	# sum_exp, _56
	movss	%xmm0, (%rax)	# _56, *_55
# src/deep.c:112:         for (size_t idx_neuron = 0; idx_neuron < layer->size_neurons; idx_neuron++) {
	.loc 1 112 81 discriminator 3
	addq	$1, -24(%rbp)	#, idx_neuron
.L24:
# src/deep.c:112:         for (size_t idx_neuron = 0; idx_neuron < layer->size_neurons; idx_neuron++) {
	.loc 1 112 55 discriminator 1
	movq	-72(%rbp), %rax	# layer, tmp169
	movq	72(%rax), %rax	# layer_71(D)->size_neurons, _57
# src/deep.c:112:         for (size_t idx_neuron = 0; idx_neuron < layer->size_neurons; idx_neuron++) {
	.loc 1 112 9 discriminator 1
	cmpq	%rax, -24(%rbp)	# _57, idx_neuron
	jb	.L25	#,
.LBE11:
.LBE8:
# src/deep.c:98:     for (size_t idx_image = 0; idx_image < size_batch; idx_image++) {
	.loc 1 98 65 discriminator 2
	addq	$1, -48(%rbp)	#, idx_image
.L17:
# src/deep.c:98:     for (size_t idx_image = 0; idx_image < size_batch; idx_image++) {
	.loc 1 98 5 discriminator 1
	movq	-48(%rbp), %rax	# idx_image, tmp170
	cmpq	-80(%rbp), %rax	# size_batch, tmp170
	jb	.L26	#,
.LBE7:
# src/deep.c:116: }
	.loc 1 116 1
	nop	
	nop	
	addq	$72, %rsp	#,
	popq	%rbx	#
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE9:
	.size	softmax_forward, .-softmax_forward
	.globl	model_forward
	.type	model_forward, @function
model_forward:
.LFB10:
	.loc 1 119 1
	.cfi_startproc
	endbr64	
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$48, %rsp	#,
	movq	%rdi, -24(%rbp)	# model, model
	movq	%rsi, -32(%rbp)	# activations, activations
	movq	%rdx, -40(%rbp)	# data, data
.LBB12:
# src/deep.c:120:     for (size_t idx_layer = 0; idx_layer < model->size_layers; idx_layer++) {
	.loc 1 120 17
	movq	$0, -16(%rbp)	#, idx_layer
# src/deep.c:120:     for (size_t idx_layer = 0; idx_layer < model->size_layers; idx_layer++) {
	.loc 1 120 5
	jmp	.L29	#
.L30:
.LBB13:
# src/deep.c:121:         Layer *layer = model->layers[idx_layer];
	.loc 1 121 29 discriminator 3
	movq	-24(%rbp), %rax	# model, tmp93
	movq	(%rax), %rax	# model_16(D)->layers, _1
# src/deep.c:121:         Layer *layer = model->layers[idx_layer];
	.loc 1 121 37 discriminator 3
	movq	-16(%rbp), %rdx	# idx_layer, tmp94
	salq	$3, %rdx	#, _2
	addq	%rdx, %rax	# _2, _3
# src/deep.c:121:         Layer *layer = model->layers[idx_layer];
	.loc 1 121 16 discriminator 3
	movq	(%rax), %rax	# *_3, tmp95
	movq	%rax, -8(%rbp)	# tmp95, layer
# src/deep.c:122:         matmul_forward(layer, layer->activations_input, layer->activations_output, data->nImages);
	.loc 1 122 88 discriminator 3
	movq	-40(%rbp), %rax	# data, tmp96
	movl	16(%rax), %eax	# data_18(D)->nImages, _4
# src/deep.c:122:         matmul_forward(layer, layer->activations_input, layer->activations_output, data->nImages);
	.loc 1 122 9 discriminator 3
	movslq	%eax, %rcx	# _4, _5
	movq	-8(%rbp), %rax	# layer, tmp97
	movq	24(%rax), %rdx	# layer_17->activations_output, _6
	movq	-8(%rbp), %rax	# layer, tmp98
	movq	16(%rax), %rsi	# layer_17->activations_input, _7
	movq	-8(%rbp), %rax	# layer, tmp99
	movq	%rax, %rdi	# tmp99,
	call	matmul_forward	#
# src/deep.c:123:         layer->activation_forward(layer, data->nImages);
	.loc 1 123 14 discriminator 3
	movq	-8(%rbp), %rax	# layer, tmp100
	movq	80(%rax), %rcx	# layer_17->activation_forward, _8
# src/deep.c:123:         layer->activation_forward(layer, data->nImages);
	.loc 1 123 46 discriminator 3
	movq	-40(%rbp), %rax	# data, tmp101
	movl	16(%rax), %eax	# data_18(D)->nImages, _9
# src/deep.c:123:         layer->activation_forward(layer, data->nImages);
	.loc 1 123 9 discriminator 3
	movslq	%eax, %rdx	# _9, _10
	movq	-8(%rbp), %rax	# layer, tmp102
	movq	%rdx, %rsi	# _10,
	movq	%rax, %rdi	# tmp102,
	call	*%rcx	# _8
.LVL0:
.LBE13:
# src/deep.c:120:     for (size_t idx_layer = 0; idx_layer < model->size_layers; idx_layer++) {
	.loc 1 120 73 discriminator 3
	addq	$1, -16(%rbp)	#, idx_layer
.L29:
# src/deep.c:120:     for (size_t idx_layer = 0; idx_layer < model->size_layers; idx_layer++) {
	.loc 1 120 49 discriminator 1
	movq	-24(%rbp), %rax	# model, tmp103
	movq	8(%rax), %rax	# model_16(D)->size_layers, _11
# src/deep.c:120:     for (size_t idx_layer = 0; idx_layer < model->size_layers; idx_layer++) {
	.loc 1 120 5 discriminator 1
	cmpq	%rax, -16(%rbp)	# _11, idx_layer
	jb	.L30	#,
.LBE12:
# src/deep.c:125: }
	.loc 1 125 1
	nop	
	nop	
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE10:
	.size	model_forward, .-model_forward
	.globl	loss_softmax_backward
	.type	loss_softmax_backward, @function
loss_softmax_backward:
.LFB11:
	.loc 1 129 1
	.cfi_startproc
	endbr64	
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movq	%rdi, -40(%rbp)	# layer, layer
	movq	%rsi, -48(%rbp)	# labels, labels
	movq	%rdx, -56(%rbp)	# size_batch, size_batch
.LBB14:
# src/deep.c:130:     for (size_t idx_image = 0; idx_image < size_batch; idx_image++){
	.loc 1 130 17
	movq	$0, -24(%rbp)	#, idx_image
# src/deep.c:130:     for (size_t idx_image = 0; idx_image < size_batch; idx_image++){
	.loc 1 130 5
	jmp	.L32	#
.L37:
.LBB15:
# src/deep.c:131:         for (size_t idx_logit = 0; idx_logit < layer->size_neurons; idx_logit++){
	.loc 1 131 21
	movq	$0, -16(%rbp)	#, idx_logit
# src/deep.c:131:         for (size_t idx_logit = 0; idx_logit < layer->size_neurons; idx_logit++){
	.loc 1 131 9
	jmp	.L33	#
.L36:
.LBB16:
# src/deep.c:132:             float label = idx_logit == labels[idx_image] ? 1.0 : 0.0;
	.loc 1 132 46
	movq	-48(%rbp), %rdx	# labels, tmp97
	movq	-24(%rbp), %rax	# idx_image, tmp98
	addq	%rdx, %rax	# tmp97, _1
	movzbl	(%rax), %eax	# *_1, _2
	movzbl	%al, %eax	# _2, _3
# src/deep.c:132:             float label = idx_logit == labels[idx_image] ? 1.0 : 0.0;
	.loc 1 132 64
	cmpq	%rax, -16(%rbp)	# _3, idx_logit
	jne	.L34	#,
# src/deep.c:132:             float label = idx_logit == labels[idx_image] ? 1.0 : 0.0;
	.loc 1 132 64 is_stmt 0 discriminator 1
	movss	.LC2(%rip), %xmm0	#, iftmp.0_17
	jmp	.L35	#
.L34:
# src/deep.c:132:             float label = idx_logit == labels[idx_image] ? 1.0 : 0.0;
	.loc 1 132 64 discriminator 2
	pxor	%xmm0, %xmm0	# iftmp.0_17
.L35:
# src/deep.c:132:             float label = idx_logit == labels[idx_image] ? 1.0 : 0.0;
	.loc 1 132 19 is_stmt 1 discriminator 4
	movss	%xmm0, -28(%rbp)	# iftmp.0_17, label
# src/deep.c:133:             size_t offset_logit = idx_image * layer->size_neurons + idx_logit;
	.loc 1 133 52 discriminator 4
	movq	-40(%rbp), %rax	# layer, tmp99
	movq	72(%rax), %rax	# layer_24(D)->size_neurons, _4
# src/deep.c:133:             size_t offset_logit = idx_image * layer->size_neurons + idx_logit;
	.loc 1 133 45 discriminator 4
	imulq	-24(%rbp), %rax	# idx_image, _4
	movq	%rax, %rdx	# _4, _5
# src/deep.c:133:             size_t offset_logit = idx_image * layer->size_neurons + idx_logit;
	.loc 1 133 20 discriminator 4
	movq	-16(%rbp), %rax	# idx_logit, tmp103
	addq	%rdx, %rax	# _5, tmp102
	movq	%rax, -8(%rbp)	# tmp102, offset_logit
# src/deep.c:134:             layer->gradients_output[offset_logit] = layer->activations_output[offset_logit] - label;
	.loc 1 134 58 discriminator 4
	movq	-40(%rbp), %rax	# layer, tmp104
	movq	24(%rax), %rax	# layer_24(D)->activations_output, _6
# src/deep.c:134:             layer->gradients_output[offset_logit] = layer->activations_output[offset_logit] - label;
	.loc 1 134 78 discriminator 4
	movq	-8(%rbp), %rdx	# offset_logit, tmp105
	salq	$2, %rdx	#, _7
	addq	%rdx, %rax	# _7, _8
	movss	(%rax), %xmm0	# *_8, _9
# src/deep.c:134:             layer->gradients_output[offset_logit] = layer->activations_output[offset_logit] - label;
	.loc 1 134 18 discriminator 4
	movq	-40(%rbp), %rax	# layer, tmp106
	movq	40(%rax), %rax	# layer_24(D)->gradients_output, _10
# src/deep.c:134:             layer->gradients_output[offset_logit] = layer->activations_output[offset_logit] - label;
	.loc 1 134 36 discriminator 4
	movq	-8(%rbp), %rdx	# offset_logit, tmp107
	salq	$2, %rdx	#, _11
	addq	%rdx, %rax	# _11, _12
# src/deep.c:134:             layer->gradients_output[offset_logit] = layer->activations_output[offset_logit] - label;
	.loc 1 134 93 discriminator 4
	subss	-28(%rbp), %xmm0	# label, _13
# src/deep.c:134:             layer->gradients_output[offset_logit] = layer->activations_output[offset_logit] - label;
	.loc 1 134 51 discriminator 4
	movss	%xmm0, (%rax)	# _13, *_12
.LBE16:
# src/deep.c:131:         for (size_t idx_logit = 0; idx_logit < layer->size_neurons; idx_logit++){
	.loc 1 131 78 discriminator 4
	addq	$1, -16(%rbp)	#, idx_logit
.L33:
# src/deep.c:131:         for (size_t idx_logit = 0; idx_logit < layer->size_neurons; idx_logit++){
	.loc 1 131 53 discriminator 2
	movq	-40(%rbp), %rax	# layer, tmp108
	movq	72(%rax), %rax	# layer_24(D)->size_neurons, _14
# src/deep.c:131:         for (size_t idx_logit = 0; idx_logit < layer->size_neurons; idx_logit++){
	.loc 1 131 9 discriminator 2
	cmpq	%rax, -16(%rbp)	# _14, idx_logit
	jb	.L36	#,
.LBE15:
# src/deep.c:130:     for (size_t idx_image = 0; idx_image < size_batch; idx_image++){
	.loc 1 130 65 discriminator 2
	addq	$1, -24(%rbp)	#, idx_image
.L32:
# src/deep.c:130:     for (size_t idx_image = 0; idx_image < size_batch; idx_image++){
	.loc 1 130 5 discriminator 1
	movq	-24(%rbp), %rax	# idx_image, tmp109
	cmpq	-56(%rbp), %rax	# size_batch, tmp109
	jb	.L37	#,
.LBE14:
# src/deep.c:137: }
	.loc 1 137 1
	nop	
	nop	
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE11:
	.size	loss_softmax_backward, .-loss_softmax_backward
	.globl	relu_backward
	.type	relu_backward, @function
relu_backward:
.LFB12:
	.loc 1 140 1
	.cfi_startproc
	endbr64	
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movq	%rdi, -40(%rbp)	# layer, layer
	movq	%rsi, -48(%rbp)	# labels, labels
	movq	%rdx, -56(%rbp)	# size_batch, size_batch
.LBB17:
# src/deep.c:141:     for (size_t idx_sample = 0; idx_sample < size_batch; idx_sample++){
	.loc 1 141 17
	movq	$0, -24(%rbp)	#, idx_sample
# src/deep.c:141:     for (size_t idx_sample = 0; idx_sample < size_batch; idx_sample++){
	.loc 1 141 5
	jmp	.L39	#
.L44:
.LBB18:
# src/deep.c:142:         for (size_t idx_neuron = 0; idx_neuron < layer->size_neurons; idx_neuron++){
	.loc 1 142 21
	movq	$0, -16(%rbp)	#, idx_neuron
# src/deep.c:142:         for (size_t idx_neuron = 0; idx_neuron < layer->size_neurons; idx_neuron++){
	.loc 1 142 9
	jmp	.L40	#
.L43:
.LBB19:
# src/deep.c:143:             size_t offset_grad = idx_sample * layer->size_neurons + idx_neuron;
	.loc 1 143 52
	movq	-40(%rbp), %rax	# layer, tmp92
	movq	72(%rax), %rax	# layer_20(D)->size_neurons, _1
# src/deep.c:143:             size_t offset_grad = idx_sample * layer->size_neurons + idx_neuron;
	.loc 1 143 45
	imulq	-24(%rbp), %rax	# idx_sample, _1
	movq	%rax, %rdx	# _1, _2
# src/deep.c:143:             size_t offset_grad = idx_sample * layer->size_neurons + idx_neuron;
	.loc 1 143 20
	movq	-16(%rbp), %rax	# idx_neuron, tmp96
	addq	%rdx, %rax	# _2, tmp95
	movq	%rax, -8(%rbp)	# tmp95, offset_grad
# src/deep.c:144:             if (layer->activations_output[offset_grad] <= 0){
	.loc 1 144 22
	movq	-40(%rbp), %rax	# layer, tmp97
	movq	24(%rax), %rax	# layer_20(D)->activations_output, _3
# src/deep.c:144:             if (layer->activations_output[offset_grad] <= 0){
	.loc 1 144 42
	movq	-8(%rbp), %rdx	# offset_grad, tmp98
	salq	$2, %rdx	#, _4
	addq	%rdx, %rax	# _4, _5
	movss	(%rax), %xmm1	# *_5, _6
# src/deep.c:144:             if (layer->activations_output[offset_grad] <= 0){
	.loc 1 144 16
	pxor	%xmm0, %xmm0	# tmp99
	comiss	%xmm1, %xmm0	# _6, tmp99
	jb	.L41	#,
# src/deep.c:145:                 layer->gradients_output[offset_grad] = 0;
	.loc 1 145 22
	movq	-40(%rbp), %rax	# layer, tmp100
	movq	40(%rax), %rax	# layer_20(D)->gradients_output, _7
# src/deep.c:145:                 layer->gradients_output[offset_grad] = 0;
	.loc 1 145 40
	movq	-8(%rbp), %rdx	# offset_grad, tmp101
	salq	$2, %rdx	#, _8
	addq	%rdx, %rax	# _8, _9
# src/deep.c:145:                 layer->gradients_output[offset_grad] = 0;
	.loc 1 145 54
	pxor	%xmm0, %xmm0	# tmp102
	movss	%xmm0, (%rax)	# tmp102, *_9
.L41:
.LBE19:
# src/deep.c:142:         for (size_t idx_neuron = 0; idx_neuron < layer->size_neurons; idx_neuron++){
	.loc 1 142 81 discriminator 2
	addq	$1, -16(%rbp)	#, idx_neuron
.L40:
# src/deep.c:142:         for (size_t idx_neuron = 0; idx_neuron < layer->size_neurons; idx_neuron++){
	.loc 1 142 55 discriminator 1
	movq	-40(%rbp), %rax	# layer, tmp103
	movq	72(%rax), %rax	# layer_20(D)->size_neurons, _10
# src/deep.c:142:         for (size_t idx_neuron = 0; idx_neuron < layer->size_neurons; idx_neuron++){
	.loc 1 142 9 discriminator 1
	cmpq	%rax, -16(%rbp)	# _10, idx_neuron
	jb	.L43	#,
.LBE18:
# src/deep.c:141:     for (size_t idx_sample = 0; idx_sample < size_batch; idx_sample++){
	.loc 1 141 68 discriminator 2
	addq	$1, -24(%rbp)	#, idx_sample
.L39:
# src/deep.c:141:     for (size_t idx_sample = 0; idx_sample < size_batch; idx_sample++){
	.loc 1 141 5 discriminator 1
	movq	-24(%rbp), %rax	# idx_sample, tmp104
	cmpq	-56(%rbp), %rax	# size_batch, tmp104
	jb	.L44	#,
.LBE17:
# src/deep.c:150: }
	.loc 1 150 1
	nop	
	nop	
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE12:
	.size	relu_backward, .-relu_backward
	.globl	matmul_backward
	.type	matmul_backward, @function
matmul_backward:
.LFB13:
	.loc 1 153 1
	.cfi_startproc
	endbr64	
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movq	%rdi, -88(%rbp)	# layer, layer
	movq	%rsi, -96(%rbp)	# size_batch, size_batch
.LBB20:
# src/deep.c:154:     for (size_t idx_sample = 0; idx_sample < size_batch; idx_sample++){
	.loc 1 154 17
	movq	$0, -72(%rbp)	#, idx_sample
# src/deep.c:154:     for (size_t idx_sample = 0; idx_sample < size_batch; idx_sample++){
	.loc 1 154 5
	jmp	.L47	#
.L54:
.LBB21:
# src/deep.c:155:         for (size_t idx_neuron = 0; idx_neuron < layer->size_neurons; idx_neuron++){
	.loc 1 155 21
	movq	$0, -64(%rbp)	#, idx_neuron
# src/deep.c:155:         for (size_t idx_neuron = 0; idx_neuron < layer->size_neurons; idx_neuron++){
	.loc 1 155 9
	jmp	.L48	#
.L53:
.LBB22:
# src/deep.c:156:             size_t offset_grad_pre_act = idx_sample * layer->size_neurons + idx_neuron;
	.loc 1 156 60
	movq	-88(%rbp), %rax	# layer, tmp161
	movq	72(%rax), %rax	# layer_97(D)->size_neurons, _1
# src/deep.c:156:             size_t offset_grad_pre_act = idx_sample * layer->size_neurons + idx_neuron;
	.loc 1 156 53
	imulq	-72(%rbp), %rax	# idx_sample, _1
	movq	%rax, %rdx	# _1, _2
# src/deep.c:156:             size_t offset_grad_pre_act = idx_sample * layer->size_neurons + idx_neuron;
	.loc 1 156 20
	movq	-64(%rbp), %rax	# idx_neuron, tmp165
	addq	%rdx, %rax	# _2, tmp164
	movq	%rax, -24(%rbp)	# tmp164, offset_grad_pre_act
# src/deep.c:157:             if (layer->gradients_biases){
	.loc 1 157 22
	movq	-88(%rbp), %rax	# layer, tmp166
	movq	56(%rax), %rax	# layer_97(D)->gradients_biases, _3
# src/deep.c:157:             if (layer->gradients_biases){
	.loc 1 157 16
	testq	%rax, %rax	# _3
	je	.L49	#,
# src/deep.c:158:                 layer->gradients_biases[idx_neuron] += layer->gradients_output[offset_grad_pre_act];
	.loc 1 158 22
	movq	-88(%rbp), %rax	# layer, tmp167
	movq	56(%rax), %rax	# layer_97(D)->gradients_biases, _4
# src/deep.c:158:                 layer->gradients_biases[idx_neuron] += layer->gradients_output[offset_grad_pre_act];
	.loc 1 158 53
	movq	-64(%rbp), %rdx	# idx_neuron, tmp168
	salq	$2, %rdx	#, _5
	addq	%rdx, %rax	# _5, _6
	movss	(%rax), %xmm1	# *_6, _7
# src/deep.c:158:                 layer->gradients_biases[idx_neuron] += layer->gradients_output[offset_grad_pre_act];
	.loc 1 158 61
	movq	-88(%rbp), %rax	# layer, tmp169
	movq	40(%rax), %rax	# layer_97(D)->gradients_output, _8
# src/deep.c:158:                 layer->gradients_biases[idx_neuron] += layer->gradients_output[offset_grad_pre_act];
	.loc 1 158 79
	movq	-24(%rbp), %rdx	# offset_grad_pre_act, tmp170
	salq	$2, %rdx	#, _9
	addq	%rdx, %rax	# _9, _10
	movss	(%rax), %xmm0	# *_10, _11
# src/deep.c:158:                 layer->gradients_biases[idx_neuron] += layer->gradients_output[offset_grad_pre_act];
	.loc 1 158 22
	movq	-88(%rbp), %rax	# layer, tmp171
	movq	56(%rax), %rax	# layer_97(D)->gradients_biases, _12
# src/deep.c:158:                 layer->gradients_biases[idx_neuron] += layer->gradients_output[offset_grad_pre_act];
	.loc 1 158 53
	movq	-64(%rbp), %rdx	# idx_neuron, tmp172
	salq	$2, %rdx	#, _13
	addq	%rdx, %rax	# _13, _14
	addss	%xmm1, %xmm0	# _7, _15
	movss	%xmm0, (%rax)	# _15, *_14
.L49:
.LBB23:
# src/deep.c:160:             for (size_t idx_weight = 0; idx_weight < layer->size_inputs; idx_weight++){
	.loc 1 160 25
	movq	$0, -56(%rbp)	#, idx_weight
# src/deep.c:160:             for (size_t idx_weight = 0; idx_weight < layer->size_inputs; idx_weight++){
	.loc 1 160 13
	jmp	.L50	#
.L52:
.LBB24:
# src/deep.c:161:                 size_t offset_weight = idx_neuron * layer->size_inputs + idx_weight;
	.loc 1 161 58
	movq	-88(%rbp), %rax	# layer, tmp173
	movq	64(%rax), %rax	# layer_97(D)->size_inputs, _16
# src/deep.c:161:                 size_t offset_weight = idx_neuron * layer->size_inputs + idx_weight;
	.loc 1 161 51
	imulq	-64(%rbp), %rax	# idx_neuron, _16
	movq	%rax, %rdx	# _16, _17
# src/deep.c:161:                 size_t offset_weight = idx_neuron * layer->size_inputs + idx_weight;
	.loc 1 161 24
	movq	-56(%rbp), %rax	# idx_weight, tmp177
	addq	%rdx, %rax	# _17, tmp176
	movq	%rax, -16(%rbp)	# tmp176, offset_weight
# src/deep.c:162:                 size_t offset_input = idx_sample * layer->size_inputs + idx_weight;
	.loc 1 162 57
	movq	-88(%rbp), %rax	# layer, tmp178
	movq	64(%rax), %rax	# layer_97(D)->size_inputs, _18
# src/deep.c:162:                 size_t offset_input = idx_sample * layer->size_inputs + idx_weight;
	.loc 1 162 50
	imulq	-72(%rbp), %rax	# idx_sample, _18
	movq	%rax, %rdx	# _18, _19
# src/deep.c:162:                 size_t offset_input = idx_sample * layer->size_inputs + idx_weight;
	.loc 1 162 24
	movq	-56(%rbp), %rax	# idx_weight, tmp182
	addq	%rdx, %rax	# _19, tmp181
	movq	%rax, -8(%rbp)	# tmp181, offset_input
# src/deep.c:163:                 layer->gradients_weights[offset_weight] += layer->activations_input[offset_input] * layer->activations_output[offset_grad_pre_act];
	.loc 1 163 22
	movq	-88(%rbp), %rax	# layer, tmp183
	movq	48(%rax), %rax	# layer_97(D)->gradients_weights, _20
# src/deep.c:163:                 layer->gradients_weights[offset_weight] += layer->activations_input[offset_input] * layer->activations_output[offset_grad_pre_act];
	.loc 1 163 57
	movq	-16(%rbp), %rdx	# offset_weight, tmp184
	salq	$2, %rdx	#, _21
	addq	%rdx, %rax	# _21, _22
	movss	(%rax), %xmm1	# *_22, _23
# src/deep.c:163:                 layer->gradients_weights[offset_weight] += layer->activations_input[offset_input] * layer->activations_output[offset_grad_pre_act];
	.loc 1 163 65
	movq	-88(%rbp), %rax	# layer, tmp185
	movq	16(%rax), %rax	# layer_97(D)->activations_input, _24
# src/deep.c:163:                 layer->gradients_weights[offset_weight] += layer->activations_input[offset_input] * layer->activations_output[offset_grad_pre_act];
	.loc 1 163 84
	movq	-8(%rbp), %rdx	# offset_input, tmp186
	salq	$2, %rdx	#, _25
	addq	%rdx, %rax	# _25, _26
	movss	(%rax), %xmm2	# *_26, _27
# src/deep.c:163:                 layer->gradients_weights[offset_weight] += layer->activations_input[offset_input] * layer->activations_output[offset_grad_pre_act];
	.loc 1 163 106
	movq	-88(%rbp), %rax	# layer, tmp187
	movq	24(%rax), %rax	# layer_97(D)->activations_output, _28
# src/deep.c:163:                 layer->gradients_weights[offset_weight] += layer->activations_input[offset_input] * layer->activations_output[offset_grad_pre_act];
	.loc 1 163 126
	movq	-24(%rbp), %rdx	# offset_grad_pre_act, tmp188
	salq	$2, %rdx	#, _29
	addq	%rdx, %rax	# _29, _30
	movss	(%rax), %xmm0	# *_30, _31
# src/deep.c:163:                 layer->gradients_weights[offset_weight] += layer->activations_input[offset_input] * layer->activations_output[offset_grad_pre_act];
	.loc 1 163 99
	mulss	%xmm2, %xmm0	# _27, _32
# src/deep.c:163:                 layer->gradients_weights[offset_weight] += layer->activations_input[offset_input] * layer->activations_output[offset_grad_pre_act];
	.loc 1 163 22
	movq	-88(%rbp), %rax	# layer, tmp189
	movq	48(%rax), %rax	# layer_97(D)->gradients_weights, _33
# src/deep.c:163:                 layer->gradients_weights[offset_weight] += layer->activations_input[offset_input] * layer->activations_output[offset_grad_pre_act];
	.loc 1 163 57
	movq	-16(%rbp), %rdx	# offset_weight, tmp190
	salq	$2, %rdx	#, _34
	addq	%rdx, %rax	# _34, _35
	addss	%xmm1, %xmm0	# _23, _36
	movss	%xmm0, (%rax)	# _36, *_35
# src/deep.c:164:                 if (layer->gradients_input){
	.loc 1 164 26
	movq	-88(%rbp), %rax	# layer, tmp191
	movq	32(%rax), %rax	# layer_97(D)->gradients_input, _37
# src/deep.c:164:                 if (layer->gradients_input){
	.loc 1 164 20
	testq	%rax, %rax	# _37
	je	.L51	#,
# src/deep.c:165:                     layer->gradients_input[offset_input] += layer->weights[offset_weight] * layer->gradients_output[offset_grad_pre_act];
	.loc 1 165 26
	movq	-88(%rbp), %rax	# layer, tmp192
	movq	32(%rax), %rax	# layer_97(D)->gradients_input, _38
# src/deep.c:165:                     layer->gradients_input[offset_input] += layer->weights[offset_weight] * layer->gradients_output[offset_grad_pre_act];
	.loc 1 165 58
	movq	-8(%rbp), %rdx	# offset_input, tmp193
	salq	$2, %rdx	#, _39
	addq	%rdx, %rax	# _39, _40
	movss	(%rax), %xmm1	# *_40, _41
# src/deep.c:165:                     layer->gradients_input[offset_input] += layer->weights[offset_weight] * layer->gradients_output[offset_grad_pre_act];
	.loc 1 165 66
	movq	-88(%rbp), %rax	# layer, tmp194
	movq	(%rax), %rax	# layer_97(D)->weights, _42
# src/deep.c:165:                     layer->gradients_input[offset_input] += layer->weights[offset_weight] * layer->gradients_output[offset_grad_pre_act];
	.loc 1 165 75
	movq	-16(%rbp), %rdx	# offset_weight, tmp195
	salq	$2, %rdx	#, _43
	addq	%rdx, %rax	# _43, _44
	movss	(%rax), %xmm2	# *_44, _45
# src/deep.c:165:                     layer->gradients_input[offset_input] += layer->weights[offset_weight] * layer->gradients_output[offset_grad_pre_act];
	.loc 1 165 98
	movq	-88(%rbp), %rax	# layer, tmp196
	movq	40(%rax), %rax	# layer_97(D)->gradients_output, _46
# src/deep.c:165:                     layer->gradients_input[offset_input] += layer->weights[offset_weight] * layer->gradients_output[offset_grad_pre_act];
	.loc 1 165 116
	movq	-24(%rbp), %rdx	# offset_grad_pre_act, tmp197
	salq	$2, %rdx	#, _47
	addq	%rdx, %rax	# _47, _48
	movss	(%rax), %xmm0	# *_48, _49
# src/deep.c:165:                     layer->gradients_input[offset_input] += layer->weights[offset_weight] * layer->gradients_output[offset_grad_pre_act];
	.loc 1 165 91
	mulss	%xmm2, %xmm0	# _45, _50
# src/deep.c:165:                     layer->gradients_input[offset_input] += layer->weights[offset_weight] * layer->gradients_output[offset_grad_pre_act];
	.loc 1 165 26
	movq	-88(%rbp), %rax	# layer, tmp198
	movq	32(%rax), %rax	# layer_97(D)->gradients_input, _51
# src/deep.c:165:                     layer->gradients_input[offset_input] += layer->weights[offset_weight] * layer->gradients_output[offset_grad_pre_act];
	.loc 1 165 58
	movq	-8(%rbp), %rdx	# offset_input, tmp199
	salq	$2, %rdx	#, _52
	addq	%rdx, %rax	# _52, _53
	addss	%xmm1, %xmm0	# _41, _54
	movss	%xmm0, (%rax)	# _54, *_53
.L51:
.LBE24:
# src/deep.c:160:             for (size_t idx_weight = 0; idx_weight < layer->size_inputs; idx_weight++){
	.loc 1 160 84 discriminator 2
	addq	$1, -56(%rbp)	#, idx_weight
.L50:
# src/deep.c:160:             for (size_t idx_weight = 0; idx_weight < layer->size_inputs; idx_weight++){
	.loc 1 160 59 discriminator 1
	movq	-88(%rbp), %rax	# layer, tmp200
	movq	64(%rax), %rax	# layer_97(D)->size_inputs, _55
# src/deep.c:160:             for (size_t idx_weight = 0; idx_weight < layer->size_inputs; idx_weight++){
	.loc 1 160 13 discriminator 1
	cmpq	%rax, -56(%rbp)	# _55, idx_weight
	jb	.L52	#,
.LBE23:
.LBE22:
# src/deep.c:155:         for (size_t idx_neuron = 0; idx_neuron < layer->size_neurons; idx_neuron++){
	.loc 1 155 81 discriminator 2
	addq	$1, -64(%rbp)	#, idx_neuron
.L48:
# src/deep.c:155:         for (size_t idx_neuron = 0; idx_neuron < layer->size_neurons; idx_neuron++){
	.loc 1 155 55 discriminator 1
	movq	-88(%rbp), %rax	# layer, tmp201
	movq	72(%rax), %rax	# layer_97(D)->size_neurons, _56
# src/deep.c:155:         for (size_t idx_neuron = 0; idx_neuron < layer->size_neurons; idx_neuron++){
	.loc 1 155 9 discriminator 1
	cmpq	%rax, -64(%rbp)	# _56, idx_neuron
	jb	.L53	#,
.LBE21:
# src/deep.c:154:     for (size_t idx_sample = 0; idx_sample < size_batch; idx_sample++){
	.loc 1 154 68 discriminator 2
	addq	$1, -72(%rbp)	#, idx_sample
.L47:
# src/deep.c:154:     for (size_t idx_sample = 0; idx_sample < size_batch; idx_sample++){
	.loc 1 154 5 discriminator 1
	movq	-72(%rbp), %rax	# idx_sample, tmp202
	cmpq	-96(%rbp), %rax	# size_batch, tmp202
	jb	.L54	#,
.LBE20:
.LBB25:
# src/deep.c:170:     for (size_t idx_neuron = 0; idx_neuron < layer->size_neurons; idx_neuron++){
	.loc 1 170 17
	movq	$0, -48(%rbp)	#, idx_neuron
# src/deep.c:170:     for (size_t idx_neuron = 0; idx_neuron < layer->size_neurons; idx_neuron++){
	.loc 1 170 5
	jmp	.L55	#
.L63:
# src/deep.c:171:         if (layer->gradients_biases){
	.loc 1 171 18
	movq	-88(%rbp), %rax	# layer, tmp203
	movq	56(%rax), %rax	# layer_97(D)->gradients_biases, _57
# src/deep.c:171:         if (layer->gradients_biases){
	.loc 1 171 12
	testq	%rax, %rax	# _57
	je	.L56	#,
# src/deep.c:172:             layer->gradients_biases[idx_neuron] /= size_batch;
	.loc 1 172 18
	movq	-88(%rbp), %rax	# layer, tmp204
	movq	56(%rax), %rax	# layer_97(D)->gradients_biases, _58
# src/deep.c:172:             layer->gradients_biases[idx_neuron] /= size_batch;
	.loc 1 172 49
	movq	-48(%rbp), %rdx	# idx_neuron, tmp205
	salq	$2, %rdx	#, _59
	addq	%rdx, %rax	# _59, _60
	movss	(%rax), %xmm1	# *_60, _61
	movq	-96(%rbp), %rax	# size_batch, tmp206
	testq	%rax, %rax	# tmp206
	js	.L57	#,
	cvtsi2ssq	%rax, %xmm0	# tmp206, _62
	jmp	.L58	#
.L57:
	movq	%rax, %rdx	# tmp206, tmp208
	shrq	%rdx	# tmp208
	andl	$1, %eax	#, tmp209
	orq	%rax, %rdx	# tmp209, tmp208
	cvtsi2ssq	%rdx, %xmm0	# tmp208, tmp207
	addss	%xmm0, %xmm0	# tmp207, _62
.L58:
# src/deep.c:172:             layer->gradients_biases[idx_neuron] /= size_batch;
	.loc 1 172 18
	movq	-88(%rbp), %rax	# layer, tmp210
	movq	56(%rax), %rax	# layer_97(D)->gradients_biases, _63
# src/deep.c:172:             layer->gradients_biases[idx_neuron] /= size_batch;
	.loc 1 172 49
	movq	-48(%rbp), %rdx	# idx_neuron, tmp211
	salq	$2, %rdx	#, _64
	addq	%rdx, %rax	# _64, _65
	divss	%xmm0, %xmm1	# _62, _61
	movaps	%xmm1, %xmm0	# _61, _66
	movss	%xmm0, (%rax)	# _66, *_65
.L56:
.LBB26:
# src/deep.c:174:         for (size_t idx_weight = 0; idx_weight < layer->size_inputs; idx_weight++){
	.loc 1 174 21
	movq	$0, -40(%rbp)	#, idx_weight
# src/deep.c:174:         for (size_t idx_weight = 0; idx_weight < layer->size_inputs; idx_weight++){
	.loc 1 174 9
	jmp	.L59	#
.L62:
.LBB27:
# src/deep.c:175:             size_t offset_weight = idx_neuron * layer->size_inputs + idx_weight;
	.loc 1 175 54 discriminator 3
	movq	-88(%rbp), %rax	# layer, tmp212
	movq	64(%rax), %rax	# layer_97(D)->size_inputs, _67
# src/deep.c:175:             size_t offset_weight = idx_neuron * layer->size_inputs + idx_weight;
	.loc 1 175 47 discriminator 3
	imulq	-48(%rbp), %rax	# idx_neuron, _67
	movq	%rax, %rdx	# _67, _68
# src/deep.c:175:             size_t offset_weight = idx_neuron * layer->size_inputs + idx_weight;
	.loc 1 175 20 discriminator 3
	movq	-40(%rbp), %rax	# idx_weight, tmp216
	addq	%rdx, %rax	# _68, tmp215
	movq	%rax, -32(%rbp)	# tmp215, offset_weight
# src/deep.c:176:             layer->gradients_weights[offset_weight] /= size_batch;
	.loc 1 176 18 discriminator 3
	movq	-88(%rbp), %rax	# layer, tmp217
	movq	48(%rax), %rax	# layer_97(D)->gradients_weights, _69
# src/deep.c:176:             layer->gradients_weights[offset_weight] /= size_batch;
	.loc 1 176 53 discriminator 3
	movq	-32(%rbp), %rdx	# offset_weight, tmp218
	salq	$2, %rdx	#, _70
	addq	%rdx, %rax	# _70, _71
	movss	(%rax), %xmm1	# *_71, _72
	movq	-96(%rbp), %rax	# size_batch, tmp219
	testq	%rax, %rax	# tmp219
	js	.L60	#,
	cvtsi2ssq	%rax, %xmm0	# tmp219, _73
	jmp	.L61	#
.L60:
	movq	%rax, %rdx	# tmp219, tmp221
	shrq	%rdx	# tmp221
	andl	$1, %eax	#, tmp222
	orq	%rax, %rdx	# tmp222, tmp221
	cvtsi2ssq	%rdx, %xmm0	# tmp221, tmp220
	addss	%xmm0, %xmm0	# tmp220, _73
.L61:
# src/deep.c:176:             layer->gradients_weights[offset_weight] /= size_batch;
	.loc 1 176 18 discriminator 3
	movq	-88(%rbp), %rax	# layer, tmp223
	movq	48(%rax), %rax	# layer_97(D)->gradients_weights, _74
# src/deep.c:176:             layer->gradients_weights[offset_weight] /= size_batch;
	.loc 1 176 53 discriminator 3
	movq	-32(%rbp), %rdx	# offset_weight, tmp224
	salq	$2, %rdx	#, _75
	addq	%rdx, %rax	# _75, _76
	divss	%xmm0, %xmm1	# _73, _72
	movaps	%xmm1, %xmm0	# _72, _77
	movss	%xmm0, (%rax)	# _77, *_76
.LBE27:
# src/deep.c:174:         for (size_t idx_weight = 0; idx_weight < layer->size_inputs; idx_weight++){
	.loc 1 174 80 discriminator 3
	addq	$1, -40(%rbp)	#, idx_weight
.L59:
# src/deep.c:174:         for (size_t idx_weight = 0; idx_weight < layer->size_inputs; idx_weight++){
	.loc 1 174 55 discriminator 1
	movq	-88(%rbp), %rax	# layer, tmp225
	movq	64(%rax), %rax	# layer_97(D)->size_inputs, _78
# src/deep.c:174:         for (size_t idx_weight = 0; idx_weight < layer->size_inputs; idx_weight++){
	.loc 1 174 9 discriminator 1
	cmpq	%rax, -40(%rbp)	# _78, idx_weight
	jb	.L62	#,
.LBE26:
# src/deep.c:170:     for (size_t idx_neuron = 0; idx_neuron < layer->size_neurons; idx_neuron++){
	.loc 1 170 77 discriminator 2
	addq	$1, -48(%rbp)	#, idx_neuron
.L55:
# src/deep.c:170:     for (size_t idx_neuron = 0; idx_neuron < layer->size_neurons; idx_neuron++){
	.loc 1 170 51 discriminator 1
	movq	-88(%rbp), %rax	# layer, tmp226
	movq	72(%rax), %rax	# layer_97(D)->size_neurons, _79
# src/deep.c:170:     for (size_t idx_neuron = 0; idx_neuron < layer->size_neurons; idx_neuron++){
	.loc 1 170 5 discriminator 1
	cmpq	%rax, -48(%rbp)	# _79, idx_neuron
	jb	.L63	#,
.LBE25:
# src/deep.c:179: }
	.loc 1 179 1
	nop	
	nop	
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE13:
	.size	matmul_backward, .-matmul_backward
	.globl	update_layer
	.type	update_layer, @function
update_layer:
.LFB14:
	.loc 1 184 1
	.cfi_startproc
	endbr64	
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)	# layer, layer
	movss	%xmm0, -28(%rbp)	# learning_rate, learning_rate
.LBB28:
# src/deep.c:185:     for (size_t idx_weight = 0; idx_weight < layer->size_inputs * layer->size_neurons; idx_weight++) {
	.loc 1 185 17
	movq	$0, -16(%rbp)	#, idx_weight
# src/deep.c:185:     for (size_t idx_weight = 0; idx_weight < layer->size_inputs * layer->size_neurons; idx_weight++) {
	.loc 1 185 5
	jmp	.L65	#
.L66:
# src/deep.c:186:         layer->weights[idx_weight] -= learning_rate * layer->gradients_weights[idx_weight];
	.loc 1 186 14 discriminator 3
	movq	-24(%rbp), %rax	# layer, tmp112
	movq	(%rax), %rax	# layer_37(D)->weights, _1
# src/deep.c:186:         layer->weights[idx_weight] -= learning_rate * layer->gradients_weights[idx_weight];
	.loc 1 186 36 discriminator 3
	movq	-16(%rbp), %rdx	# idx_weight, tmp113
	salq	$2, %rdx	#, _2
	addq	%rdx, %rax	# _2, _3
	movss	(%rax), %xmm0	# *_3, _4
# src/deep.c:186:         layer->weights[idx_weight] -= learning_rate * layer->gradients_weights[idx_weight];
	.loc 1 186 60 discriminator 3
	movq	-24(%rbp), %rax	# layer, tmp114
	movq	48(%rax), %rax	# layer_37(D)->gradients_weights, _5
# src/deep.c:186:         layer->weights[idx_weight] -= learning_rate * layer->gradients_weights[idx_weight];
	.loc 1 186 79 discriminator 3
	movq	-16(%rbp), %rdx	# idx_weight, tmp115
	salq	$2, %rdx	#, _6
	addq	%rdx, %rax	# _6, _7
	movss	(%rax), %xmm1	# *_7, _8
# src/deep.c:186:         layer->weights[idx_weight] -= learning_rate * layer->gradients_weights[idx_weight];
	.loc 1 186 53 discriminator 3
	mulss	-28(%rbp), %xmm1	# learning_rate, _9
# src/deep.c:186:         layer->weights[idx_weight] -= learning_rate * layer->gradients_weights[idx_weight];
	.loc 1 186 14 discriminator 3
	movq	-24(%rbp), %rax	# layer, tmp116
	movq	(%rax), %rax	# layer_37(D)->weights, _10
# src/deep.c:186:         layer->weights[idx_weight] -= learning_rate * layer->gradients_weights[idx_weight];
	.loc 1 186 36 discriminator 3
	movq	-16(%rbp), %rdx	# idx_weight, tmp117
	salq	$2, %rdx	#, _11
	addq	%rdx, %rax	# _11, _12
	subss	%xmm1, %xmm0	# _9, _13
	movss	%xmm0, (%rax)	# _13, *_12
# src/deep.c:185:     for (size_t idx_weight = 0; idx_weight < layer->size_inputs * layer->size_neurons; idx_weight++) {
	.loc 1 185 98 discriminator 3
	addq	$1, -16(%rbp)	#, idx_weight
.L65:
# src/deep.c:185:     for (size_t idx_weight = 0; idx_weight < layer->size_inputs * layer->size_neurons; idx_weight++) {
	.loc 1 185 51 discriminator 1
	movq	-24(%rbp), %rax	# layer, tmp118
	movq	64(%rax), %rdx	# layer_37(D)->size_inputs, _14
# src/deep.c:185:     for (size_t idx_weight = 0; idx_weight < layer->size_inputs * layer->size_neurons; idx_weight++) {
	.loc 1 185 72 discriminator 1
	movq	-24(%rbp), %rax	# layer, tmp119
	movq	72(%rax), %rax	# layer_37(D)->size_neurons, _15
# src/deep.c:185:     for (size_t idx_weight = 0; idx_weight < layer->size_inputs * layer->size_neurons; idx_weight++) {
	.loc 1 185 65 discriminator 1
	imulq	%rdx, %rax	# _14, _16
# src/deep.c:185:     for (size_t idx_weight = 0; idx_weight < layer->size_inputs * layer->size_neurons; idx_weight++) {
	.loc 1 185 5 discriminator 1
	cmpq	%rax, -16(%rbp)	# _16, idx_weight
	jb	.L66	#,
.LBE28:
.LBB29:
# src/deep.c:188:     for (size_t idx_bias = 0; idx_bias < layer->size_neurons; idx_bias++) {
	.loc 1 188 17
	movq	$0, -8(%rbp)	#, idx_bias
# src/deep.c:188:     for (size_t idx_bias = 0; idx_bias < layer->size_neurons; idx_bias++) {
	.loc 1 188 5
	jmp	.L67	#
.L68:
# src/deep.c:189:         layer->biases[idx_bias] -= learning_rate * layer->gradients_biases[idx_bias];
	.loc 1 189 14 discriminator 3
	movq	-24(%rbp), %rax	# layer, tmp120
	movq	8(%rax), %rax	# layer_37(D)->biases, _17
# src/deep.c:189:         layer->biases[idx_bias] -= learning_rate * layer->gradients_biases[idx_bias];
	.loc 1 189 33 discriminator 3
	movq	-8(%rbp), %rdx	# idx_bias, tmp121
	salq	$2, %rdx	#, _18
	addq	%rdx, %rax	# _18, _19
	movss	(%rax), %xmm0	# *_19, _20
# src/deep.c:189:         layer->biases[idx_bias] -= learning_rate * layer->gradients_biases[idx_bias];
	.loc 1 189 57 discriminator 3
	movq	-24(%rbp), %rax	# layer, tmp122
	movq	56(%rax), %rax	# layer_37(D)->gradients_biases, _21
# src/deep.c:189:         layer->biases[idx_bias] -= learning_rate * layer->gradients_biases[idx_bias];
	.loc 1 189 75 discriminator 3
	movq	-8(%rbp), %rdx	# idx_bias, tmp123
	salq	$2, %rdx	#, _22
	addq	%rdx, %rax	# _22, _23
	movss	(%rax), %xmm1	# *_23, _24
# src/deep.c:189:         layer->biases[idx_bias] -= learning_rate * layer->gradients_biases[idx_bias];
	.loc 1 189 50 discriminator 3
	mulss	-28(%rbp), %xmm1	# learning_rate, _25
# src/deep.c:189:         layer->biases[idx_bias] -= learning_rate * layer->gradients_biases[idx_bias];
	.loc 1 189 14 discriminator 3
	movq	-24(%rbp), %rax	# layer, tmp124
	movq	8(%rax), %rax	# layer_37(D)->biases, _26
# src/deep.c:189:         layer->biases[idx_bias] -= learning_rate * layer->gradients_biases[idx_bias];
	.loc 1 189 33 discriminator 3
	movq	-8(%rbp), %rdx	# idx_bias, tmp125
	salq	$2, %rdx	#, _27
	addq	%rdx, %rax	# _27, _28
	subss	%xmm1, %xmm0	# _25, _29
	movss	%xmm0, (%rax)	# _29, *_28
# src/deep.c:188:     for (size_t idx_bias = 0; idx_bias < layer->size_neurons; idx_bias++) {
	.loc 1 188 71 discriminator 3
	addq	$1, -8(%rbp)	#, idx_bias
.L67:
# src/deep.c:188:     for (size_t idx_bias = 0; idx_bias < layer->size_neurons; idx_bias++) {
	.loc 1 188 47 discriminator 1
	movq	-24(%rbp), %rax	# layer, tmp126
	movq	72(%rax), %rax	# layer_37(D)->size_neurons, _30
# src/deep.c:188:     for (size_t idx_bias = 0; idx_bias < layer->size_neurons; idx_bias++) {
	.loc 1 188 5 discriminator 1
	cmpq	%rax, -8(%rbp)	# _30, idx_bias
	jb	.L68	#,
.LBE29:
# src/deep.c:191: }
	.loc 1 191 1
	nop	
	nop	
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE14:
	.size	update_layer, .-update_layer
	.globl	model_backward
	.type	model_backward, @function
model_backward:
.LFB15:
	.loc 1 195 1
	.cfi_startproc
	endbr64	
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$48, %rsp	#,
	movq	%rdi, -24(%rbp)	# model, model
	movq	%rsi, -32(%rbp)	# activations, activations
	movq	%rdx, -40(%rbp)	# data, data
.LBB30:
# src/deep.c:196:     for (int idx_layer = model->size_layers - 1; idx_layer >= 0; idx_layer--) {
	.loc 1 196 31
	movq	-24(%rbp), %rax	# model, tmp95
	movq	8(%rax), %rax	# model_17(D)->size_layers, _1
# src/deep.c:196:     for (int idx_layer = model->size_layers - 1; idx_layer >= 0; idx_layer--) {
	.loc 1 196 45
	subl	$1, %eax	#, _3
# src/deep.c:196:     for (int idx_layer = model->size_layers - 1; idx_layer >= 0; idx_layer--) {
	.loc 1 196 14
	movl	%eax, -12(%rbp)	# _3, idx_layer
# src/deep.c:196:     for (int idx_layer = model->size_layers - 1; idx_layer >= 0; idx_layer--) {
	.loc 1 196 5
	jmp	.L70	#
.L71:
.LBB31:
# src/deep.c:197:         Layer *layer = model->layers[idx_layer];
	.loc 1 197 29 discriminator 3
	movq	-24(%rbp), %rax	# model, tmp96
	movq	(%rax), %rax	# model_17(D)->layers, _4
# src/deep.c:197:         Layer *layer = model->layers[idx_layer];
	.loc 1 197 37 discriminator 3
	movl	-12(%rbp), %edx	# idx_layer, tmp97
	movslq	%edx, %rdx	# tmp97, _5
	salq	$3, %rdx	#, _6
	addq	%rdx, %rax	# _6, _7
# src/deep.c:197:         Layer *layer = model->layers[idx_layer];
	.loc 1 197 16 discriminator 3
	movq	(%rax), %rax	# *_7, tmp98
	movq	%rax, -8(%rbp)	# tmp98, layer
# src/deep.c:198:         layer->activation_backward(layer, data->labels, data->nImages);
	.loc 1 198 14 discriminator 3
	movq	-8(%rbp), %rax	# layer, tmp99
	movq	88(%rax), %r8	# layer_19->activation_backward, _8
# src/deep.c:198:         layer->activation_backward(layer, data->labels, data->nImages);
	.loc 1 198 61 discriminator 3
	movq	-40(%rbp), %rax	# data, tmp100
	movl	16(%rax), %eax	# data_20(D)->nImages, _9
# src/deep.c:198:         layer->activation_backward(layer, data->labels, data->nImages);
	.loc 1 198 9 discriminator 3
	movslq	%eax, %rdx	# _9, _10
	movq	-40(%rbp), %rax	# data, tmp101
	movq	8(%rax), %rcx	# data_20(D)->labels, _11
	movq	-8(%rbp), %rax	# layer, tmp102
	movq	%rcx, %rsi	# _11,
	movq	%rax, %rdi	# tmp102,
	call	*%r8	# _8
.LVL1:
# src/deep.c:199:         matmul_backward(layer, data->nImages);
	.loc 1 199 36 discriminator 3
	movq	-40(%rbp), %rax	# data, tmp103
	movl	16(%rax), %eax	# data_20(D)->nImages, _12
# src/deep.c:199:         matmul_backward(layer, data->nImages);
	.loc 1 199 9 discriminator 3
	movslq	%eax, %rdx	# _12, _13
	movq	-8(%rbp), %rax	# layer, tmp104
	movq	%rdx, %rsi	# _13,
	movq	%rax, %rdi	# tmp104,
	call	matmul_backward	#
# src/deep.c:200:         update_layer(layer, LEARNING_RATE);
	.loc 1 200 9 discriminator 3
	movq	-8(%rbp), %rax	# layer, tmp105
	movss	.LC3(%rip), %xmm0	#,
	movq	%rax, %rdi	# tmp105,
	call	update_layer	#
.LBE31:
# src/deep.c:196:     for (int idx_layer = model->size_layers - 1; idx_layer >= 0; idx_layer--) {
	.loc 1 196 75 discriminator 3
	subl	$1, -12(%rbp)	#, idx_layer
.L70:
# src/deep.c:196:     for (int idx_layer = model->size_layers - 1; idx_layer >= 0; idx_layer--) {
	.loc 1 196 5 discriminator 1
	cmpl	$0, -12(%rbp)	#, idx_layer
	jns	.L71	#,
.LBE30:
# src/deep.c:202: }
	.loc 1 202 1
	nop	
	nop	
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE15:
	.size	model_backward, .-model_backward
	.section	.rodata
.LC4:
	.string	"rb"
.LC5:
	.string	"rows: %d, cols: %d\n"
	.text
	.globl	read_mnist_images
	.type	read_mnist_images, @function
read_mnist_images:
.LFB16:
	.loc 1 205 63
	.cfi_startproc
	endbr64	
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$48, %rsp	#,
	movq	%rdi, -40(%rbp)	# filename, filename
	movq	%rsi, -48(%rbp)	# data, data
# src/deep.c:205: void read_mnist_images(const char *filename, InputData *data) {
	.loc 1 205 63
	movq	%fs:40, %rax	# MEM[(<address-space-1> long unsigned int *)40B], tmp142
	movq	%rax, -8(%rbp)	# tmp142, D.5538
	xorl	%eax, %eax	# tmp142
# src/deep.c:206:     FILE *file = fopen(filename, "rb");
	.loc 1 206 18
	movq	-40(%rbp), %rax	# filename, tmp113
	leaq	.LC4(%rip), %rsi	#,
	movq	%rax, %rdi	# tmp113,
	call	fopen@PLT	#
	movq	%rax, -16(%rbp)	# tmp114, file
# src/deep.c:207:     if (!file) exit(1);
	.loc 1 207 8
	cmpq	$0, -16(%rbp)	#, file
	jne	.L73	#,
# src/deep.c:207:     if (!file) exit(1);
	.loc 1 207 16 discriminator 1
	movl	$1, %edi	#,
	call	exit@PLT	#
.L73:
# src/deep.c:210:     fread(&temp, sizeof(int), 1, file);
	.loc 1 210 5
	movq	-16(%rbp), %rdx	# file, tmp115
	leaq	-20(%rbp), %rax	#, tmp116
	movq	%rdx, %rcx	# tmp115,
	movl	$1, %edx	#,
	movl	$4, %esi	#,
	movq	%rax, %rdi	# tmp116,
	call	fread@PLT	#
# src/deep.c:211:     fread(&data->nImages, sizeof(int), 1, file);
	.loc 1 211 11
	movq	-48(%rbp), %rax	# data, tmp117
	leaq	16(%rax), %rdi	#, _1
# src/deep.c:211:     fread(&data->nImages, sizeof(int), 1, file);
	.loc 1 211 5
	movq	-16(%rbp), %rax	# file, tmp118
	movq	%rax, %rcx	# tmp118,
	movl	$1, %edx	#,
	movl	$4, %esi	#,
	call	fread@PLT	#
# src/deep.c:212:     data->nImages = __builtin_bswap32(data->nImages);
	.loc 1 212 43
	movq	-48(%rbp), %rax	# data, tmp119
	movl	16(%rax), %eax	# data_37(D)->nImages, _2
# src/deep.c:212:     data->nImages = __builtin_bswap32(data->nImages);
	.loc 1 212 21
	bswap	%eax		# _4
	movl	%eax, %edx	# _4, _5
# src/deep.c:212:     data->nImages = __builtin_bswap32(data->nImages);
	.loc 1 212 19
	movq	-48(%rbp), %rax	# data, tmp120
	movl	%edx, 16(%rax)	# _5, data_37(D)->nImages
# src/deep.c:214:     fread(&data->rows, sizeof(int), 1, file);
	.loc 1 214 11
	movq	-48(%rbp), %rax	# data, tmp121
	leaq	20(%rax), %rdi	#, _6
# src/deep.c:214:     fread(&data->rows, sizeof(int), 1, file);
	.loc 1 214 5
	movq	-16(%rbp), %rax	# file, tmp122
	movq	%rax, %rcx	# tmp122,
	movl	$1, %edx	#,
	movl	$4, %esi	#,
	call	fread@PLT	#
# src/deep.c:215:     fread(&data->cols, sizeof(int), 1, file);
	.loc 1 215 11
	movq	-48(%rbp), %rax	# data, tmp123
	leaq	24(%rax), %rdi	#, _7
# src/deep.c:215:     fread(&data->cols, sizeof(int), 1, file);
	.loc 1 215 5
	movq	-16(%rbp), %rax	# file, tmp124
	movq	%rax, %rcx	# tmp124,
	movl	$1, %edx	#,
	movl	$4, %esi	#,
	call	fread@PLT	#
# src/deep.c:217:     data->rows = __builtin_bswap32(data->rows);
	.loc 1 217 40
	movq	-48(%rbp), %rax	# data, tmp125
	movl	20(%rax), %eax	# data_37(D)->rows, _8
# src/deep.c:217:     data->rows = __builtin_bswap32(data->rows);
	.loc 1 217 18
	bswap	%eax		# _10
	movl	%eax, %edx	# _10, _11
# src/deep.c:217:     data->rows = __builtin_bswap32(data->rows);
	.loc 1 217 16
	movq	-48(%rbp), %rax	# data, tmp126
	movl	%edx, 20(%rax)	# _11, data_37(D)->rows
# src/deep.c:218:     data->cols = __builtin_bswap32(data->cols);
	.loc 1 218 40
	movq	-48(%rbp), %rax	# data, tmp127
	movl	24(%rax), %eax	# data_37(D)->cols, _12
# src/deep.c:218:     data->cols = __builtin_bswap32(data->cols);
	.loc 1 218 18
	bswap	%eax		# _14
	movl	%eax, %edx	# _14, _15
# src/deep.c:218:     data->cols = __builtin_bswap32(data->cols);
	.loc 1 218 16
	movq	-48(%rbp), %rax	# data, tmp128
	movl	%edx, 24(%rax)	# _15, data_37(D)->cols
# src/deep.c:219:     printf("rows: %d, cols: %d\n", data->rows, data->cols);
	.loc 1 219 5
	movq	-48(%rbp), %rax	# data, tmp129
	movl	24(%rax), %edx	# data_37(D)->cols, _16
	movq	-48(%rbp), %rax	# data, tmp130
	movl	20(%rax), %eax	# data_37(D)->rows, _17
	movl	%eax, %esi	# _17,
	leaq	.LC5(%rip), %rdi	#,
	movl	$0, %eax	#,
	call	printf@PLT	#
# src/deep.c:221:     data->images = malloc(data->nImages * data->rows * data->cols);
	.loc 1 221 31
	movq	-48(%rbp), %rax	# data, tmp131
	movl	16(%rax), %edx	# data_37(D)->nImages, _18
# src/deep.c:221:     data->images = malloc(data->nImages * data->rows * data->cols);
	.loc 1 221 47
	movq	-48(%rbp), %rax	# data, tmp132
	movl	20(%rax), %eax	# data_37(D)->rows, _19
# src/deep.c:221:     data->images = malloc(data->nImages * data->rows * data->cols);
	.loc 1 221 41
	imull	%eax, %edx	# _19, _20
# src/deep.c:221:     data->images = malloc(data->nImages * data->rows * data->cols);
	.loc 1 221 60
	movq	-48(%rbp), %rax	# data, tmp133
	movl	24(%rax), %eax	# data_37(D)->cols, _21
# src/deep.c:221:     data->images = malloc(data->nImages * data->rows * data->cols);
	.loc 1 221 54
	imull	%edx, %eax	# _20, _22
# src/deep.c:221:     data->images = malloc(data->nImages * data->rows * data->cols);
	.loc 1 221 20
	cltq
	movq	%rax, %rdi	# _23,
	call	malloc@PLT	#
	movq	%rax, %rdx	# tmp134, _24
# src/deep.c:221:     data->images = malloc(data->nImages * data->rows * data->cols);
	.loc 1 221 18
	movq	-48(%rbp), %rax	# data, tmp135
	movq	%rdx, (%rax)	# _24, data_37(D)->images
# src/deep.c:222:     fread(data->images, sizeof(unsigned char), data->nImages * data->rows * data->cols, file);
	.loc 1 222 52
	movq	-48(%rbp), %rax	# data, tmp136
	movl	16(%rax), %edx	# data_37(D)->nImages, _25
# src/deep.c:222:     fread(data->images, sizeof(unsigned char), data->nImages * data->rows * data->cols, file);
	.loc 1 222 68
	movq	-48(%rbp), %rax	# data, tmp137
	movl	20(%rax), %eax	# data_37(D)->rows, _26
# src/deep.c:222:     fread(data->images, sizeof(unsigned char), data->nImages * data->rows * data->cols, file);
	.loc 1 222 62
	imull	%eax, %edx	# _26, _27
# src/deep.c:222:     fread(data->images, sizeof(unsigned char), data->nImages * data->rows * data->cols, file);
	.loc 1 222 81
	movq	-48(%rbp), %rax	# data, tmp138
	movl	24(%rax), %eax	# data_37(D)->cols, _28
# src/deep.c:222:     fread(data->images, sizeof(unsigned char), data->nImages * data->rows * data->cols, file);
	.loc 1 222 75
	imull	%edx, %eax	# _27, _29
# src/deep.c:222:     fread(data->images, sizeof(unsigned char), data->nImages * data->rows * data->cols, file);
	.loc 1 222 5
	movslq	%eax, %rdx	# _29, _30
# src/deep.c:222:     fread(data->images, sizeof(unsigned char), data->nImages * data->rows * data->cols, file);
	.loc 1 222 15
	movq	-48(%rbp), %rax	# data, tmp139
	movq	(%rax), %rax	# data_37(D)->images, _31
# src/deep.c:222:     fread(data->images, sizeof(unsigned char), data->nImages * data->rows * data->cols, file);
	.loc 1 222 5
	movq	-16(%rbp), %rcx	# file, tmp140
	movl	$1, %esi	#,
	movq	%rax, %rdi	# _31,
	call	fread@PLT	#
# src/deep.c:223:     fclose(file);
	.loc 1 223 5
	movq	-16(%rbp), %rax	# file, tmp141
	movq	%rax, %rdi	# tmp141,
	call	fclose@PLT	#
# src/deep.c:225: }
	.loc 1 225 1
	nop	
	movq	-8(%rbp), %rax	# D.5538, tmp143
	xorq	%fs:40, %rax	# MEM[(<address-space-1> long unsigned int *)40B], tmp143
	je	.L74	#,
	call	__stack_chk_fail@PLT	#
.L74:
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE16:
	.size	read_mnist_images, .-read_mnist_images
	.globl	read_mnist_labels
	.type	read_mnist_labels, @function
read_mnist_labels:
.LFB17:
	.loc 1 228 84
	.cfi_startproc
	endbr64	
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$64, %rsp	#,
	movq	%rdi, -40(%rbp)	# filename, filename
	movq	%rsi, -48(%rbp)	# labels, labels
	movq	%rdx, -56(%rbp)	# nLabels, nLabels
# src/deep.c:228: void read_mnist_labels(const char *filename, unsigned char **labels, int *nLabels) {
	.loc 1 228 84
	movq	%fs:40, %rax	# MEM[(<address-space-1> long unsigned int *)40B], tmp107
	movq	%rax, -8(%rbp)	# tmp107, D.5542
	xorl	%eax, %eax	# tmp107
# src/deep.c:229:     FILE *file = fopen(filename, "rb");
	.loc 1 229 18
	movq	-40(%rbp), %rax	# filename, tmp92
	leaq	.LC4(%rip), %rsi	#,
	movq	%rax, %rdi	# tmp92,
	call	fopen@PLT	#
	movq	%rax, -16(%rbp)	# tmp93, file
# src/deep.c:230:     if (!file) exit(1);
	.loc 1 230 8
	cmpq	$0, -16(%rbp)	#, file
	jne	.L76	#,
# src/deep.c:230:     if (!file) exit(1);
	.loc 1 230 16 discriminator 1
	movl	$1, %edi	#,
	call	exit@PLT	#
.L76:
# src/deep.c:233:     fread(&temp, sizeof(int), 1, file);
	.loc 1 233 5
	movq	-16(%rbp), %rdx	# file, tmp94
	leaq	-20(%rbp), %rax	#, tmp95
	movq	%rdx, %rcx	# tmp94,
	movl	$1, %edx	#,
	movl	$4, %esi	#,
	movq	%rax, %rdi	# tmp95,
	call	fread@PLT	#
# src/deep.c:234:     fread(nLabels, sizeof(int), 1, file);
	.loc 1 234 5
	movq	-16(%rbp), %rdx	# file, tmp96
	movq	-56(%rbp), %rax	# nLabels, tmp97
	movq	%rdx, %rcx	# tmp96,
	movl	$1, %edx	#,
	movl	$4, %esi	#,
	movq	%rax, %rdi	# tmp97,
	call	fread@PLT	#
# src/deep.c:235:     *nLabels = __builtin_bswap32(*nLabels);
	.loc 1 235 34
	movq	-56(%rbp), %rax	# nLabels, tmp98
	movl	(%rax), %eax	# *nLabels_16(D), _1
# src/deep.c:235:     *nLabels = __builtin_bswap32(*nLabels);
	.loc 1 235 16
	bswap	%eax		# _3
	movl	%eax, %edx	# _3, _4
# src/deep.c:235:     *nLabels = __builtin_bswap32(*nLabels);
	.loc 1 235 14
	movq	-56(%rbp), %rax	# nLabels, tmp99
	movl	%edx, (%rax)	# _4, *nLabels_16(D)
# src/deep.c:237:     *labels = malloc((*nLabels) * sizeof(unsigned char));
	.loc 1 237 23
	movq	-56(%rbp), %rax	# nLabels, tmp100
	movl	(%rax), %eax	# *nLabels_16(D), _5
# src/deep.c:237:     *labels = malloc((*nLabels) * sizeof(unsigned char));
	.loc 1 237 15
	cltq
	movq	%rax, %rdi	# _6,
	call	malloc@PLT	#
	movq	%rax, %rdx	# tmp101, _7
# src/deep.c:237:     *labels = malloc((*nLabels) * sizeof(unsigned char));
	.loc 1 237 13
	movq	-48(%rbp), %rax	# labels, tmp102
	movq	%rdx, (%rax)	# _7, *labels_20(D)
# src/deep.c:238:     fread(*labels, sizeof(unsigned char), (*nLabels), file);
	.loc 1 238 44
	movq	-56(%rbp), %rax	# nLabels, tmp103
	movl	(%rax), %eax	# *nLabels_16(D), _8
# src/deep.c:238:     fread(*labels, sizeof(unsigned char), (*nLabels), file);
	.loc 1 238 5
	movslq	%eax, %rdx	# _8, _9
	movq	-48(%rbp), %rax	# labels, tmp104
	movq	(%rax), %rax	# *labels_20(D), _10
	movq	-16(%rbp), %rcx	# file, tmp105
	movl	$1, %esi	#,
	movq	%rax, %rdi	# _10,
	call	fread@PLT	#
# src/deep.c:239:     fclose(file);
	.loc 1 239 5
	movq	-16(%rbp), %rax	# file, tmp106
	movq	%rax, %rdi	# tmp106,
	call	fclose@PLT	#
# src/deep.c:240: }
	.loc 1 240 1
	nop	
	movq	-8(%rbp), %rax	# D.5542, tmp108
	xorq	%fs:40, %rax	# MEM[(<address-space-1> long unsigned int *)40B], tmp108
	je	.L77	#,
	call	__stack_chk_fail@PLT	#
.L77:
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE17:
	.size	read_mnist_labels, .-read_mnist_labels
	.section	.rodata
.LC6:
	.string	"%Y%m%d_%H%M%S"
.LC7:
	.string	"%s_%s_h%d.mdl"
.LC8:
	.string	"\nsaving in file: %s\n"
.LC9:
	.string	"wb"
.LC10:
	.string	"Error opening file %s"
	.text
	.globl	save_model
	.type	save_model, @function
save_model:
.LFB18:
	.loc 1 244 53
	.cfi_startproc
	endbr64	
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$224, %rsp	#,
	movq	%rdi, -216(%rbp)	# model, model
	movq	%rsi, -224(%rbp)	# filename, filename
# src/deep.c:244: void save_model(Model * model, const char *filename){
	.loc 1 244 53
	movq	%fs:40, %rax	# MEM[(<address-space-1> long unsigned int *)40B], tmp102
	movq	%rax, -8(%rbp)	# tmp102, D.5543
	xorl	%eax, %eax	# tmp102
# src/deep.c:250:     time(&now);
	.loc 1 250 5
	leaq	-200(%rbp), %rax	#, tmp86
	movq	%rax, %rdi	# tmp86,
	call	time@PLT	#
# src/deep.c:253:     ts = localtime(&now);
	.loc 1 253 10
	leaq	-200(%rbp), %rax	#, tmp87
	movq	%rax, %rdi	# tmp87,
	call	localtime@PLT	#
	movq	%rax, -192(%rbp)	# tmp88, ts
# src/deep.c:254:     strftime(timestamp, sizeof timestamp, "%Y%m%d_%H%M%S", ts);
	.loc 1 254 5
	movq	-192(%rbp), %rdx	# ts, tmp89
	leaq	-176(%rbp), %rax	#, tmp90
	movq	%rdx, %rcx	# tmp89,
	leaq	.LC6(%rip), %rdx	#,
	movl	$32, %esi	#,
	movq	%rax, %rdi	# tmp90,
	call	strftime@PLT	#
# src/deep.c:258:     sprintf(filename_time, "%s_%s_h%d.mdl", filename, timestamp, SIZE_HIDDEN);
	.loc 1 258 5
	leaq	-176(%rbp), %rcx	#, tmp91
	movq	-224(%rbp), %rdx	# filename, tmp92
	leaq	-144(%rbp), %rax	#, tmp93
	movl	$32, %r8d	#,
	leaq	.LC7(%rip), %rsi	#,
	movq	%rax, %rdi	# tmp93,
	movl	$0, %eax	#,
	call	sprintf@PLT	#
# src/deep.c:260:     printf("\nsaving in file: %s\n", filename_time);
	.loc 1 260 5
	leaq	-144(%rbp), %rax	#, tmp94
	movq	%rax, %rsi	# tmp94,
	leaq	.LC8(%rip), %rdi	#,
	movl	$0, %eax	#,
	call	printf@PLT	#
# src/deep.c:261:     FILE *file = fopen(filename_time, "wb");
	.loc 1 261 18
	leaq	-144(%rbp), %rax	#, tmp95
	leaq	.LC9(%rip), %rsi	#,
	movq	%rax, %rdi	# tmp95,
	call	fopen@PLT	#
	movq	%rax, -184(%rbp)	# tmp96, file
# src/deep.c:262:     if (file == NULL) {
	.loc 1 262 8
	cmpq	$0, -184(%rbp)	#, file
	jne	.L79	#,
# src/deep.c:263:         printf("Error opening file %s", filename);
	.loc 1 263 9
	movq	-224(%rbp), %rax	# filename, tmp97
	movq	%rax, %rsi	# tmp97,
	leaq	.LC10(%rip), %rdi	#,
	movl	$0, %eax	#,
	call	printf@PLT	#
	jmp	.L78	#
.L79:
# src/deep.c:270:     fwrite(model->layers[0]->weights, sizeof(float), model->size_parameters, file);
	.loc 1 270 5
	movq	-216(%rbp), %rax	# model, tmp98
	movq	16(%rax), %rdx	# model_16(D)->size_parameters, _1
# src/deep.c:270:     fwrite(model->layers[0]->weights, sizeof(float), model->size_parameters, file);
	.loc 1 270 17
	movq	-216(%rbp), %rax	# model, tmp99
	movq	(%rax), %rax	# model_16(D)->layers, _2
# src/deep.c:270:     fwrite(model->layers[0]->weights, sizeof(float), model->size_parameters, file);
	.loc 1 270 25
	movq	(%rax), %rax	# *_2, _3
# src/deep.c:270:     fwrite(model->layers[0]->weights, sizeof(float), model->size_parameters, file);
	.loc 1 270 28
	movq	(%rax), %rax	# _3->weights, _4
# src/deep.c:270:     fwrite(model->layers[0]->weights, sizeof(float), model->size_parameters, file);
	.loc 1 270 5
	movq	-184(%rbp), %rcx	# file, tmp100
	movl	$4, %esi	#,
	movq	%rax, %rdi	# _4,
	call	fwrite@PLT	#
# src/deep.c:272:     fclose(file);
	.loc 1 272 5
	movq	-184(%rbp), %rax	# file, tmp101
	movq	%rax, %rdi	# tmp101,
	call	fclose@PLT	#
.L78:
# src/deep.c:273: }
	.loc 1 273 1
	movq	-8(%rbp), %rax	# D.5543, tmp103
	xorq	%fs:40, %rax	# MEM[(<address-space-1> long unsigned int *)40B], tmp103
	je	.L81	#,
	call	__stack_chk_fail@PLT	#
.L81:
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE18:
	.size	save_model, .-save_model
	.globl	load_model_from_file
	.type	load_model_from_file, @function
load_model_from_file:
.LFB19:
	.loc 1 275 63
	.cfi_startproc
	endbr64	
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$32, %rsp	#,
	movq	%rdi, -24(%rbp)	# model, model
	movq	%rsi, -32(%rbp)	# filename, filename
# src/deep.c:276:     FILE *file = fopen(filename, "rb");
	.loc 1 276 18
	movq	-32(%rbp), %rax	# filename, tmp85
	leaq	.LC4(%rip), %rsi	#,
	movq	%rax, %rdi	# tmp85,
	call	fopen@PLT	#
	movq	%rax, -8(%rbp)	# tmp86, file
# src/deep.c:277:     if (file == NULL) {
	.loc 1 277 8
	cmpq	$0, -8(%rbp)	#, file
	jne	.L83	#,
# src/deep.c:278:         printf("Error opening file %s", filename);
	.loc 1 278 9
	movq	-32(%rbp), %rax	# filename, tmp87
	movq	%rax, %rsi	# tmp87,
	leaq	.LC10(%rip), %rdi	#,
	movl	$0, %eax	#,
	call	printf@PLT	#
# src/deep.c:279:         return;
	.loc 1 279 9
	jmp	.L82	#
.L83:
# src/deep.c:282:     fread(model->layers[0], sizeof(float), model->size_parameters, file);
	.loc 1 282 5
	movq	-24(%rbp), %rax	# model, tmp88
	movq	16(%rax), %rdx	# model_9(D)->size_parameters, _1
# src/deep.c:282:     fread(model->layers[0], sizeof(float), model->size_parameters, file);
	.loc 1 282 16
	movq	-24(%rbp), %rax	# model, tmp89
	movq	(%rax), %rax	# model_9(D)->layers, _2
# src/deep.c:282:     fread(model->layers[0], sizeof(float), model->size_parameters, file);
	.loc 1 282 5
	movq	(%rax), %rax	# *_2, _3
	movq	-8(%rbp), %rcx	# file, tmp90
	movl	$4, %esi	#,
	movq	%rax, %rdi	# _3,
	call	fread@PLT	#
# src/deep.c:283:     fclose(file);
	.loc 1 283 5
	movq	-8(%rbp), %rax	# file, tmp91
	movq	%rax, %rdi	# tmp91,
	call	fclose@PLT	#
.L82:
# src/deep.c:284: }
	.loc 1 284 1
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE19:
	.size	load_model_from_file, .-load_model_from_file
	.section	.rodata
.LC11:
	.string	"Error opening directory %s"
.LC12:
	.string	"%s/%s"
	.align 8
.LC13:
	.string	"\nNo model files found in directory %s\n\n"
.LC14:
	.string	"\nLoading model from file %s\n\n"
	.text
	.globl	load_model
	.type	load_model, @function
load_model:
.LFB20:
	.loc 1 286 51
	.cfi_startproc
	endbr64	
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$752, %rsp	#,
	movq	%rdi, -744(%rbp)	# model, model
	movq	%rsi, -752(%rbp)	# dirname, dirname
# src/deep.c:286: int load_model(Model * model, const char *dirname){
	.loc 1 286 51
	movq	%fs:40, %rax	# MEM[(<address-space-1> long unsigned int *)40B], tmp110
	movq	%rax, -8(%rbp)	# tmp110, D.5549
	xorl	%eax, %eax	# tmp110
# src/deep.c:291:     time(&now);
	.loc 1 291 5
	leaq	-728(%rbp), %rax	#, tmp88
	movq	%rax, %rdi	# tmp88,
	call	time@PLT	#
# src/deep.c:292:     time_t latest_timestamp = 0;
	.loc 1 292 12
	movq	$0, -720(%rbp)	#, latest_timestamp
# src/deep.c:297:     dir = opendir(dirname);
	.loc 1 297 11
	movq	-752(%rbp), %rax	# dirname, tmp89
	movq	%rax, %rdi	# tmp89,
	call	opendir@PLT	#
	movq	%rax, -712(%rbp)	# tmp90, dir
# src/deep.c:298:     if (dir == NULL) {
	.loc 1 298 8
	cmpq	$0, -712(%rbp)	#, dir
	jne	.L88	#,
# src/deep.c:299:         printf("Error opening directory %s", dirname);
	.loc 1 299 9
	movq	-752(%rbp), %rax	# dirname, tmp91
	movq	%rax, %rsi	# tmp91,
	leaq	.LC11(%rip), %rdi	#,
	movl	$0, %eax	#,
	call	printf@PLT	#
# src/deep.c:300:         return 0;
	.loc 1 300 16
	movl	$0, %eax	#, _6
	jmp	.L91	#
.L89:
# src/deep.c:305:         snprintf(full_filename, sizeof(full_filename), "%s/%s", dirname, entry->d_name);
	.loc 1 305 79
	movq	-704(%rbp), %rax	# entry, tmp92
	leaq	19(%rax), %rcx	#, _1
# src/deep.c:305:         snprintf(full_filename, sizeof(full_filename), "%s/%s", dirname, entry->d_name);
	.loc 1 305 9
	movq	-752(%rbp), %rdx	# dirname, tmp93
	leaq	-544(%rbp), %rax	#, tmp94
	movq	%rcx, %r8	# _1,
	movq	%rdx, %rcx	# tmp93,
	leaq	.LC12(%rip), %rdx	#,
	movl	$260, %esi	#,
	movq	%rax, %rdi	# tmp94,
	movl	$0, %eax	#,
	call	snprintf@PLT	#
# src/deep.c:306:         if (stat(full_filename, &file_info) == 0 && S_ISREG(file_info.st_mode)) {
	.loc 1 306 13
	leaq	-688(%rbp), %rdx	#, tmp95
	leaq	-544(%rbp), %rax	#, tmp96
	movq	%rdx, %rsi	# tmp95,
	movq	%rax, %rdi	# tmp96,
	call	stat@PLT	#
# src/deep.c:306:         if (stat(full_filename, &file_info) == 0 && S_ISREG(file_info.st_mode)) {
	.loc 1 306 12
	testl	%eax, %eax	# _2
	jne	.L88	#,
# src/deep.c:306:         if (stat(full_filename, &file_info) == 0 && S_ISREG(file_info.st_mode)) {
	.loc 1 306 53 discriminator 1
	movl	-664(%rbp), %eax	# file_info.st_mode, _3
	andl	$61440, %eax	#, _4
# src/deep.c:306:         if (stat(full_filename, &file_info) == 0 && S_ISREG(file_info.st_mode)) {
	.loc 1 306 50 discriminator 1
	cmpl	$32768, %eax	#, _4
	jne	.L88	#,
.LBB32:
# src/deep.c:307:             time_t file_timestamp = file_info.st_mtime; // Use the st_mtime field from stat() to get the last modification time
	.loc 1 307 20
	movq	-600(%rbp), %rax	# file_info.st_mtim.tv_sec, tmp97
	movq	%rax, -696(%rbp)	# tmp97, file_timestamp
# src/deep.c:309:             if (file_timestamp > latest_timestamp) {
	.loc 1 309 16
	movq	-696(%rbp), %rax	# file_timestamp, tmp98
	cmpq	-720(%rbp), %rax	# latest_timestamp, tmp98
	jle	.L88	#,
# src/deep.c:310:                 latest_timestamp = file_timestamp;
	.loc 1 310 34
	movq	-696(%rbp), %rax	# file_timestamp, tmp99
	movq	%rax, -720(%rbp)	# tmp99, latest_timestamp
# src/deep.c:311:                 strcpy(latest_fullname, full_filename);
	.loc 1 311 17
	leaq	-544(%rbp), %rdx	#, tmp100
	leaq	-272(%rbp), %rax	#, tmp101
	movq	%rdx, %rsi	# tmp100,
	movq	%rax, %rdi	# tmp101,
	call	strcpy@PLT	#
.L88:
.LBE32:
# src/deep.c:304:     while ((entry = readdir(dir)) != NULL) {
	.loc 1 304 21
	movq	-712(%rbp), %rax	# dir, tmp102
	movq	%rax, %rdi	# tmp102,
	call	readdir@PLT	#
	movq	%rax, -704(%rbp)	# tmp103, entry
# src/deep.c:304:     while ((entry = readdir(dir)) != NULL) {
	.loc 1 304 11
	cmpq	$0, -704(%rbp)	#, entry
	jne	.L89	#,
# src/deep.c:316:     closedir(dir);
	.loc 1 316 5
	movq	-712(%rbp), %rax	# dir, tmp104
	movq	%rax, %rdi	# tmp104,
	call	closedir@PLT	#
# src/deep.c:317:     if (latest_timestamp == 0) {
	.loc 1 317 8
	cmpq	$0, -720(%rbp)	#, latest_timestamp
	jne	.L90	#,
# src/deep.c:318:         printf("\nNo model files found in directory %s\n\n", dirname);
	.loc 1 318 9
	movq	-752(%rbp), %rax	# dirname, tmp105
	movq	%rax, %rsi	# tmp105,
	leaq	.LC13(%rip), %rdi	#,
	movl	$0, %eax	#,
	call	printf@PLT	#
# src/deep.c:319:         return 0;
	.loc 1 319 16
	movl	$0, %eax	#, _6
	jmp	.L91	#
.L90:
# src/deep.c:322:         printf("\nLoading model from file %s\n\n", latest_fullname);
	.loc 1 322 9
	leaq	-272(%rbp), %rax	#, tmp106
	movq	%rax, %rsi	# tmp106,
	leaq	.LC14(%rip), %rdi	#,
	movl	$0, %eax	#,
	call	printf@PLT	#
# src/deep.c:323:         load_model_from_file(model, latest_fullname); // Load model parameters from the file
	.loc 1 323 9
	leaq	-272(%rbp), %rdx	#, tmp107
	movq	-744(%rbp), %rax	# model, tmp108
	movq	%rdx, %rsi	# tmp107,
	movq	%rax, %rdi	# tmp108,
	call	load_model_from_file	#
# src/deep.c:324:         return 1;
	.loc 1 324 16
	movl	$1, %eax	#, _6
.L91:
# src/deep.c:327: }
	.loc 1 327 1 discriminator 1
	movq	-8(%rbp), %rcx	# D.5549, tmp111
	xorq	%fs:40, %rcx	# MEM[(<address-space-1> long unsigned int *)40B], tmp111
	je	.L92	#,
# src/deep.c:327: }
	.loc 1 327 1 is_stmt 0
	call	__stack_chk_fail@PLT	#
.L92:
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE20:
	.size	load_model, .-load_model
	.globl	generate_normal_random_number
	.type	generate_normal_random_number, @function
generate_normal_random_number:
.LFB21:
	.loc 1 332 1 is_stmt 1
	.cfi_startproc
	endbr64	
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$32, %rsp	#,
# src/deep.c:334:     float u1 = ((float)rand() / RAND_MAX);
	.loc 1 334 24
	call	rand@PLT	#
# src/deep.c:334:     float u1 = ((float)rand() / RAND_MAX);
	.loc 1 334 17
	cvtsi2ssl	%eax, %xmm0	# _1, _2
# src/deep.c:334:     float u1 = ((float)rand() / RAND_MAX);
	.loc 1 334 11
	movss	.LC15(%rip), %xmm1	#, tmp97
	divss	%xmm1, %xmm0	# tmp97, tmp96
	movss	%xmm0, -8(%rbp)	# tmp96, u1
# src/deep.c:335:     float u2 = ((float)rand() / RAND_MAX);
	.loc 1 335 24
	call	rand@PLT	#
# src/deep.c:335:     float u2 = ((float)rand() / RAND_MAX);
	.loc 1 335 17
	cvtsi2ssl	%eax, %xmm0	# _3, _4
# src/deep.c:335:     float u2 = ((float)rand() / RAND_MAX);
	.loc 1 335 11
	movss	.LC15(%rip), %xmm1	#, tmp99
	divss	%xmm1, %xmm0	# tmp99, tmp98
	movss	%xmm0, -4(%rbp)	# tmp98, u2
# src/deep.c:338:     return sqrt(-2.0 * log(u1)) * cos(2.0 * M_PI * u2);
	.loc 1 338 24
	cvtss2sd	-8(%rbp), %xmm0	# u1, _5
	call	log@PLT	#
# src/deep.c:338:     return sqrt(-2.0 * log(u1)) * cos(2.0 * M_PI * u2);
	.loc 1 338 12
	movsd	.LC16(%rip), %xmm1	#, tmp100
	mulsd	%xmm1, %xmm0	# tmp100, _7
	call	sqrt@PLT	#
	movsd	%xmm0, -24(%rbp)	#, %sfp
# src/deep.c:338:     return sqrt(-2.0 * log(u1)) * cos(2.0 * M_PI * u2);
	.loc 1 338 35
	cvtss2sd	-4(%rbp), %xmm1	# u2, _9
	movsd	.LC17(%rip), %xmm0	#, tmp101
	mulsd	%xmm1, %xmm0	# _9, _10
	call	cos@PLT	#
# src/deep.c:338:     return sqrt(-2.0 * log(u1)) * cos(2.0 * M_PI * u2);
	.loc 1 338 33
	mulsd	-24(%rbp), %xmm0	# %sfp, _12
	cvtsd2ss	%xmm0, %xmm0	# _12, _20
# src/deep.c:339: }
	.loc 1 339 1
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE21:
	.size	generate_normal_random_number, .-generate_normal_random_number
	.globl	generate_xavier_number
	.type	generate_xavier_number, @function
generate_xavier_number:
.LFB22:
	.loc 1 343 1
	.cfi_startproc
	endbr64	
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$32, %rsp	#,
	movq	%rdi, -24(%rbp)	# inputs, inputs
	movq	%rsi, -32(%rbp)	# outputs, outputs
# src/deep.c:344:     float stddev = sqrt(2.0f / (inputs + outputs));
	.loc 1 344 40
	movq	-24(%rbp), %rdx	# inputs, tmp90
	movq	-32(%rbp), %rax	# outputs, tmp91
	addq	%rdx, %rax	# tmp90, _1
# src/deep.c:344:     float stddev = sqrt(2.0f / (inputs + outputs));
	.loc 1 344 30
	testq	%rax, %rax	# _1
	js	.L96	#,
	cvtsi2ssq	%rax, %xmm0	# _1, _2
	jmp	.L97	#
.L96:
	movq	%rax, %rdx	# _1, tmp93
	shrq	%rdx	# tmp93
	andl	$1, %eax	#, tmp94
	orq	%rax, %rdx	# tmp94, tmp93
	cvtsi2ssq	%rdx, %xmm0	# tmp93, tmp92
	addss	%xmm0, %xmm0	# tmp92, _2
.L97:
	movss	.LC18(%rip), %xmm1	#, tmp95
	divss	%xmm0, %xmm1	# _2, tmp95
	movaps	%xmm1, %xmm0	# tmp95, _3
# src/deep.c:344:     float stddev = sqrt(2.0f / (inputs + outputs));
	.loc 1 344 20
	cvtss2sd	%xmm0, %xmm0	# _3, _4
	call	sqrt@PLT	#
# src/deep.c:344:     float stddev = sqrt(2.0f / (inputs + outputs));
	.loc 1 344 11
	cvtsd2ss	%xmm0, %xmm0	# _5, tmp97
	movss	%xmm0, -4(%rbp)	# tmp97, stddev
# src/deep.c:345:     return generate_normal_random_number() * stddev;
	.loc 1 345 12
	movl	$0, %eax	#,
	call	generate_normal_random_number	#
# src/deep.c:345:     return generate_normal_random_number() * stddev;
	.loc 1 345 44
	mulss	-4(%rbp), %xmm0	# stddev, _13
# src/deep.c:346: }
	.loc 1 346 1
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE22:
	.size	generate_xavier_number, .-generate_xavier_number
	.globl	generate_kaiming_number
	.type	generate_kaiming_number, @function
generate_kaiming_number:
.LFB23:
	.loc 1 350 1
	.cfi_startproc
	endbr64	
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$32, %rsp	#,
	movq	%rdi, -24(%rbp)	# inputs, inputs
	movq	%rsi, -32(%rbp)	# outputs, outputs
# src/deep.c:351:     float stddev = sqrt(2.0f / inputs);
	.loc 1 351 30
	movq	-24(%rbp), %rax	# inputs, tmp89
	testq	%rax, %rax	# tmp89
	js	.L100	#,
	cvtsi2ssq	%rax, %xmm0	# tmp89, _1
	jmp	.L101	#
.L100:
	movq	%rax, %rdx	# tmp89, tmp91
	shrq	%rdx	# tmp91
	andl	$1, %eax	#, tmp92
	orq	%rax, %rdx	# tmp92, tmp91
	cvtsi2ssq	%rdx, %xmm0	# tmp91, tmp90
	addss	%xmm0, %xmm0	# tmp90, _1
.L101:
	movss	.LC18(%rip), %xmm1	#, tmp93
	divss	%xmm0, %xmm1	# _1, tmp93
	movaps	%xmm1, %xmm0	# tmp93, _2
# src/deep.c:351:     float stddev = sqrt(2.0f / inputs);
	.loc 1 351 20
	cvtss2sd	%xmm0, %xmm0	# _2, _3
	call	sqrt@PLT	#
# src/deep.c:351:     float stddev = sqrt(2.0f / inputs);
	.loc 1 351 11
	cvtsd2ss	%xmm0, %xmm0	# _4, tmp95
	movss	%xmm0, -4(%rbp)	# tmp95, stddev
# src/deep.c:352:     return generate_normal_random_number() * stddev;
	.loc 1 352 12
	movl	$0, %eax	#,
	call	generate_normal_random_number	#
# src/deep.c:352:     return generate_normal_random_number() * stddev;
	.loc 1 352 44
	mulss	-4(%rbp), %xmm0	# stddev, _11
# src/deep.c:353: }
	.loc 1 353 1
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE23:
	.size	generate_kaiming_number, .-generate_kaiming_number
	.globl	initialize_layer
	.type	initialize_layer, @function
initialize_layer:
.LFB24:
	.loc 1 356 64
	.cfi_startproc
	endbr64	
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	pushq	%rbx	#
	subq	$40, %rsp	#,
	.cfi_offset 3, -24
	movq	%rdi, -40(%rbp)	# layer, layer
	movq	%rsi, -48(%rbp)	# generate_number, generate_number
.LBB33:
# src/deep.c:358:     for (size_t i = 0; i < layer->size_inputs * layer->size_neurons; i++)
	.loc 1 358 17
	movq	$0, -32(%rbp)	#, i
# src/deep.c:358:     for (size_t i = 0; i < layer->size_inputs * layer->size_neurons; i++)
	.loc 1 358 5
	jmp	.L104	#
.L105:
# src/deep.c:359:         layer->weights[i] = generate_number(layer->size_inputs, layer->size_neurons);
	.loc 1 359 29 discriminator 3
	movq	-40(%rbp), %rax	# layer, tmp95
	movq	72(%rax), %rdx	# layer_20(D)->size_neurons, _1
	movq	-40(%rbp), %rax	# layer, tmp96
	movq	64(%rax), %rax	# layer_20(D)->size_inputs, _2
# src/deep.c:359:         layer->weights[i] = generate_number(layer->size_inputs, layer->size_neurons);
	.loc 1 359 14 discriminator 3
	movq	-40(%rbp), %rcx	# layer, tmp97
	movq	(%rcx), %rcx	# layer_20(D)->weights, _3
# src/deep.c:359:         layer->weights[i] = generate_number(layer->size_inputs, layer->size_neurons);
	.loc 1 359 23 discriminator 3
	movq	-32(%rbp), %rsi	# i, tmp98
	salq	$2, %rsi	#, _4
	leaq	(%rcx,%rsi), %rbx	#, _5
# src/deep.c:359:         layer->weights[i] = generate_number(layer->size_inputs, layer->size_neurons);
	.loc 1 359 29 discriminator 3
	movq	-48(%rbp), %rcx	# generate_number, tmp99
	movq	%rdx, %rsi	# _1,
	movq	%rax, %rdi	# _2,
	movl	$0, %eax	#,
	call	*%rcx	# tmp99
.LVL2:
	movd	%xmm0, %eax	#, _6
# src/deep.c:359:         layer->weights[i] = generate_number(layer->size_inputs, layer->size_neurons);
	.loc 1 359 27 discriminator 3
	movl	%eax, (%rbx)	# _6, *_5
# src/deep.c:358:     for (size_t i = 0; i < layer->size_inputs * layer->size_neurons; i++)
	.loc 1 358 71 discriminator 3
	addq	$1, -32(%rbp)	#, i
.L104:
# src/deep.c:358:     for (size_t i = 0; i < layer->size_inputs * layer->size_neurons; i++)
	.loc 1 358 33 discriminator 1
	movq	-40(%rbp), %rax	# layer, tmp100
	movq	64(%rax), %rdx	# layer_20(D)->size_inputs, _7
# src/deep.c:358:     for (size_t i = 0; i < layer->size_inputs * layer->size_neurons; i++)
	.loc 1 358 54 discriminator 1
	movq	-40(%rbp), %rax	# layer, tmp101
	movq	72(%rax), %rax	# layer_20(D)->size_neurons, _8
# src/deep.c:358:     for (size_t i = 0; i < layer->size_inputs * layer->size_neurons; i++)
	.loc 1 358 47 discriminator 1
	imulq	%rdx, %rax	# _7, _9
# src/deep.c:358:     for (size_t i = 0; i < layer->size_inputs * layer->size_neurons; i++)
	.loc 1 358 5 discriminator 1
	cmpq	%rax, -32(%rbp)	# _9, i
	jb	.L105	#,
.LBE33:
.LBB34:
# src/deep.c:361:     for (size_t i = 0; i < layer->size_neurons; i++)
	.loc 1 361 17
	movq	$0, -24(%rbp)	#, i
# src/deep.c:361:     for (size_t i = 0; i < layer->size_neurons; i++)
	.loc 1 361 5
	jmp	.L106	#
.L107:
# src/deep.c:362:         layer->biases[i] = 0.0f;
	.loc 1 362 14 discriminator 3
	movq	-40(%rbp), %rax	# layer, tmp102
	movq	8(%rax), %rax	# layer_20(D)->biases, _10
# src/deep.c:362:         layer->biases[i] = 0.0f;
	.loc 1 362 22 discriminator 3
	movq	-24(%rbp), %rdx	# i, tmp103
	salq	$2, %rdx	#, _11
	addq	%rdx, %rax	# _11, _12
# src/deep.c:362:         layer->biases[i] = 0.0f;
	.loc 1 362 26 discriminator 3
	pxor	%xmm0, %xmm0	# tmp104
	movss	%xmm0, (%rax)	# tmp104, *_12
# src/deep.c:361:     for (size_t i = 0; i < layer->size_neurons; i++)
	.loc 1 361 50 discriminator 3
	addq	$1, -24(%rbp)	#, i
.L106:
# src/deep.c:361:     for (size_t i = 0; i < layer->size_neurons; i++)
	.loc 1 361 33 discriminator 1
	movq	-40(%rbp), %rax	# layer, tmp105
	movq	72(%rax), %rax	# layer_20(D)->size_neurons, _13
# src/deep.c:361:     for (size_t i = 0; i < layer->size_neurons; i++)
	.loc 1 361 5 discriminator 1
	cmpq	%rax, -24(%rbp)	# _13, i
	jb	.L107	#,
.LBE34:
# src/deep.c:363: }
	.loc 1 363 1
	nop	
	nop	
	addq	$40, %rsp	#,
	popq	%rbx	#
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE24:
	.size	initialize_layer, .-initialize_layer
	.globl	kaiming_initialize_layer
	.type	kaiming_initialize_layer, @function
kaiming_initialize_layer:
.LFB25:
	.loc 1 366 1
	.cfi_startproc
	endbr64	
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	pushq	%rbx	#
	subq	$56, %rsp	#,
	.cfi_offset 3, -24
	movq	%rdi, -40(%rbp)	# layer, layer
	movq	%rsi, -48(%rbp)	# inputs, inputs
	movq	%rdx, -56(%rbp)	# outputs, outputs
# src/deep.c:367:     layer->size_inputs = inputs;
	.loc 1 367 24
	movq	-40(%rbp), %rax	# layer, tmp95
	movq	-48(%rbp), %rdx	# inputs, tmp96
	movq	%rdx, 64(%rax)	# tmp96, layer_19(D)->size_inputs
# src/deep.c:368:     layer->size_neurons = outputs;
	.loc 1 368 25
	movq	-40(%rbp), %rax	# layer, tmp97
	movq	-56(%rbp), %rdx	# outputs, tmp98
	movq	%rdx, 72(%rax)	# tmp98, layer_19(D)->size_neurons
# src/deep.c:370:     layer->activation_forward = relu_forward;
	.loc 1 370 31
	movq	-40(%rbp), %rax	# layer, tmp99
	leaq	relu_forward(%rip), %rdx	#, tmp100
	movq	%rdx, 80(%rax)	# tmp100, layer_19(D)->activation_forward
# src/deep.c:371:     layer->activation_backward = relu_backward;
	.loc 1 371 32
	movq	-40(%rbp), %rax	# layer, tmp101
	leaq	relu_backward(%rip), %rdx	#, tmp102
	movq	%rdx, 88(%rax)	# tmp102, layer_19(D)->activation_backward
# src/deep.c:373:     layer->weights = malloc(inputs * outputs * sizeof(float));
	.loc 1 373 36
	movq	-48(%rbp), %rax	# inputs, tmp103
	imulq	-56(%rbp), %rax	# outputs, _1
# src/deep.c:373:     layer->weights = malloc(inputs * outputs * sizeof(float));
	.loc 1 373 22
	salq	$2, %rax	#, _2
	movq	%rax, %rdi	# _2,
	call	malloc@PLT	#
	movq	%rax, %rdx	# tmp104, _3
# src/deep.c:373:     layer->weights = malloc(inputs * outputs * sizeof(float));
	.loc 1 373 20
	movq	-40(%rbp), %rax	# layer, tmp105
	movq	%rdx, (%rax)	# _3, layer_19(D)->weights
# src/deep.c:374:     layer->biases = malloc(outputs * sizeof(float));
	.loc 1 374 21
	movq	-56(%rbp), %rax	# outputs, tmp106
	salq	$2, %rax	#, _4
	movq	%rax, %rdi	# _4,
	call	malloc@PLT	#
	movq	%rax, %rdx	# tmp107, _5
# src/deep.c:374:     layer->biases = malloc(outputs * sizeof(float));
	.loc 1 374 19
	movq	-40(%rbp), %rax	# layer, tmp108
	movq	%rdx, 8(%rax)	# _5, layer_19(D)->biases
.LBB35:
# src/deep.c:376:     for (size_t i = 0; i < inputs * outputs; i++)
	.loc 1 376 17
	movq	$0, -32(%rbp)	#, i
# src/deep.c:376:     for (size_t i = 0; i < inputs * outputs; i++)
	.loc 1 376 5
	jmp	.L109	#
.L110:
# src/deep.c:377:         layer->weights[i] = generate_xavier_number(inputs, outputs);
	.loc 1 377 14 discriminator 3
	movq	-40(%rbp), %rax	# layer, tmp109
	movq	(%rax), %rax	# layer_19(D)->weights, _6
# src/deep.c:377:         layer->weights[i] = generate_xavier_number(inputs, outputs);
	.loc 1 377 23 discriminator 3
	movq	-32(%rbp), %rdx	# i, tmp110
	salq	$2, %rdx	#, _7
	leaq	(%rax,%rdx), %rbx	#, _8
# src/deep.c:377:         layer->weights[i] = generate_xavier_number(inputs, outputs);
	.loc 1 377 29 discriminator 3
	movq	-56(%rbp), %rdx	# outputs, tmp111
	movq	-48(%rbp), %rax	# inputs, tmp112
	movq	%rdx, %rsi	# tmp111,
	movq	%rax, %rdi	# tmp112,
	call	generate_xavier_number	#
	movd	%xmm0, %eax	#, _9
# src/deep.c:377:         layer->weights[i] = generate_xavier_number(inputs, outputs);
	.loc 1 377 27 discriminator 3
	movl	%eax, (%rbx)	# _9, *_8
# src/deep.c:376:     for (size_t i = 0; i < inputs * outputs; i++)
	.loc 1 376 47 discriminator 3
	addq	$1, -32(%rbp)	#, i
.L109:
# src/deep.c:376:     for (size_t i = 0; i < inputs * outputs; i++)
	.loc 1 376 35 discriminator 1
	movq	-48(%rbp), %rax	# inputs, tmp113
	imulq	-56(%rbp), %rax	# outputs, _10
# src/deep.c:376:     for (size_t i = 0; i < inputs * outputs; i++)
	.loc 1 376 5 discriminator 1
	cmpq	%rax, -32(%rbp)	# _10, i
	jb	.L110	#,
.LBE35:
.LBB36:
# src/deep.c:379:     for (size_t i = 0; i < outputs; i++)
	.loc 1 379 17
	movq	$0, -24(%rbp)	#, i
# src/deep.c:379:     for (size_t i = 0; i < outputs; i++)
	.loc 1 379 5
	jmp	.L111	#
.L112:
# src/deep.c:380:         layer->biases[i] = 0.0f;
	.loc 1 380 14 discriminator 3
	movq	-40(%rbp), %rax	# layer, tmp114
	movq	8(%rax), %rax	# layer_19(D)->biases, _11
# src/deep.c:380:         layer->biases[i] = 0.0f;
	.loc 1 380 22 discriminator 3
	movq	-24(%rbp), %rdx	# i, tmp115
	salq	$2, %rdx	#, _12
	addq	%rdx, %rax	# _12, _13
# src/deep.c:380:         layer->biases[i] = 0.0f;
	.loc 1 380 26 discriminator 3
	pxor	%xmm0, %xmm0	# tmp116
	movss	%xmm0, (%rax)	# tmp116, *_13
# src/deep.c:379:     for (size_t i = 0; i < outputs; i++)
	.loc 1 379 38 discriminator 3
	addq	$1, -24(%rbp)	#, i
.L111:
# src/deep.c:379:     for (size_t i = 0; i < outputs; i++)
	.loc 1 379 5 discriminator 1
	movq	-24(%rbp), %rax	# i, tmp117
	cmpq	-56(%rbp), %rax	# outputs, tmp117
	jb	.L112	#,
.LBE36:
# src/deep.c:381: }
	.loc 1 381 1
	nop	
	nop	
	addq	$56, %rsp	#,
	popq	%rbx	#
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE25:
	.size	kaiming_initialize_layer, .-kaiming_initialize_layer
	.globl	xavier_initialize_layer
	.type	xavier_initialize_layer, @function
xavier_initialize_layer:
.LFB26:
	.loc 1 384 1
	.cfi_startproc
	endbr64	
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	pushq	%rbx	#
	subq	$56, %rsp	#,
	.cfi_offset 3, -24
	movq	%rdi, -40(%rbp)	# layer, layer
	movq	%rsi, -48(%rbp)	# inputs, inputs
	movq	%rdx, -56(%rbp)	# outputs, outputs
# src/deep.c:385:     layer->size_inputs = inputs;
	.loc 1 385 24
	movq	-40(%rbp), %rax	# layer, tmp95
	movq	-48(%rbp), %rdx	# inputs, tmp96
	movq	%rdx, 64(%rax)	# tmp96, layer_19(D)->size_inputs
# src/deep.c:386:     layer->size_neurons = outputs;
	.loc 1 386 25
	movq	-40(%rbp), %rax	# layer, tmp97
	movq	-56(%rbp), %rdx	# outputs, tmp98
	movq	%rdx, 72(%rax)	# tmp98, layer_19(D)->size_neurons
# src/deep.c:388:     layer->activation_forward = softmax_forward;
	.loc 1 388 31
	movq	-40(%rbp), %rax	# layer, tmp99
	leaq	softmax_forward(%rip), %rdx	#, tmp100
	movq	%rdx, 80(%rax)	# tmp100, layer_19(D)->activation_forward
# src/deep.c:389:     layer->activation_backward = loss_softmax_backward;
	.loc 1 389 32
	movq	-40(%rbp), %rax	# layer, tmp101
	leaq	loss_softmax_backward(%rip), %rdx	#, tmp102
	movq	%rdx, 88(%rax)	# tmp102, layer_19(D)->activation_backward
# src/deep.c:391:     layer->weights = malloc(inputs * outputs * sizeof(float));
	.loc 1 391 36
	movq	-48(%rbp), %rax	# inputs, tmp103
	imulq	-56(%rbp), %rax	# outputs, _1
# src/deep.c:391:     layer->weights = malloc(inputs * outputs * sizeof(float));
	.loc 1 391 22
	salq	$2, %rax	#, _2
	movq	%rax, %rdi	# _2,
	call	malloc@PLT	#
	movq	%rax, %rdx	# tmp104, _3
# src/deep.c:391:     layer->weights = malloc(inputs * outputs * sizeof(float));
	.loc 1 391 20
	movq	-40(%rbp), %rax	# layer, tmp105
	movq	%rdx, (%rax)	# _3, layer_19(D)->weights
# src/deep.c:392:     layer->biases = malloc(outputs * sizeof(float));
	.loc 1 392 21
	movq	-56(%rbp), %rax	# outputs, tmp106
	salq	$2, %rax	#, _4
	movq	%rax, %rdi	# _4,
	call	malloc@PLT	#
	movq	%rax, %rdx	# tmp107, _5
# src/deep.c:392:     layer->biases = malloc(outputs * sizeof(float));
	.loc 1 392 19
	movq	-40(%rbp), %rax	# layer, tmp108
	movq	%rdx, 8(%rax)	# _5, layer_19(D)->biases
.LBB37:
# src/deep.c:394:     for (size_t i = 0; i < inputs * outputs; i++)
	.loc 1 394 17
	movq	$0, -32(%rbp)	#, i
# src/deep.c:394:     for (size_t i = 0; i < inputs * outputs; i++)
	.loc 1 394 5
	jmp	.L114	#
.L115:
# src/deep.c:395:         layer->weights[i] = generate_xavier_number(inputs, outputs);
	.loc 1 395 14 discriminator 3
	movq	-40(%rbp), %rax	# layer, tmp109
	movq	(%rax), %rax	# layer_19(D)->weights, _6
# src/deep.c:395:         layer->weights[i] = generate_xavier_number(inputs, outputs);
	.loc 1 395 23 discriminator 3
	movq	-32(%rbp), %rdx	# i, tmp110
	salq	$2, %rdx	#, _7
	leaq	(%rax,%rdx), %rbx	#, _8
# src/deep.c:395:         layer->weights[i] = generate_xavier_number(inputs, outputs);
	.loc 1 395 29 discriminator 3
	movq	-56(%rbp), %rdx	# outputs, tmp111
	movq	-48(%rbp), %rax	# inputs, tmp112
	movq	%rdx, %rsi	# tmp111,
	movq	%rax, %rdi	# tmp112,
	call	generate_xavier_number	#
	movd	%xmm0, %eax	#, _9
# src/deep.c:395:         layer->weights[i] = generate_xavier_number(inputs, outputs);
	.loc 1 395 27 discriminator 3
	movl	%eax, (%rbx)	# _9, *_8
# src/deep.c:394:     for (size_t i = 0; i < inputs * outputs; i++)
	.loc 1 394 47 discriminator 3
	addq	$1, -32(%rbp)	#, i
.L114:
# src/deep.c:394:     for (size_t i = 0; i < inputs * outputs; i++)
	.loc 1 394 35 discriminator 1
	movq	-48(%rbp), %rax	# inputs, tmp113
	imulq	-56(%rbp), %rax	# outputs, _10
# src/deep.c:394:     for (size_t i = 0; i < inputs * outputs; i++)
	.loc 1 394 5 discriminator 1
	cmpq	%rax, -32(%rbp)	# _10, i
	jb	.L115	#,
.LBE37:
.LBB38:
# src/deep.c:397:     for (size_t i = 0; i < outputs; i++)
	.loc 1 397 17
	movq	$0, -24(%rbp)	#, i
# src/deep.c:397:     for (size_t i = 0; i < outputs; i++)
	.loc 1 397 5
	jmp	.L116	#
.L117:
# src/deep.c:398:         layer->biases[i] = 0.0f;
	.loc 1 398 14 discriminator 3
	movq	-40(%rbp), %rax	# layer, tmp114
	movq	8(%rax), %rax	# layer_19(D)->biases, _11
# src/deep.c:398:         layer->biases[i] = 0.0f;
	.loc 1 398 22 discriminator 3
	movq	-24(%rbp), %rdx	# i, tmp115
	salq	$2, %rdx	#, _12
	addq	%rdx, %rax	# _12, _13
# src/deep.c:398:         layer->biases[i] = 0.0f;
	.loc 1 398 26 discriminator 3
	pxor	%xmm0, %xmm0	# tmp116
	movss	%xmm0, (%rax)	# tmp116, *_13
# src/deep.c:397:     for (size_t i = 0; i < outputs; i++)
	.loc 1 397 38 discriminator 3
	addq	$1, -24(%rbp)	#, i
.L116:
# src/deep.c:397:     for (size_t i = 0; i < outputs; i++)
	.loc 1 397 5 discriminator 1
	movq	-24(%rbp), %rax	# i, tmp117
	cmpq	-56(%rbp), %rax	# outputs, tmp117
	jb	.L117	#,
.LBE38:
# src/deep.c:399: }
	.loc 1 399 1
	nop	
	nop	
	addq	$56, %rsp	#,
	popq	%rbx	#
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE26:
	.size	xavier_initialize_layer, .-xavier_initialize_layer
	.globl	add_layer
	.type	add_layer, @function
add_layer:
.LFB27:
	.loc 1 406 1
	.cfi_startproc
	endbr64	
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$64, %rsp	#,
	movq	%rdi, -24(%rbp)	# model, model
	movq	%rsi, -32(%rbp)	# size_inputs, size_inputs
	movq	%rdx, -40(%rbp)	# size_neurons, size_neurons
	movq	%rcx, -48(%rbp)	# activation_forward, activation_forward
	movq	%r8, -56(%rbp)	# activation_backward, activation_backward
	movq	%r9, -64(%rbp)	# generate_number, generate_number
# src/deep.c:407:     Layer *layer = calloc(1, sizeof(Layer));
	.loc 1 407 20
	movl	$104, %esi	#,
	movl	$1, %edi	#,
	call	calloc@PLT	#
	movq	%rax, -8(%rbp)	# tmp97, layer
# src/deep.c:408:     layer->size_inputs = size_inputs;
	.loc 1 408 24
	movq	-8(%rbp), %rax	# layer, tmp98
	movq	-32(%rbp), %rdx	# size_inputs, tmp99
	movq	%rdx, 64(%rax)	# tmp99, layer_18->size_inputs
# src/deep.c:409:     layer->size_neurons = size_neurons;
	.loc 1 409 25
	movq	-8(%rbp), %rax	# layer, tmp100
	movq	-40(%rbp), %rdx	# size_neurons, tmp101
	movq	%rdx, 72(%rax)	# tmp101, layer_18->size_neurons
# src/deep.c:410:     layer->activation_forward = activation_forward;
	.loc 1 410 31
	movq	-8(%rbp), %rax	# layer, tmp102
	movq	-48(%rbp), %rdx	# activation_forward, tmp103
	movq	%rdx, 80(%rax)	# tmp103, layer_18->activation_forward
# src/deep.c:411:     layer->activation_backward = activation_backward;
	.loc 1 411 32
	movq	-8(%rbp), %rax	# layer, tmp104
	movq	-56(%rbp), %rdx	# activation_backward, tmp105
	movq	%rdx, 88(%rax)	# tmp105, layer_18->activation_backward
# src/deep.c:412:     layer->generate_number = generate_number;
	.loc 1 412 28
	movq	-8(%rbp), %rax	# layer, tmp106
	movq	-64(%rbp), %rdx	# generate_number, tmp107
	movq	%rdx, 96(%rax)	# tmp107, layer_18->generate_number
# src/deep.c:414:     model->layers = realloc(model->layers, (model->size_layers + 1) * sizeof(Layer *));
	.loc 1 414 50
	movq	-24(%rbp), %rax	# model, tmp108
	movq	8(%rax), %rax	# model_29(D)->size_layers, _1
# src/deep.c:414:     model->layers = realloc(model->layers, (model->size_layers + 1) * sizeof(Layer *));
	.loc 1 414 64
	addq	$1, %rax	#, _2
# src/deep.c:414:     model->layers = realloc(model->layers, (model->size_layers + 1) * sizeof(Layer *));
	.loc 1 414 21
	leaq	0(,%rax,8), %rdx	#, _3
# src/deep.c:414:     model->layers = realloc(model->layers, (model->size_layers + 1) * sizeof(Layer *));
	.loc 1 414 34
	movq	-24(%rbp), %rax	# model, tmp109
	movq	(%rax), %rax	# model_29(D)->layers, _4
# src/deep.c:414:     model->layers = realloc(model->layers, (model->size_layers + 1) * sizeof(Layer *));
	.loc 1 414 21
	movq	%rdx, %rsi	# _3,
	movq	%rax, %rdi	# _4,
	call	realloc@PLT	#
# src/deep.c:414:     model->layers = realloc(model->layers, (model->size_layers + 1) * sizeof(Layer *));
	.loc 1 414 19
	movq	-24(%rbp), %rdx	# model, tmp110
	movq	%rax, (%rdx)	# _5, model_29(D)->layers
# src/deep.c:415:     model->layers[model->size_layers] = layer;
	.loc 1 415 10
	movq	-24(%rbp), %rax	# model, tmp111
	movq	(%rax), %rdx	# model_29(D)->layers, _6
# src/deep.c:415:     model->layers[model->size_layers] = layer;
	.loc 1 415 24
	movq	-24(%rbp), %rax	# model, tmp112
	movq	8(%rax), %rax	# model_29(D)->size_layers, _7
# src/deep.c:415:     model->layers[model->size_layers] = layer;
	.loc 1 415 18
	salq	$3, %rax	#, _8
	addq	%rax, %rdx	# _8, _9
# src/deep.c:415:     model->layers[model->size_layers] = layer;
	.loc 1 415 39
	movq	-8(%rbp), %rax	# layer, tmp113
	movq	%rax, (%rdx)	# tmp113, *_9
# src/deep.c:416:     model->size_layers++;
	.loc 1 416 10
	movq	-24(%rbp), %rax	# model, tmp114
	movq	8(%rax), %rax	# model_29(D)->size_layers, _10
# src/deep.c:416:     model->size_layers++;
	.loc 1 416 23
	leaq	1(%rax), %rdx	#, _11
	movq	-24(%rbp), %rax	# model, tmp115
	movq	%rdx, 8(%rax)	# _11, model_29(D)->size_layers
# src/deep.c:417:     model->size_parameters += size_inputs * size_neurons + size_neurons;
	.loc 1 417 28
	movq	-24(%rbp), %rax	# model, tmp116
	movq	16(%rax), %rdx	# model_29(D)->size_parameters, _12
# src/deep.c:417:     model->size_parameters += size_inputs * size_neurons + size_neurons;
	.loc 1 417 58
	movq	-32(%rbp), %rax	# size_inputs, tmp117
	addq	$1, %rax	#, _13
	imulq	-40(%rbp), %rax	# size_neurons, _14
# src/deep.c:417:     model->size_parameters += size_inputs * size_neurons + size_neurons;
	.loc 1 417 28
	addq	%rax, %rdx	# _14, _15
	movq	-24(%rbp), %rax	# model, tmp118
	movq	%rdx, 16(%rax)	# _15, model_29(D)->size_parameters
# src/deep.c:418: }
	.loc 1 418 1
	nop	
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE27:
	.size	add_layer, .-add_layer
	.globl	allocate_parameters_memory
	.type	allocate_parameters_memory, @function
allocate_parameters_memory:
.LFB28:
	.loc 1 422 1
	.cfi_startproc
	endbr64	
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$48, %rsp	#,
	movq	%rdi, -40(%rbp)	# model, model
# src/deep.c:423:     float *parameters = calloc(model->size_parameters, sizeof(float));
	.loc 1 423 25
	movq	-40(%rbp), %rax	# model, tmp95
	movq	16(%rax), %rax	# model_18(D)->size_parameters, _1
	movl	$4, %esi	#,
	movq	%rax, %rdi	# _1,
	call	calloc@PLT	#
	movq	%rax, -16(%rbp)	# tmp96, parameters
# src/deep.c:424:     size_t offset = 0;
	.loc 1 424 12
	movq	$0, -32(%rbp)	#, offset
.LBB39:
# src/deep.c:425:     for (size_t i = 0; i < model->size_layers; i++) {
	.loc 1 425 17
	movq	$0, -24(%rbp)	#, i
# src/deep.c:425:     for (size_t i = 0; i < model->size_layers; i++) {
	.loc 1 425 5
	jmp	.L120	#
.L121:
.LBB40:
# src/deep.c:426:         Layer *layer = model->layers[i];
	.loc 1 426 29 discriminator 3
	movq	-40(%rbp), %rax	# model, tmp97
	movq	(%rax), %rax	# model_18(D)->layers, _2
# src/deep.c:426:         Layer *layer = model->layers[i];
	.loc 1 426 37 discriminator 3
	movq	-24(%rbp), %rdx	# i, tmp98
	salq	$3, %rdx	#, _3
	addq	%rdx, %rax	# _3, _4
# src/deep.c:426:         Layer *layer = model->layers[i];
	.loc 1 426 16 discriminator 3
	movq	(%rax), %rax	# *_4, tmp99
	movq	%rax, -8(%rbp)	# tmp99, layer
# src/deep.c:427:         layer->weights = parameters + offset;
	.loc 1 427 37 discriminator 3
	movq	-32(%rbp), %rax	# offset, tmp100
	leaq	0(,%rax,4), %rdx	#, _5
	movq	-16(%rbp), %rax	# parameters, tmp101
	addq	%rax, %rdx	# tmp101, _6
# src/deep.c:427:         layer->weights = parameters + offset;
	.loc 1 427 24 discriminator 3
	movq	-8(%rbp), %rax	# layer, tmp102
	movq	%rdx, (%rax)	# _6, layer_23->weights
# src/deep.c:428:         offset += layer->size_inputs * layer->size_neurons;
	.loc 1 428 24 discriminator 3
	movq	-8(%rbp), %rax	# layer, tmp103
	movq	64(%rax), %rdx	# layer_23->size_inputs, _7
# src/deep.c:428:         offset += layer->size_inputs * layer->size_neurons;
	.loc 1 428 45 discriminator 3
	movq	-8(%rbp), %rax	# layer, tmp104
	movq	72(%rax), %rax	# layer_23->size_neurons, _8
# src/deep.c:428:         offset += layer->size_inputs * layer->size_neurons;
	.loc 1 428 38 discriminator 3
	imulq	%rdx, %rax	# _7, _9
# src/deep.c:428:         offset += layer->size_inputs * layer->size_neurons;
	.loc 1 428 16 discriminator 3
	addq	%rax, -32(%rbp)	# _9, offset
# src/deep.c:429:         layer->biases = parameters + offset;
	.loc 1 429 36 discriminator 3
	movq	-32(%rbp), %rax	# offset, tmp105
	leaq	0(,%rax,4), %rdx	#, _10
	movq	-16(%rbp), %rax	# parameters, tmp106
	addq	%rax, %rdx	# tmp106, _11
# src/deep.c:429:         layer->biases = parameters + offset;
	.loc 1 429 23 discriminator 3
	movq	-8(%rbp), %rax	# layer, tmp107
	movq	%rdx, 8(%rax)	# _11, layer_23->biases
# src/deep.c:430:         offset += layer->size_neurons;
	.loc 1 430 24 discriminator 3
	movq	-8(%rbp), %rax	# layer, tmp108
	movq	72(%rax), %rax	# layer_23->size_neurons, _12
# src/deep.c:430:         offset += layer->size_neurons;
	.loc 1 430 16 discriminator 3
	addq	%rax, -32(%rbp)	# _12, offset
.LBE40:
# src/deep.c:425:     for (size_t i = 0; i < model->size_layers; i++) {
	.loc 1 425 49 discriminator 3
	addq	$1, -24(%rbp)	#, i
.L120:
# src/deep.c:425:     for (size_t i = 0; i < model->size_layers; i++) {
	.loc 1 425 33 discriminator 1
	movq	-40(%rbp), %rax	# model, tmp109
	movq	8(%rax), %rax	# model_18(D)->size_layers, _13
# src/deep.c:425:     for (size_t i = 0; i < model->size_layers; i++) {
	.loc 1 425 5 discriminator 1
	cmpq	%rax, -24(%rbp)	# _13, i
	jb	.L121	#,
.LBE39:
# src/deep.c:432: }
	.loc 1 432 1
	nop	
	nop	
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE28:
	.size	allocate_parameters_memory, .-allocate_parameters_memory
	.globl	initialize_model
	.type	initialize_model, @function
initialize_model:
.LFB29:
	.loc 1 435 1
	.cfi_startproc
	endbr64	
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$32, %rsp	#,
	movq	%rdi, -24(%rbp)	# model, model
.LBB41:
# src/deep.c:436:     for (size_t i = 0; i < model->size_layers; i++) {
	.loc 1 436 17
	movq	$0, -16(%rbp)	#, i
# src/deep.c:436:     for (size_t i = 0; i < model->size_layers; i++) {
	.loc 1 436 5
	jmp	.L123	#
.L124:
.LBB42:
# src/deep.c:437:         Layer *layer = model->layers[i];
	.loc 1 437 29 discriminator 3
	movq	-24(%rbp), %rax	# model, tmp87
	movq	(%rax), %rax	# model_10(D)->layers, _1
# src/deep.c:437:         Layer *layer = model->layers[i];
	.loc 1 437 37 discriminator 3
	movq	-16(%rbp), %rdx	# i, tmp88
	salq	$3, %rdx	#, _2
	addq	%rdx, %rax	# _2, _3
# src/deep.c:437:         Layer *layer = model->layers[i];
	.loc 1 437 16 discriminator 3
	movq	(%rax), %rax	# *_3, tmp89
	movq	%rax, -8(%rbp)	# tmp89, layer
# src/deep.c:438:         initialize_layer(layer, layer->generate_number);
	.loc 1 438 9 discriminator 3
	movq	-8(%rbp), %rax	# layer, tmp90
	movq	96(%rax), %rdx	# layer_11->generate_number, _4
	movq	-8(%rbp), %rax	# layer, tmp91
	movq	%rdx, %rsi	# _4,
	movq	%rax, %rdi	# tmp91,
	call	initialize_layer	#
.LBE42:
# src/deep.c:436:     for (size_t i = 0; i < model->size_layers; i++) {
	.loc 1 436 49 discriminator 3
	addq	$1, -16(%rbp)	#, i
.L123:
# src/deep.c:436:     for (size_t i = 0; i < model->size_layers; i++) {
	.loc 1 436 33 discriminator 1
	movq	-24(%rbp), %rax	# model, tmp92
	movq	8(%rax), %rax	# model_10(D)->size_layers, _5
# src/deep.c:436:     for (size_t i = 0; i < model->size_layers; i++) {
	.loc 1 436 5 discriminator 1
	cmpq	%rax, -16(%rbp)	# _5, i
	jb	.L124	#,
.LBE41:
# src/deep.c:440: }
	.loc 1 440 1
	nop	
	nop	
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE29:
	.size	initialize_model, .-initialize_model
	.section	.rodata
.LC19:
	.string	"Weights:"
.LC20:
	.string	"%f "
	.text
	.globl	print_layer_weights
	.type	print_layer_weights, @function
print_layer_weights:
.LFB30:
	.loc 1 444 1
	.cfi_startproc
	endbr64	
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$32, %rsp	#,
	movq	%rdi, -24(%rbp)	# layer, layer
# src/deep.c:445:     printf("Weights:\n");
	.loc 1 445 5
	leaq	.LC19(%rip), %rdi	#,
	call	puts@PLT	#
.LBB43:
# src/deep.c:446:     for (size_t i = 0; i < layer->size_inputs * layer->size_neurons; i++)
	.loc 1 446 17
	movq	$0, -8(%rbp)	#, i
# src/deep.c:446:     for (size_t i = 0; i < layer->size_inputs * layer->size_neurons; i++)
	.loc 1 446 5
	jmp	.L126	#
.L127:
# src/deep.c:447:         printf("%f ", layer->weights[i]);
	.loc 1 447 28 discriminator 3
	movq	-24(%rbp), %rax	# layer, tmp90
	movq	(%rax), %rax	# layer_14(D)->weights, _1
# src/deep.c:447:         printf("%f ", layer->weights[i]);
	.loc 1 447 37 discriminator 3
	movq	-8(%rbp), %rdx	# i, tmp91
	salq	$2, %rdx	#, _2
	addq	%rdx, %rax	# _2, _3
	movss	(%rax), %xmm0	# *_3, _4
# src/deep.c:447:         printf("%f ", layer->weights[i]);
	.loc 1 447 9 discriminator 3
	cvtss2sd	%xmm0, %xmm0	# _4, _5
	leaq	.LC20(%rip), %rdi	#,
	movl	$1, %eax	#,
	call	printf@PLT	#
# src/deep.c:446:     for (size_t i = 0; i < layer->size_inputs * layer->size_neurons; i++)
	.loc 1 446 71 discriminator 3
	addq	$1, -8(%rbp)	#, i
.L126:
# src/deep.c:446:     for (size_t i = 0; i < layer->size_inputs * layer->size_neurons; i++)
	.loc 1 446 33 discriminator 1
	movq	-24(%rbp), %rax	# layer, tmp92
	movq	64(%rax), %rdx	# layer_14(D)->size_inputs, _6
# src/deep.c:446:     for (size_t i = 0; i < layer->size_inputs * layer->size_neurons; i++)
	.loc 1 446 54 discriminator 1
	movq	-24(%rbp), %rax	# layer, tmp93
	movq	72(%rax), %rax	# layer_14(D)->size_neurons, _7
# src/deep.c:446:     for (size_t i = 0; i < layer->size_inputs * layer->size_neurons; i++)
	.loc 1 446 47 discriminator 1
	imulq	%rdx, %rax	# _6, _8
# src/deep.c:446:     for (size_t i = 0; i < layer->size_inputs * layer->size_neurons; i++)
	.loc 1 446 5 discriminator 1
	cmpq	%rax, -8(%rbp)	# _8, i
	jb	.L127	#,
.LBE43:
# src/deep.c:448:     printf("\n");
	.loc 1 448 5
	movl	$10, %edi	#,
	call	putchar@PLT	#
# src/deep.c:449: }
	.loc 1 449 1
	nop	
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE30:
	.size	print_layer_weights, .-print_layer_weights
	.section	.rodata
.LC21:
	.string	"Biases:"
	.text
	.globl	print_layer_biases
	.type	print_layer_biases, @function
print_layer_biases:
.LFB31:
	.loc 1 453 1
	.cfi_startproc
	endbr64	
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$32, %rsp	#,
	movq	%rdi, -24(%rbp)	# layer, layer
# src/deep.c:454:     printf("Biases:\n");
	.loc 1 454 5
	leaq	.LC21(%rip), %rdi	#,
	call	puts@PLT	#
.LBB44:
# src/deep.c:455:     for (size_t i = 0; i < layer->size_neurons; i++)
	.loc 1 455 17
	movq	$0, -8(%rbp)	#, i
# src/deep.c:455:     for (size_t i = 0; i < layer->size_neurons; i++)
	.loc 1 455 5
	jmp	.L129	#
.L130:
# src/deep.c:456:         printf("%f ", layer->biases[i]);
	.loc 1 456 28 discriminator 3
	movq	-24(%rbp), %rax	# layer, tmp88
	movq	8(%rax), %rax	# layer_12(D)->biases, _1
# src/deep.c:456:         printf("%f ", layer->biases[i]);
	.loc 1 456 36 discriminator 3
	movq	-8(%rbp), %rdx	# i, tmp89
	salq	$2, %rdx	#, _2
	addq	%rdx, %rax	# _2, _3
	movss	(%rax), %xmm0	# *_3, _4
# src/deep.c:456:         printf("%f ", layer->biases[i]);
	.loc 1 456 9 discriminator 3
	cvtss2sd	%xmm0, %xmm0	# _4, _5
	leaq	.LC20(%rip), %rdi	#,
	movl	$1, %eax	#,
	call	printf@PLT	#
# src/deep.c:455:     for (size_t i = 0; i < layer->size_neurons; i++)
	.loc 1 455 50 discriminator 3
	addq	$1, -8(%rbp)	#, i
.L129:
# src/deep.c:455:     for (size_t i = 0; i < layer->size_neurons; i++)
	.loc 1 455 33 discriminator 1
	movq	-24(%rbp), %rax	# layer, tmp90
	movq	72(%rax), %rax	# layer_12(D)->size_neurons, _6
# src/deep.c:455:     for (size_t i = 0; i < layer->size_neurons; i++)
	.loc 1 455 5 discriminator 1
	cmpq	%rax, -8(%rbp)	# _6, i
	jb	.L130	#,
.LBE44:
# src/deep.c:457:     printf("\n");
	.loc 1 457 5
	movl	$10, %edi	#,
	call	putchar@PLT	#
# src/deep.c:458: }
	.loc 1 458 1
	nop	
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE31:
	.size	print_layer_biases, .-print_layer_biases
	.section	.rodata
	.align 8
.LC22:
	.string	"Layer: %zu inputs, %zu outputs\n"
.LC23:
	.string	"\nBiases:"
	.text
	.globl	print_layer
	.type	print_layer, @function
print_layer:
.LFB32:
	.loc 1 463 1
	.cfi_startproc
	endbr64	
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$32, %rsp	#,
	movq	%rdi, -24(%rbp)	# layer, layer
# src/deep.c:464:     printf("Layer: %zu inputs, %zu outputs\n", layer->size_inputs, layer->size_neurons);
	.loc 1 464 5
	movq	-24(%rbp), %rax	# layer, tmp98
	movq	72(%rax), %rdx	# layer_22(D)->size_neurons, _1
	movq	-24(%rbp), %rax	# layer, tmp99
	movq	64(%rax), %rax	# layer_22(D)->size_inputs, _2
	movq	%rax, %rsi	# _2,
	leaq	.LC22(%rip), %rdi	#,
	movl	$0, %eax	#,
	call	printf@PLT	#
# src/deep.c:465:     printf("Weights:\n");
	.loc 1 465 5
	leaq	.LC19(%rip), %rdi	#,
	call	puts@PLT	#
.LBB45:
# src/deep.c:466:     for (size_t i = 0; i < layer->size_inputs * layer->size_neurons; i++)
	.loc 1 466 17
	movq	$0, -16(%rbp)	#, i
# src/deep.c:466:     for (size_t i = 0; i < layer->size_inputs * layer->size_neurons; i++)
	.loc 1 466 5
	jmp	.L132	#
.L133:
# src/deep.c:467:         printf("%f ", layer->weights[i]);
	.loc 1 467 28 discriminator 3
	movq	-24(%rbp), %rax	# layer, tmp100
	movq	(%rax), %rax	# layer_22(D)->weights, _3
# src/deep.c:467:         printf("%f ", layer->weights[i]);
	.loc 1 467 37 discriminator 3
	movq	-16(%rbp), %rdx	# i, tmp101
	salq	$2, %rdx	#, _4
	addq	%rdx, %rax	# _4, _5
	movss	(%rax), %xmm0	# *_5, _6
# src/deep.c:467:         printf("%f ", layer->weights[i]);
	.loc 1 467 9 discriminator 3
	cvtss2sd	%xmm0, %xmm0	# _6, _7
	leaq	.LC20(%rip), %rdi	#,
	movl	$1, %eax	#,
	call	printf@PLT	#
# src/deep.c:466:     for (size_t i = 0; i < layer->size_inputs * layer->size_neurons; i++)
	.loc 1 466 71 discriminator 3
	addq	$1, -16(%rbp)	#, i
.L132:
# src/deep.c:466:     for (size_t i = 0; i < layer->size_inputs * layer->size_neurons; i++)
	.loc 1 466 33 discriminator 1
	movq	-24(%rbp), %rax	# layer, tmp102
	movq	64(%rax), %rdx	# layer_22(D)->size_inputs, _8
# src/deep.c:466:     for (size_t i = 0; i < layer->size_inputs * layer->size_neurons; i++)
	.loc 1 466 54 discriminator 1
	movq	-24(%rbp), %rax	# layer, tmp103
	movq	72(%rax), %rax	# layer_22(D)->size_neurons, _9
# src/deep.c:466:     for (size_t i = 0; i < layer->size_inputs * layer->size_neurons; i++)
	.loc 1 466 47 discriminator 1
	imulq	%rdx, %rax	# _8, _10
# src/deep.c:466:     for (size_t i = 0; i < layer->size_inputs * layer->size_neurons; i++)
	.loc 1 466 5 discriminator 1
	cmpq	%rax, -16(%rbp)	# _10, i
	jb	.L133	#,
.LBE45:
# src/deep.c:468:     printf("\nBiases:\n");
	.loc 1 468 5
	leaq	.LC23(%rip), %rdi	#,
	call	puts@PLT	#
.LBB46:
# src/deep.c:469:     for (size_t i = 0; i < layer->size_neurons; i++)
	.loc 1 469 17
	movq	$0, -8(%rbp)	#, i
# src/deep.c:469:     for (size_t i = 0; i < layer->size_neurons; i++)
	.loc 1 469 5
	jmp	.L134	#
.L135:
# src/deep.c:470:         printf("%f ", layer->biases[i]);
	.loc 1 470 28 discriminator 3
	movq	-24(%rbp), %rax	# layer, tmp104
	movq	8(%rax), %rax	# layer_22(D)->biases, _11
# src/deep.c:470:         printf("%f ", layer->biases[i]);
	.loc 1 470 36 discriminator 3
	movq	-8(%rbp), %rdx	# i, tmp105
	salq	$2, %rdx	#, _12
	addq	%rdx, %rax	# _12, _13
	movss	(%rax), %xmm0	# *_13, _14
# src/deep.c:470:         printf("%f ", layer->biases[i]);
	.loc 1 470 9 discriminator 3
	cvtss2sd	%xmm0, %xmm0	# _14, _15
	leaq	.LC20(%rip), %rdi	#,
	movl	$1, %eax	#,
	call	printf@PLT	#
# src/deep.c:469:     for (size_t i = 0; i < layer->size_neurons; i++)
	.loc 1 469 50 discriminator 3
	addq	$1, -8(%rbp)	#, i
.L134:
# src/deep.c:469:     for (size_t i = 0; i < layer->size_neurons; i++)
	.loc 1 469 33 discriminator 1
	movq	-24(%rbp), %rax	# layer, tmp106
	movq	72(%rax), %rax	# layer_22(D)->size_neurons, _16
# src/deep.c:469:     for (size_t i = 0; i < layer->size_neurons; i++)
	.loc 1 469 5 discriminator 1
	cmpq	%rax, -8(%rbp)	# _16, i
	jb	.L135	#,
.LBE46:
# src/deep.c:471:     printf("\n");
	.loc 1 471 5
	movl	$10, %edi	#,
	call	putchar@PLT	#
# src/deep.c:472: }
	.loc 1 472 1
	nop	
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE32:
	.size	print_layer, .-print_layer
	.globl	free_layer
	.type	free_layer, @function
free_layer:
.LFB33:
	.loc 1 475 1
	.cfi_startproc
	endbr64	
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$16, %rsp	#,
	movq	%rdi, -8(%rbp)	# layer, layer
# src/deep.c:476:     free(layer->weights);
	.loc 1 476 15
	movq	-8(%rbp), %rax	# layer, tmp84
	movq	(%rax), %rax	# layer_4(D)->weights, _1
# src/deep.c:476:     free(layer->weights);
	.loc 1 476 5
	movq	%rax, %rdi	# _1,
	call	free@PLT	#
# src/deep.c:477:     free(layer->biases);
	.loc 1 477 15
	movq	-8(%rbp), %rax	# layer, tmp85
	movq	8(%rax), %rax	# layer_4(D)->biases, _2
# src/deep.c:477:     free(layer->biases);
	.loc 1 477 5
	movq	%rax, %rdi	# _2,
	call	free@PLT	#
# src/deep.c:478: }
	.loc 1 478 1
	nop	
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE33:
	.size	free_layer, .-free_layer
	.section	.rodata
.LC24:
	.string	"Probabilities:"
.LC25:
	.string	"\nprob sum = %f\n"
	.text
	.globl	print_probs
	.type	print_probs, @function
print_probs:
.LFB34:
	.loc 1 482 1
	.cfi_startproc
	endbr64	
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$80, %rsp	#,
	movq	%rdi, -56(%rbp)	# model, model
	movq	%rsi, -64(%rbp)	# activations, activations
	movq	%rdx, -72(%rbp)	# data, data
# src/deep.c:483:     printf("Probabilities:\n");
	.loc 1 483 5
	leaq	.LC24(%rip), %rdi	#,
	call	puts@PLT	#
# src/deep.c:484:     float *probs = model->layers[model->size_layers - 1]->activations_output;
	.loc 1 484 25
	movq	-56(%rbp), %rax	# model, tmp98
	movq	(%rax), %rdx	# model_24(D)->layers, _1
# src/deep.c:484:     float *probs = model->layers[model->size_layers - 1]->activations_output;
	.loc 1 484 39
	movq	-56(%rbp), %rax	# model, tmp99
	movq	8(%rax), %rax	# model_24(D)->size_layers, _2
# src/deep.c:484:     float *probs = model->layers[model->size_layers - 1]->activations_output;
	.loc 1 484 33
	salq	$3, %rax	#, _3
	subq	$8, %rax	#, _4
	addq	%rdx, %rax	# _1, _5
	movq	(%rax), %rax	# *_5, _6
# src/deep.c:484:     float *probs = model->layers[model->size_layers - 1]->activations_output;
	.loc 1 484 12
	movq	24(%rax), %rax	# _6->activations_output, tmp100
	movq	%rax, -16(%rbp)	# tmp100, probs
# src/deep.c:485:     float prob_sum = 0.0f;
	.loc 1 485 11
	pxor	%xmm0, %xmm0	# tmp101
	movss	%xmm0, -36(%rbp)	# tmp101, prob_sum
.LBB47:
# src/deep.c:486:     for (size_t idx_image = 0; idx_image < 2; idx_image++) {
	.loc 1 486 17
	movq	$0, -32(%rbp)	#, idx_image
# src/deep.c:486:     for (size_t idx_image = 0; idx_image < 2; idx_image++) {
	.loc 1 486 5
	jmp	.L138	#
.L141:
.LBB48:
# src/deep.c:487:         size_t start_sample = idx_image * SIZE_CLASSES;
	.loc 1 487 16
	movq	-32(%rbp), %rdx	# idx_image, tmp102
	movq	%rdx, %rax	# tmp102, tmp103
	salq	$2, %rax	#, tmp103
	addq	%rdx, %rax	# tmp102, tmp103
	addq	%rax, %rax	# tmp104
	movq	%rax, -8(%rbp)	# tmp103, start_sample
# src/deep.c:488:         prob_sum = 0.0f;
	.loc 1 488 18
	pxor	%xmm0, %xmm0	# tmp105
	movss	%xmm0, -36(%rbp)	# tmp105, prob_sum
.LBB49:
# src/deep.c:489:         for (size_t idx_prob = 0; idx_prob < SIZE_CLASSES; idx_prob++) {
	.loc 1 489 21
	movq	$0, -24(%rbp)	#, idx_prob
# src/deep.c:489:         for (size_t idx_prob = 0; idx_prob < SIZE_CLASSES; idx_prob++) {
	.loc 1 489 9
	jmp	.L139	#
.L140:
# src/deep.c:490:             prob_sum += probs[start_sample + idx_prob];
	.loc 1 490 44 discriminator 3
	movq	-8(%rbp), %rdx	# start_sample, tmp106
	movq	-24(%rbp), %rax	# idx_prob, tmp107
	addq	%rdx, %rax	# tmp106, _7
# src/deep.c:490:             prob_sum += probs[start_sample + idx_prob];
	.loc 1 490 30 discriminator 3
	leaq	0(,%rax,4), %rdx	#, _8
	movq	-16(%rbp), %rax	# probs, tmp108
	addq	%rdx, %rax	# _8, _9
	movss	(%rax), %xmm0	# *_9, _10
# src/deep.c:490:             prob_sum += probs[start_sample + idx_prob];
	.loc 1 490 22 discriminator 3
	movss	-36(%rbp), %xmm1	# prob_sum, tmp110
	addss	%xmm1, %xmm0	# tmp110, tmp109
	movss	%xmm0, -36(%rbp)	# tmp109, prob_sum
# src/deep.c:491:             printf("%f ", probs[start_sample + idx_prob]);
	.loc 1 491 46 discriminator 3
	movq	-8(%rbp), %rdx	# start_sample, tmp111
	movq	-24(%rbp), %rax	# idx_prob, tmp112
	addq	%rdx, %rax	# tmp111, _11
# src/deep.c:491:             printf("%f ", probs[start_sample + idx_prob]);
	.loc 1 491 32 discriminator 3
	leaq	0(,%rax,4), %rdx	#, _12
	movq	-16(%rbp), %rax	# probs, tmp113
	addq	%rdx, %rax	# _12, _13
	movss	(%rax), %xmm0	# *_13, _14
# src/deep.c:491:             printf("%f ", probs[start_sample + idx_prob]);
	.loc 1 491 13 discriminator 3
	cvtss2sd	%xmm0, %xmm0	# _14, _15
	leaq	.LC20(%rip), %rdi	#,
	movl	$1, %eax	#,
	call	printf@PLT	#
# src/deep.c:489:         for (size_t idx_prob = 0; idx_prob < SIZE_CLASSES; idx_prob++) {
	.loc 1 489 68 discriminator 3
	addq	$1, -24(%rbp)	#, idx_prob
.L139:
# src/deep.c:489:         for (size_t idx_prob = 0; idx_prob < SIZE_CLASSES; idx_prob++) {
	.loc 1 489 9 discriminator 1
	cmpq	$9, -24(%rbp)	#, idx_prob
	jbe	.L140	#,
.LBE49:
# src/deep.c:493:         printf("\n");
	.loc 1 493 9 discriminator 2
	movl	$10, %edi	#,
	call	putchar@PLT	#
# src/deep.c:494:         printf("\nprob sum = %f\n", prob_sum);
	.loc 1 494 9 discriminator 2
	cvtss2sd	-36(%rbp), %xmm0	# prob_sum, _16
	leaq	.LC25(%rip), %rdi	#,
	movl	$1, %eax	#,
	call	printf@PLT	#
.LBE48:
# src/deep.c:486:     for (size_t idx_image = 0; idx_image < 2; idx_image++) {
	.loc 1 486 56 discriminator 2
	addq	$1, -32(%rbp)	#, idx_image
.L138:
# src/deep.c:486:     for (size_t idx_image = 0; idx_image < 2; idx_image++) {
	.loc 1 486 5 discriminator 1
	cmpq	$1, -32(%rbp)	#, idx_image
	jbe	.L141	#,
.LBE47:
# src/deep.c:496: }
	.loc 1 496 1
	nop	
	nop	
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE34:
	.size	print_probs, .-print_probs
	.globl	get_loss
	.type	get_loss, @function
get_loss:
.LFB35:
	.loc 1 500 1
	.cfi_startproc
	endbr64	
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$64, %rsp	#,
	movq	%rdi, -40(%rbp)	# model, model
	movq	%rsi, -48(%rbp)	# activations, activations
	movq	%rdx, -56(%rbp)	# data, data
# src/deep.c:501:     float loss = 0.0f;
	.loc 1 501 11
	pxor	%xmm0, %xmm0	# tmp102
	movss	%xmm0, -28(%rbp)	# tmp102, loss
# src/deep.c:502:     float *probs = model->layers[model->size_layers - 1]->activations_output;
	.loc 1 502 25
	movq	-40(%rbp), %rax	# model, tmp103
	movq	(%rax), %rdx	# model_23(D)->layers, _1
# src/deep.c:502:     float *probs = model->layers[model->size_layers - 1]->activations_output;
	.loc 1 502 39
	movq	-40(%rbp), %rax	# model, tmp104
	movq	8(%rax), %rax	# model_23(D)->size_layers, _2
# src/deep.c:502:     float *probs = model->layers[model->size_layers - 1]->activations_output;
	.loc 1 502 33
	salq	$3, %rax	#, _3
	subq	$8, %rax	#, _4
	addq	%rdx, %rax	# _1, _5
	movq	(%rax), %rax	# *_5, _6
# src/deep.c:502:     float *probs = model->layers[model->size_layers - 1]->activations_output;
	.loc 1 502 12
	movq	24(%rax), %rax	# _6->activations_output, tmp105
	movq	%rax, -16(%rbp)	# tmp105, probs
.LBB50:
# src/deep.c:503:     for (size_t idx_image = 0; idx_image < data->nImages; idx_image++) {
	.loc 1 503 17
	movq	$0, -24(%rbp)	#, idx_image
# src/deep.c:503:     for (size_t idx_image = 0; idx_image < data->nImages; idx_image++) {
	.loc 1 503 5
	jmp	.L143	#
.L144:
.LBB51:
# src/deep.c:504:         unsigned char label = data->labels[idx_image];
	.loc 1 504 35 discriminator 3
	movq	-56(%rbp), %rax	# data, tmp106
	movq	8(%rax), %rdx	# data_26(D)->labels, _7
# src/deep.c:504:         unsigned char label = data->labels[idx_image];
	.loc 1 504 43 discriminator 3
	movq	-24(%rbp), %rax	# idx_image, tmp107
	addq	%rdx, %rax	# _7, _8
# src/deep.c:504:         unsigned char label = data->labels[idx_image];
	.loc 1 504 23 discriminator 3
	movzbl	(%rax), %eax	# *_8, tmp108
	movb	%al, -29(%rbp)	# tmp108, label
# src/deep.c:505:         size_t start_sample = idx_image * SIZE_CLASSES;
	.loc 1 505 16 discriminator 3
	movq	-24(%rbp), %rdx	# idx_image, tmp109
	movq	%rdx, %rax	# tmp109, tmp110
	salq	$2, %rax	#, tmp110
	addq	%rdx, %rax	# tmp109, tmp110
	addq	%rax, %rax	# tmp111
	movq	%rax, -8(%rbp)	# tmp110, start_sample
# src/deep.c:506:         loss -= logf(probs[start_sample + label]);
	.loc 1 506 41 discriminator 3
	movzbl	-29(%rbp), %edx	# label, _9
	movq	-8(%rbp), %rax	# start_sample, tmp112
	addq	%rdx, %rax	# _9, _10
# src/deep.c:506:         loss -= logf(probs[start_sample + label]);
	.loc 1 506 27 discriminator 3
	leaq	0(,%rax,4), %rdx	#, _11
	movq	-16(%rbp), %rax	# probs, tmp113
	addq	%rdx, %rax	# _11, _12
# src/deep.c:506:         loss -= logf(probs[start_sample + label]);
	.loc 1 506 17 discriminator 3
	movl	(%rax), %eax	# *_12, _13
	movd	%eax, %xmm0	# _13,
	call	logf@PLT	#
# src/deep.c:506:         loss -= logf(probs[start_sample + label]);
	.loc 1 506 14 discriminator 3
	movss	-28(%rbp), %xmm1	# loss, tmp115
	subss	%xmm0, %xmm1	# _31, tmp115
	movaps	%xmm1, %xmm0	# tmp115, tmp114
	movss	%xmm0, -28(%rbp)	# tmp114, loss
.LBE51:
# src/deep.c:503:     for (size_t idx_image = 0; idx_image < data->nImages; idx_image++) {
	.loc 1 503 68 discriminator 3
	addq	$1, -24(%rbp)	#, idx_image
.L143:
# src/deep.c:503:     for (size_t idx_image = 0; idx_image < data->nImages; idx_image++) {
	.loc 1 503 48 discriminator 1
	movq	-56(%rbp), %rax	# data, tmp116
	movl	16(%rax), %eax	# data_26(D)->nImages, _14
	cltq
# src/deep.c:503:     for (size_t idx_image = 0; idx_image < data->nImages; idx_image++) {
	.loc 1 503 5 discriminator 1
	cmpq	%rax, -24(%rbp)	# _15, idx_image
	jb	.L144	#,
.LBE50:
# src/deep.c:508:     return loss / data->nImages;
	.loc 1 508 23
	movq	-56(%rbp), %rax	# data, tmp117
	movl	16(%rax), %eax	# data_26(D)->nImages, _16
# src/deep.c:508:     return loss / data->nImages;
	.loc 1 508 17
	cvtsi2ssl	%eax, %xmm1	# _16, _17
	movss	-28(%rbp), %xmm0	# loss, tmp118
	divss	%xmm1, %xmm0	# _17, _27
# src/deep.c:509: }
	.loc 1 509 1
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE35:
	.size	get_loss, .-get_loss
	.globl	arg_max
	.type	arg_max, @function
arg_max:
.LFB36:
	.loc 1 512 1
	.cfi_startproc
	endbr64	
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)	# probs, probs
	movq	%rsi, -32(%rbp)	# size, size
# src/deep.c:513:     int max_idx = 0;
	.loc 1 513 9
	movl	$0, -16(%rbp)	#, max_idx
# src/deep.c:514:     float max_val = probs[0];
	.loc 1 514 11
	movq	-24(%rbp), %rax	# probs, tmp89
	movss	(%rax), %xmm0	# *probs_13(D), tmp90
	movss	%xmm0, -12(%rbp)	# tmp90, max_val
.LBB52:
# src/deep.c:515:     for (size_t i = 1; i < size; i++) {
	.loc 1 515 17
	movq	$1, -8(%rbp)	#, i
# src/deep.c:515:     for (size_t i = 1; i < size; i++) {
	.loc 1 515 5
	jmp	.L147	#
.L150:
# src/deep.c:516:         if (probs[i] > max_val) {
	.loc 1 516 18
	movq	-8(%rbp), %rax	# i, tmp91
	leaq	0(,%rax,4), %rdx	#, _1
	movq	-24(%rbp), %rax	# probs, tmp92
	addq	%rdx, %rax	# _1, _2
	movss	(%rax), %xmm0	# *_2, _3
# src/deep.c:516:         if (probs[i] > max_val) {
	.loc 1 516 12
	comiss	-12(%rbp), %xmm0	# max_val, _3
	jbe	.L148	#,
# src/deep.c:517:             max_val = probs[i];
	.loc 1 517 28
	movq	-8(%rbp), %rax	# i, tmp93
	leaq	0(,%rax,4), %rdx	#, _4
	movq	-24(%rbp), %rax	# probs, tmp94
	addq	%rdx, %rax	# _4, _5
# src/deep.c:517:             max_val = probs[i];
	.loc 1 517 21
	movss	(%rax), %xmm0	# *_5, tmp95
	movss	%xmm0, -12(%rbp)	# tmp95, max_val
# src/deep.c:518:             max_idx = i;
	.loc 1 518 21
	movq	-8(%rbp), %rax	# i, tmp96
	movl	%eax, -16(%rbp)	# tmp96, max_idx
.L148:
# src/deep.c:515:     for (size_t i = 1; i < size; i++) {
	.loc 1 515 35 discriminator 2
	addq	$1, -8(%rbp)	#, i
.L147:
# src/deep.c:515:     for (size_t i = 1; i < size; i++) {
	.loc 1 515 5 discriminator 1
	movq	-8(%rbp), %rax	# i, tmp97
	cmpq	-32(%rbp), %rax	# size, tmp97
	jb	.L150	#,
.LBE52:
# src/deep.c:521:     return max_idx;
	.loc 1 521 12
	movl	-16(%rbp), %eax	# max_idx, _17
# src/deep.c:522: }
	.loc 1 522 1
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE36:
	.size	arg_max, .-arg_max
	.globl	get_accuracy
	.type	get_accuracy, @function
get_accuracy:
.LFB37:
	.loc 1 525 1
	.cfi_startproc
	endbr64	
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$72, %rsp	#,
	movq	%rdi, -56(%rbp)	# model, model
	movq	%rsi, -64(%rbp)	# activations, activations
	movq	%rdx, -72(%rbp)	# data, data
# src/deep.c:526:     int correct = 0;
	.loc 1 526 9
	movl	$0, -32(%rbp)	#, correct
# src/deep.c:527:     float *probs = model->layers[model->size_layers - 1]->activations_output;
	.loc 1 527 25
	movq	-56(%rbp), %rax	# model, tmp100
	movq	(%rax), %rdx	# model_23(D)->layers, _1
# src/deep.c:527:     float *probs = model->layers[model->size_layers - 1]->activations_output;
	.loc 1 527 39
	movq	-56(%rbp), %rax	# model, tmp101
	movq	8(%rax), %rax	# model_23(D)->size_layers, _2
# src/deep.c:527:     float *probs = model->layers[model->size_layers - 1]->activations_output;
	.loc 1 527 33
	salq	$3, %rax	#, _3
	subq	$8, %rax	#, _4
	addq	%rdx, %rax	# _1, _5
	movq	(%rax), %rax	# *_5, _6
# src/deep.c:527:     float *probs = model->layers[model->size_layers - 1]->activations_output;
	.loc 1 527 12
	movq	24(%rax), %rax	# _6->activations_output, tmp102
	movq	%rax, -16(%rbp)	# tmp102, probs
.LBB53:
# src/deep.c:528:     for (size_t idx_image = 0; idx_image < data->nImages; idx_image++) {
	.loc 1 528 17
	movq	$0, -24(%rbp)	#, idx_image
# src/deep.c:528:     for (size_t idx_image = 0; idx_image < data->nImages; idx_image++) {
	.loc 1 528 5
	jmp	.L154	#
.L156:
.LBB54:
# src/deep.c:529:         unsigned char label = data->labels[idx_image];
	.loc 1 529 35
	movq	-72(%rbp), %rax	# data, tmp103
	movq	8(%rax), %rdx	# data_26(D)->labels, _7
# src/deep.c:529:         unsigned char label = data->labels[idx_image];
	.loc 1 529 43
	movq	-24(%rbp), %rax	# idx_image, tmp104
	addq	%rdx, %rax	# _7, _8
# src/deep.c:529:         unsigned char label = data->labels[idx_image];
	.loc 1 529 23
	movzbl	(%rax), %eax	# *_8, tmp105
	movb	%al, -33(%rbp)	# tmp105, label
# src/deep.c:530:         size_t offset_probs_dist = idx_image * SIZE_CLASSES;
	.loc 1 530 16
	movq	-24(%rbp), %rdx	# idx_image, tmp106
	movq	%rdx, %rax	# tmp106, tmp107
	salq	$2, %rax	#, tmp107
	addq	%rdx, %rax	# tmp106, tmp107
	addq	%rax, %rax	# tmp108
	movq	%rax, -8(%rbp)	# tmp107, offset_probs_dist
# src/deep.c:531:         int predicted_label = arg_max(probs + offset_probs_dist, SIZE_CLASSES);
	.loc 1 531 45
	movq	-8(%rbp), %rax	# offset_probs_dist, tmp109
	leaq	0(,%rax,4), %rdx	#, _9
# src/deep.c:531:         int predicted_label = arg_max(probs + offset_probs_dist, SIZE_CLASSES);
	.loc 1 531 31
	movq	-16(%rbp), %rax	# probs, tmp110
	addq	%rdx, %rax	# _9, _10
	movl	$10, %esi	#,
	movq	%rax, %rdi	# _10,
	call	arg_max	#
	movl	%eax, -28(%rbp)	# tmp111, predicted_label
# src/deep.c:532:         if (predicted_label == label) {
	.loc 1 532 29
	movzbl	-33(%rbp), %eax	# label, _11
# src/deep.c:532:         if (predicted_label == label) {
	.loc 1 532 12
	cmpl	%eax, -28(%rbp)	# _11, predicted_label
	jne	.L155	#,
# src/deep.c:533:             correct++;
	.loc 1 533 20
	addl	$1, -32(%rbp)	#, correct
.L155:
.LBE54:
# src/deep.c:528:     for (size_t idx_image = 0; idx_image < data->nImages; idx_image++) {
	.loc 1 528 68 discriminator 2
	addq	$1, -24(%rbp)	#, idx_image
.L154:
# src/deep.c:528:     for (size_t idx_image = 0; idx_image < data->nImages; idx_image++) {
	.loc 1 528 48 discriminator 1
	movq	-72(%rbp), %rax	# data, tmp112
	movl	16(%rax), %eax	# data_26(D)->nImages, _12
	cltq
# src/deep.c:528:     for (size_t idx_image = 0; idx_image < data->nImages; idx_image++) {
	.loc 1 528 5 discriminator 1
	cmpq	%rax, -24(%rbp)	# _13, idx_image
	jb	.L156	#,
.LBE53:
# src/deep.c:536:     return (float)correct / data->nImages;
	.loc 1 536 12
	cvtsi2ssl	-32(%rbp), %xmm0	# correct, _14
# src/deep.c:536:     return (float)correct / data->nImages;
	.loc 1 536 33
	movq	-72(%rbp), %rax	# data, tmp113
	movl	16(%rax), %eax	# data_26(D)->nImages, _15
# src/deep.c:536:     return (float)correct / data->nImages;
	.loc 1 536 27
	cvtsi2ssl	%eax, %xmm1	# _15, _16
	divss	%xmm1, %xmm0	# _16, _27
# src/deep.c:537: }
	.loc 1 537 1
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE37:
	.size	get_accuracy, .-get_accuracy
	.section	.rodata
	.align 8
.LC26:
	.string	"\n%zu bytes allocated for acts\n"
	.text
	.globl	initialise_activations
	.type	initialise_activations, @function
initialise_activations:
.LFB38:
	.loc 1 541 1
	.cfi_startproc
	endbr64	
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$80, %rsp	#,
	movq	%rdi, -56(%rbp)	# activations, activations
	movq	%rsi, -64(%rbp)	# model, model
	movq	%rdx, -72(%rbp)	# data, data
# src/deep.c:542:     activations->size_activations = 0;
	.loc 1 542 35
	movq	-56(%rbp), %rax	# activations, tmp145
	movq	$0, 8(%rax)	#, activations_71(D)->size_activations
.LBB55:
# src/deep.c:543:     for (size_t i = 0; i < model->size_layers; i++) {
	.loc 1 543 17
	movq	$0, -48(%rbp)	#, i
# src/deep.c:543:     for (size_t i = 0; i < model->size_layers; i++) {
	.loc 1 543 5
	jmp	.L159	#
.L160:
# src/deep.c:544:         activations->size_activations += model->layers[i]->size_neurons;
	.loc 1 544 39 discriminator 3
	movq	-56(%rbp), %rax	# activations, tmp146
	movq	8(%rax), %rdx	# activations_71(D)->size_activations, _1
# src/deep.c:544:         activations->size_activations += model->layers[i]->size_neurons;
	.loc 1 544 47 discriminator 3
	movq	-64(%rbp), %rax	# model, tmp147
	movq	(%rax), %rax	# model_74(D)->layers, _2
# src/deep.c:544:         activations->size_activations += model->layers[i]->size_neurons;
	.loc 1 544 55 discriminator 3
	movq	-48(%rbp), %rcx	# i, tmp148
	salq	$3, %rcx	#, _3
	addq	%rcx, %rax	# _3, _4
	movq	(%rax), %rax	# *_4, _5
# src/deep.c:544:         activations->size_activations += model->layers[i]->size_neurons;
	.loc 1 544 58 discriminator 3
	movq	72(%rax), %rax	# _5->size_neurons, _6
# src/deep.c:544:         activations->size_activations += model->layers[i]->size_neurons;
	.loc 1 544 39 discriminator 3
	addq	%rax, %rdx	# _6, _7
	movq	-56(%rbp), %rax	# activations, tmp149
	movq	%rdx, 8(%rax)	# _7, activations_71(D)->size_activations
# src/deep.c:543:     for (size_t i = 0; i < model->size_layers; i++) {
	.loc 1 543 49 discriminator 3
	addq	$1, -48(%rbp)	#, i
.L159:
# src/deep.c:543:     for (size_t i = 0; i < model->size_layers; i++) {
	.loc 1 543 33 discriminator 1
	movq	-64(%rbp), %rax	# model, tmp150
	movq	8(%rax), %rax	# model_74(D)->size_layers, _8
# src/deep.c:543:     for (size_t i = 0; i < model->size_layers; i++) {
	.loc 1 543 5 discriminator 1
	cmpq	%rax, -48(%rbp)	# _8, i
	jb	.L160	#,
.LBE55:
# src/deep.c:546:     activations->size_activations += data->rows * data->cols;
	.loc 1 546 35
	movq	-56(%rbp), %rax	# activations, tmp151
	movq	8(%rax), %rdx	# activations_71(D)->size_activations, _9
# src/deep.c:546:     activations->size_activations += data->rows * data->cols;
	.loc 1 546 42
	movq	-72(%rbp), %rax	# data, tmp152
	movl	20(%rax), %ecx	# data_75(D)->rows, _10
# src/deep.c:546:     activations->size_activations += data->rows * data->cols;
	.loc 1 546 55
	movq	-72(%rbp), %rax	# data, tmp153
	movl	24(%rax), %eax	# data_75(D)->cols, _11
# src/deep.c:546:     activations->size_activations += data->rows * data->cols;
	.loc 1 546 49
	imull	%ecx, %eax	# _10, _12
	cltq
# src/deep.c:546:     activations->size_activations += data->rows * data->cols;
	.loc 1 546 35
	addq	%rax, %rdx	# _13, _14
	movq	-56(%rbp), %rax	# activations, tmp154
	movq	%rdx, 8(%rax)	# _14, activations_71(D)->size_activations
# src/deep.c:547:     activations->size_activations *= data->nImages;
	.loc 1 547 35
	movq	-56(%rbp), %rax	# activations, tmp155
	movq	8(%rax), %rdx	# activations_71(D)->size_activations, _15
# src/deep.c:547:     activations->size_activations *= data->nImages;
	.loc 1 547 42
	movq	-72(%rbp), %rax	# data, tmp156
	movl	16(%rax), %eax	# data_75(D)->nImages, _16
	cltq
# src/deep.c:547:     activations->size_activations *= data->nImages;
	.loc 1 547 35
	imulq	%rax, %rdx	# _17, _18
	movq	-56(%rbp), %rax	# activations, tmp157
	movq	%rdx, 8(%rax)	# _18, activations_71(D)->size_activations
# src/deep.c:548:     activations->activations = calloc(activations->size_activations, sizeof(float));
	.loc 1 548 32
	movq	-56(%rbp), %rax	# activations, tmp158
	movq	8(%rax), %rax	# activations_71(D)->size_activations, _19
	movl	$4, %esi	#,
	movq	%rax, %rdi	# _19,
	call	calloc@PLT	#
	movq	%rax, %rdx	# tmp159, _20
# src/deep.c:548:     activations->activations = calloc(activations->size_activations, sizeof(float));
	.loc 1 548 30
	movq	-56(%rbp), %rax	# activations, tmp160
	movq	%rdx, (%rax)	# _20, activations_71(D)->activations
# src/deep.c:549:     printf("\n%zu bytes allocated for acts\n", activations->size_activations * sizeof(float));
	.loc 1 549 59
	movq	-56(%rbp), %rax	# activations, tmp161
	movq	8(%rax), %rax	# activations_71(D)->size_activations, _21
# src/deep.c:549:     printf("\n%zu bytes allocated for acts\n", activations->size_activations * sizeof(float));
	.loc 1 549 5
	salq	$2, %rax	#, _22
	movq	%rax, %rsi	# _22,
	leaq	.LC26(%rip), %rdi	#,
	movl	$0, %eax	#,
	call	printf@PLT	#
.LBB56:
# src/deep.c:551:     for (size_t idx_pixel = 0; idx_pixel < data->nImages * data->rows * data->cols; idx_pixel++) {
	.loc 1 551 17
	movq	$0, -40(%rbp)	#, idx_pixel
# src/deep.c:551:     for (size_t idx_pixel = 0; idx_pixel < data->nImages * data->rows * data->cols; idx_pixel++) {
	.loc 1 551 5
	jmp	.L161	#
.L162:
# src/deep.c:552:         activations->activations[idx_pixel] = (float)data->images[idx_pixel] / 255.0f;
	.loc 1 552 58 discriminator 3
	movq	-72(%rbp), %rax	# data, tmp162
	movq	(%rax), %rdx	# data_75(D)->images, _23
# src/deep.c:552:         activations->activations[idx_pixel] = (float)data->images[idx_pixel] / 255.0f;
	.loc 1 552 66 discriminator 3
	movq	-40(%rbp), %rax	# idx_pixel, tmp163
	addq	%rdx, %rax	# _23, _24
	movzbl	(%rax), %eax	# *_24, _25
# src/deep.c:552:         activations->activations[idx_pixel] = (float)data->images[idx_pixel] / 255.0f;
	.loc 1 552 47 discriminator 3
	movzbl	%al, %eax	# _25, tmp164
	cvtsi2ssl	%eax, %xmm0	# tmp164, _26
# src/deep.c:552:         activations->activations[idx_pixel] = (float)data->images[idx_pixel] / 255.0f;
	.loc 1 552 20 discriminator 3
	movq	-56(%rbp), %rax	# activations, tmp165
	movq	(%rax), %rax	# activations_71(D)->activations, _27
# src/deep.c:552:         activations->activations[idx_pixel] = (float)data->images[idx_pixel] / 255.0f;
	.loc 1 552 33 discriminator 3
	movq	-40(%rbp), %rdx	# idx_pixel, tmp166
	salq	$2, %rdx	#, _28
	addq	%rdx, %rax	# _28, _29
# src/deep.c:552:         activations->activations[idx_pixel] = (float)data->images[idx_pixel] / 255.0f;
	.loc 1 552 78 discriminator 3
	movss	.LC27(%rip), %xmm1	#, tmp167
	divss	%xmm1, %xmm0	# tmp167, _30
# src/deep.c:552:         activations->activations[idx_pixel] = (float)data->images[idx_pixel] / 255.0f;
	.loc 1 552 45 discriminator 3
	movss	%xmm0, (%rax)	# _30, *_29
# src/deep.c:551:     for (size_t idx_pixel = 0; idx_pixel < data->nImages * data->rows * data->cols; idx_pixel++) {
	.loc 1 551 94 discriminator 3
	addq	$1, -40(%rbp)	#, idx_pixel
.L161:
# src/deep.c:551:     for (size_t idx_pixel = 0; idx_pixel < data->nImages * data->rows * data->cols; idx_pixel++) {
	.loc 1 551 48 discriminator 1
	movq	-72(%rbp), %rax	# data, tmp168
	movl	16(%rax), %edx	# data_75(D)->nImages, _31
# src/deep.c:551:     for (size_t idx_pixel = 0; idx_pixel < data->nImages * data->rows * data->cols; idx_pixel++) {
	.loc 1 551 64 discriminator 1
	movq	-72(%rbp), %rax	# data, tmp169
	movl	20(%rax), %eax	# data_75(D)->rows, _32
# src/deep.c:551:     for (size_t idx_pixel = 0; idx_pixel < data->nImages * data->rows * data->cols; idx_pixel++) {
	.loc 1 551 58 discriminator 1
	imull	%eax, %edx	# _32, _33
# src/deep.c:551:     for (size_t idx_pixel = 0; idx_pixel < data->nImages * data->rows * data->cols; idx_pixel++) {
	.loc 1 551 77 discriminator 1
	movq	-72(%rbp), %rax	# data, tmp170
	movl	24(%rax), %eax	# data_75(D)->cols, _34
# src/deep.c:551:     for (size_t idx_pixel = 0; idx_pixel < data->nImages * data->rows * data->cols; idx_pixel++) {
	.loc 1 551 71 discriminator 1
	imull	%edx, %eax	# _33, _35
	cltq
# src/deep.c:551:     for (size_t idx_pixel = 0; idx_pixel < data->nImages * data->rows * data->cols; idx_pixel++) {
	.loc 1 551 5 discriminator 1
	cmpq	%rax, -40(%rbp)	# _36, idx_pixel
	jb	.L162	#,
.LBE56:
# src/deep.c:555:     float *inputs = activations->activations;
	.loc 1 555 12
	movq	-56(%rbp), %rax	# activations, tmp171
	movq	(%rax), %rax	# activations_71(D)->activations, tmp172
	movq	%rax, -24(%rbp)	# tmp172, inputs
# src/deep.c:556:     float *outputs = activations->activations + data->rows * data->cols;
	.loc 1 556 33
	movq	-56(%rbp), %rax	# activations, tmp173
	movq	(%rax), %rdx	# activations_71(D)->activations, _37
# src/deep.c:556:     float *outputs = activations->activations + data->rows * data->cols;
	.loc 1 556 53
	movq	-72(%rbp), %rax	# data, tmp174
	movl	20(%rax), %ecx	# data_75(D)->rows, _38
# src/deep.c:556:     float *outputs = activations->activations + data->rows * data->cols;
	.loc 1 556 66
	movq	-72(%rbp), %rax	# data, tmp175
	movl	24(%rax), %eax	# data_75(D)->cols, _39
# src/deep.c:556:     float *outputs = activations->activations + data->rows * data->cols;
	.loc 1 556 60
	imull	%ecx, %eax	# _38, _40
	cltq
# src/deep.c:556:     float *outputs = activations->activations + data->rows * data->cols;
	.loc 1 556 47
	salq	$2, %rax	#, _42
# src/deep.c:556:     float *outputs = activations->activations + data->rows * data->cols;
	.loc 1 556 12
	addq	%rdx, %rax	# _37, tmp176
	movq	%rax, -16(%rbp)	# tmp176, outputs
.LBB57:
# src/deep.c:558:     for (size_t idx_layer = 0; idx_layer < model->size_layers; idx_layer++) {
	.loc 1 558 17
	movq	$0, -32(%rbp)	#, idx_layer
# src/deep.c:558:     for (size_t idx_layer = 0; idx_layer < model->size_layers; idx_layer++) {
	.loc 1 558 5
	jmp	.L163	#
.L168:
.LBB58:
# src/deep.c:559:         Layer *layer = model->layers[idx_layer];
	.loc 1 559 29
	movq	-64(%rbp), %rax	# model, tmp177
	movq	(%rax), %rax	# model_74(D)->layers, _43
# src/deep.c:559:         Layer *layer = model->layers[idx_layer];
	.loc 1 559 37
	movq	-32(%rbp), %rdx	# idx_layer, tmp178
	salq	$3, %rdx	#, _44
	addq	%rdx, %rax	# _44, _45
# src/deep.c:559:         Layer *layer = model->layers[idx_layer];
	.loc 1 559 16
	movq	(%rax), %rax	# *_45, tmp179
	movq	%rax, -8(%rbp)	# tmp179, layer
# src/deep.c:560:         layer->activations_input = idx_layer == 0 ? inputs : model->layers[idx_layer - 1]->activations_output;
	.loc 1 560 60
	cmpq	$0, -32(%rbp)	#, idx_layer
	je	.L164	#,
# src/deep.c:560:         layer->activations_input = idx_layer == 0 ? inputs : model->layers[idx_layer - 1]->activations_output;
	.loc 1 560 67 discriminator 1
	movq	-64(%rbp), %rax	# model, tmp180
	movq	(%rax), %rax	# model_74(D)->layers, _46
# src/deep.c:560:         layer->activations_input = idx_layer == 0 ? inputs : model->layers[idx_layer - 1]->activations_output;
	.loc 1 560 75 discriminator 1
	movq	-32(%rbp), %rdx	# idx_layer, tmp181
	salq	$3, %rdx	#, _47
	subq	$8, %rdx	#, _48
	addq	%rdx, %rax	# _48, _49
	movq	(%rax), %rax	# *_49, _50
# src/deep.c:560:         layer->activations_input = idx_layer == 0 ? inputs : model->layers[idx_layer - 1]->activations_output;
	.loc 1 560 60 discriminator 1
	movq	24(%rax), %rax	# _50->activations_output, iftmp.1_65
	jmp	.L165	#
.L164:
# src/deep.c:560:         layer->activations_input = idx_layer == 0 ? inputs : model->layers[idx_layer - 1]->activations_output;
	.loc 1 560 60 is_stmt 0 discriminator 2
	movq	-24(%rbp), %rax	# inputs, iftmp.1_65
.L165:
# src/deep.c:560:         layer->activations_input = idx_layer == 0 ? inputs : model->layers[idx_layer - 1]->activations_output;
	.loc 1 560 34 is_stmt 1 discriminator 4
	movq	-8(%rbp), %rdx	# layer, tmp182
	movq	%rax, 16(%rdx)	# iftmp.1_65, layer_85->activations_input
# src/deep.c:561:         layer->activations_output = idx_layer == 0? outputs : outputs + model->layers[idx_layer -1]->size_neurons * data->nImages;
	.loc 1 561 61 discriminator 4
	cmpq	$0, -32(%rbp)	#, idx_layer
	je	.L166	#,
# src/deep.c:561:         layer->activations_output = idx_layer == 0? outputs : outputs + model->layers[idx_layer -1]->size_neurons * data->nImages;
	.loc 1 561 78 discriminator 1
	movq	-64(%rbp), %rax	# model, tmp183
	movq	(%rax), %rax	# model_74(D)->layers, _51
# src/deep.c:561:         layer->activations_output = idx_layer == 0? outputs : outputs + model->layers[idx_layer -1]->size_neurons * data->nImages;
	.loc 1 561 86 discriminator 1
	movq	-32(%rbp), %rdx	# idx_layer, tmp184
	salq	$3, %rdx	#, _52
	subq	$8, %rdx	#, _53
	addq	%rdx, %rax	# _53, _54
	movq	(%rax), %rax	# *_54, _55
# src/deep.c:561:         layer->activations_output = idx_layer == 0? outputs : outputs + model->layers[idx_layer -1]->size_neurons * data->nImages;
	.loc 1 561 100 discriminator 1
	movq	72(%rax), %rdx	# _55->size_neurons, _56
# src/deep.c:561:         layer->activations_output = idx_layer == 0? outputs : outputs + model->layers[idx_layer -1]->size_neurons * data->nImages;
	.loc 1 561 121 discriminator 1
	movq	-72(%rbp), %rax	# data, tmp185
	movl	16(%rax), %eax	# data_75(D)->nImages, _57
	cltq
# src/deep.c:561:         layer->activations_output = idx_layer == 0? outputs : outputs + model->layers[idx_layer -1]->size_neurons * data->nImages;
	.loc 1 561 115 discriminator 1
	imulq	%rdx, %rax	# _56, _59
# src/deep.c:561:         layer->activations_output = idx_layer == 0? outputs : outputs + model->layers[idx_layer -1]->size_neurons * data->nImages;
	.loc 1 561 71 discriminator 1
	leaq	0(,%rax,4), %rdx	#, _60
# src/deep.c:561:         layer->activations_output = idx_layer == 0? outputs : outputs + model->layers[idx_layer -1]->size_neurons * data->nImages;
	.loc 1 561 61 discriminator 1
	movq	-16(%rbp), %rax	# outputs, tmp186
	addq	%rdx, %rax	# _60, iftmp.2_66
	jmp	.L167	#
.L166:
# src/deep.c:561:         layer->activations_output = idx_layer == 0? outputs : outputs + model->layers[idx_layer -1]->size_neurons * data->nImages;
	.loc 1 561 61 is_stmt 0 discriminator 2
	movq	-16(%rbp), %rax	# outputs, iftmp.2_66
.L167:
# src/deep.c:561:         layer->activations_output = idx_layer == 0? outputs : outputs + model->layers[idx_layer -1]->size_neurons * data->nImages;
	.loc 1 561 35 is_stmt 1 discriminator 4
	movq	-8(%rbp), %rdx	# layer, tmp187
	movq	%rax, 24(%rdx)	# iftmp.2_66, layer_85->activations_output
.LBE58:
# src/deep.c:558:     for (size_t idx_layer = 0; idx_layer < model->size_layers; idx_layer++) {
	.loc 1 558 73 discriminator 4
	addq	$1, -32(%rbp)	#, idx_layer
.L163:
# src/deep.c:558:     for (size_t idx_layer = 0; idx_layer < model->size_layers; idx_layer++) {
	.loc 1 558 49 discriminator 2
	movq	-64(%rbp), %rax	# model, tmp188
	movq	8(%rax), %rax	# model_74(D)->size_layers, _61
# src/deep.c:558:     for (size_t idx_layer = 0; idx_layer < model->size_layers; idx_layer++) {
	.loc 1 558 5 discriminator 2
	cmpq	%rax, -32(%rbp)	# _61, idx_layer
	jb	.L168	#,
.LBE57:
# src/deep.c:563: }
	.loc 1 563 1
	nop	
	nop	
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE38:
	.size	initialise_activations, .-initialise_activations
	.section	.rodata
.LC28:
	.string	"%zu act bytes freed.\n"
	.text
	.globl	free_activations
	.type	free_activations, @function
free_activations:
.LFB39:
	.loc 1 566 1
	.cfi_startproc
	endbr64	
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$16, %rsp	#,
	movq	%rdi, -8(%rbp)	# activations, activations
# src/deep.c:567:     free(activations->activations);
	.loc 1 567 21
	movq	-8(%rbp), %rax	# activations, tmp85
	movq	(%rax), %rax	# activations_5(D)->activations, _1
# src/deep.c:567:     free(activations->activations);
	.loc 1 567 5
	movq	%rax, %rdi	# _1,
	call	free@PLT	#
# src/deep.c:568:     printf("%zu act bytes freed.\n", activations->size_activations * sizeof(float));
	.loc 1 568 49
	movq	-8(%rbp), %rax	# activations, tmp86
	movq	8(%rax), %rax	# activations_5(D)->size_activations, _2
# src/deep.c:568:     printf("%zu act bytes freed.\n", activations->size_activations * sizeof(float));
	.loc 1 568 5
	salq	$2, %rax	#, _3
	movq	%rax, %rsi	# _3,
	leaq	.LC28(%rip), %rdi	#,
	movl	$0, %eax	#,
	call	printf@PLT	#
# src/deep.c:569: }
	.loc 1 569 1
	nop	
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE39:
	.size	free_activations, .-free_activations
	.globl	initialise_gradients
	.type	initialise_gradients, @function
initialise_gradients:
.LFB40:
	.loc 1 572 1
	.cfi_startproc
	endbr64	
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$64, %rsp	#,
	movq	%rdi, -40(%rbp)	# gradients, gradients
	movq	%rsi, -48(%rbp)	# model, model
	movq	%rdx, -56(%rbp)	# data, data
.LBB59:
# src/deep.c:573:     for (size_t i = 0; i < model->size_layers; i++) {
	.loc 1 573 17
	movq	$0, -24(%rbp)	#, i
# src/deep.c:573:     for (size_t i = 0; i < model->size_layers; i++) {
	.loc 1 573 5
	jmp	.L171	#
.L172:
# src/deep.c:575:         gradients->size_grads += model->layers[i]->size_inputs * model->layers[i]->size_neurons;
	.loc 1 575 31 discriminator 3
	movq	-40(%rbp), %rax	# gradients, tmp152
	movq	8(%rax), %rdx	# gradients_78(D)->size_grads, _1
# src/deep.c:575:         gradients->size_grads += model->layers[i]->size_inputs * model->layers[i]->size_neurons;
	.loc 1 575 39 discriminator 3
	movq	-48(%rbp), %rax	# model, tmp153
	movq	(%rax), %rax	# model_77(D)->layers, _2
# src/deep.c:575:         gradients->size_grads += model->layers[i]->size_inputs * model->layers[i]->size_neurons;
	.loc 1 575 47 discriminator 3
	movq	-24(%rbp), %rcx	# i, tmp154
	salq	$3, %rcx	#, _3
	addq	%rcx, %rax	# _3, _4
	movq	(%rax), %rax	# *_4, _5
# src/deep.c:575:         gradients->size_grads += model->layers[i]->size_inputs * model->layers[i]->size_neurons;
	.loc 1 575 50 discriminator 3
	movq	64(%rax), %rcx	# _5->size_inputs, _6
# src/deep.c:575:         gradients->size_grads += model->layers[i]->size_inputs * model->layers[i]->size_neurons;
	.loc 1 575 71 discriminator 3
	movq	-48(%rbp), %rax	# model, tmp155
	movq	(%rax), %rax	# model_77(D)->layers, _7
# src/deep.c:575:         gradients->size_grads += model->layers[i]->size_inputs * model->layers[i]->size_neurons;
	.loc 1 575 79 discriminator 3
	movq	-24(%rbp), %rsi	# i, tmp156
	salq	$3, %rsi	#, _8
	addq	%rsi, %rax	# _8, _9
	movq	(%rax), %rax	# *_9, _10
# src/deep.c:575:         gradients->size_grads += model->layers[i]->size_inputs * model->layers[i]->size_neurons;
	.loc 1 575 82 discriminator 3
	movq	72(%rax), %rax	# _10->size_neurons, _11
# src/deep.c:575:         gradients->size_grads += model->layers[i]->size_inputs * model->layers[i]->size_neurons;
	.loc 1 575 64 discriminator 3
	imulq	%rcx, %rax	# _6, _12
# src/deep.c:575:         gradients->size_grads += model->layers[i]->size_inputs * model->layers[i]->size_neurons;
	.loc 1 575 31 discriminator 3
	addq	%rax, %rdx	# _12, _13
	movq	-40(%rbp), %rax	# gradients, tmp157
	movq	%rdx, 8(%rax)	# _13, gradients_78(D)->size_grads
# src/deep.c:576:         gradients->size_grads += model->layers[i]->size_neurons;
	.loc 1 576 31 discriminator 3
	movq	-40(%rbp), %rax	# gradients, tmp158
	movq	8(%rax), %rdx	# gradients_78(D)->size_grads, _14
# src/deep.c:576:         gradients->size_grads += model->layers[i]->size_neurons;
	.loc 1 576 39 discriminator 3
	movq	-48(%rbp), %rax	# model, tmp159
	movq	(%rax), %rax	# model_77(D)->layers, _15
# src/deep.c:576:         gradients->size_grads += model->layers[i]->size_neurons;
	.loc 1 576 47 discriminator 3
	movq	-24(%rbp), %rcx	# i, tmp160
	salq	$3, %rcx	#, _16
	addq	%rcx, %rax	# _16, _17
	movq	(%rax), %rax	# *_17, _18
# src/deep.c:576:         gradients->size_grads += model->layers[i]->size_neurons;
	.loc 1 576 50 discriminator 3
	movq	72(%rax), %rax	# _18->size_neurons, _19
# src/deep.c:576:         gradients->size_grads += model->layers[i]->size_neurons;
	.loc 1 576 31 discriminator 3
	addq	%rax, %rdx	# _19, _20
	movq	-40(%rbp), %rax	# gradients, tmp161
	movq	%rdx, 8(%rax)	# _20, gradients_78(D)->size_grads
# src/deep.c:578:         gradients->size_grads += model->layers[i]->size_neurons * data->nImages;
	.loc 1 578 31 discriminator 3
	movq	-40(%rbp), %rax	# gradients, tmp162
	movq	8(%rax), %rdx	# gradients_78(D)->size_grads, _21
# src/deep.c:578:         gradients->size_grads += model->layers[i]->size_neurons * data->nImages;
	.loc 1 578 39 discriminator 3
	movq	-48(%rbp), %rax	# model, tmp163
	movq	(%rax), %rax	# model_77(D)->layers, _22
# src/deep.c:578:         gradients->size_grads += model->layers[i]->size_neurons * data->nImages;
	.loc 1 578 47 discriminator 3
	movq	-24(%rbp), %rcx	# i, tmp164
	salq	$3, %rcx	#, _23
	addq	%rcx, %rax	# _23, _24
	movq	(%rax), %rax	# *_24, _25
# src/deep.c:578:         gradients->size_grads += model->layers[i]->size_neurons * data->nImages;
	.loc 1 578 50 discriminator 3
	movq	72(%rax), %rcx	# _25->size_neurons, _26
# src/deep.c:578:         gradients->size_grads += model->layers[i]->size_neurons * data->nImages;
	.loc 1 578 71 discriminator 3
	movq	-56(%rbp), %rax	# data, tmp165
	movl	16(%rax), %eax	# data_86(D)->nImages, _27
	cltq
# src/deep.c:578:         gradients->size_grads += model->layers[i]->size_neurons * data->nImages;
	.loc 1 578 65 discriminator 3
	imulq	%rcx, %rax	# _26, _29
# src/deep.c:578:         gradients->size_grads += model->layers[i]->size_neurons * data->nImages;
	.loc 1 578 31 discriminator 3
	addq	%rax, %rdx	# _29, _30
	movq	-40(%rbp), %rax	# gradients, tmp166
	movq	%rdx, 8(%rax)	# _30, gradients_78(D)->size_grads
# src/deep.c:573:     for (size_t i = 0; i < model->size_layers; i++) {
	.loc 1 573 49 discriminator 3
	addq	$1, -24(%rbp)	#, i
.L171:
# src/deep.c:573:     for (size_t i = 0; i < model->size_layers; i++) {
	.loc 1 573 33 discriminator 1
	movq	-48(%rbp), %rax	# model, tmp167
	movq	8(%rax), %rax	# model_77(D)->size_layers, _31
# src/deep.c:573:     for (size_t i = 0; i < model->size_layers; i++) {
	.loc 1 573 5 discriminator 1
	cmpq	%rax, -24(%rbp)	# _31, i
	jb	.L172	#,
.LBE59:
# src/deep.c:580:     gradients->grads = calloc(gradients->size_grads, sizeof(float));
	.loc 1 580 24
	movq	-40(%rbp), %rax	# gradients, tmp168
	movq	8(%rax), %rax	# gradients_78(D)->size_grads, _32
	movl	$4, %esi	#,
	movq	%rax, %rdi	# _32,
	call	calloc@PLT	#
	movq	%rax, %rdx	# tmp169, _33
# src/deep.c:580:     gradients->grads = calloc(gradients->size_grads, sizeof(float));
	.loc 1 580 22
	movq	-40(%rbp), %rax	# gradients, tmp170
	movq	%rdx, (%rax)	# _33, gradients_78(D)->grads
.LBB60:
# src/deep.c:584:     for (size_t idx_layer = 0; idx_layer < model->size_layers; idx_layer++) {
	.loc 1 584 17
	movq	$0, -16(%rbp)	#, idx_layer
# src/deep.c:584:     for (size_t idx_layer = 0; idx_layer < model->size_layers; idx_layer++) {
	.loc 1 584 5
	jmp	.L173	#
.L178:
.LBB61:
# src/deep.c:585:         Layer *layer = model->layers[idx_layer];
	.loc 1 585 29
	movq	-48(%rbp), %rax	# model, tmp171
	movq	(%rax), %rax	# model_77(D)->layers, _34
# src/deep.c:585:         Layer *layer = model->layers[idx_layer];
	.loc 1 585 37
	movq	-16(%rbp), %rdx	# idx_layer, tmp172
	salq	$3, %rdx	#, _35
	addq	%rdx, %rax	# _35, _36
# src/deep.c:585:         Layer *layer = model->layers[idx_layer];
	.loc 1 585 16
	movq	(%rax), %rax	# *_36, tmp173
	movq	%rax, -8(%rbp)	# tmp173, layer
# src/deep.c:586:         layer->gradients_input = idx_layer == 0 ? NULL : model->layers[idx_layer - 1]->gradients_output;
	.loc 1 586 56
	cmpq	$0, -16(%rbp)	#, idx_layer
	je	.L174	#,
# src/deep.c:586:         layer->gradients_input = idx_layer == 0 ? NULL : model->layers[idx_layer - 1]->gradients_output;
	.loc 1 586 63 discriminator 1
	movq	-48(%rbp), %rax	# model, tmp174
	movq	(%rax), %rax	# model_77(D)->layers, _37
# src/deep.c:586:         layer->gradients_input = idx_layer == 0 ? NULL : model->layers[idx_layer - 1]->gradients_output;
	.loc 1 586 71 discriminator 1
	movq	-16(%rbp), %rdx	# idx_layer, tmp175
	salq	$3, %rdx	#, _38
	subq	$8, %rdx	#, _39
	addq	%rdx, %rax	# _39, _40
	movq	(%rax), %rax	# *_40, _41
# src/deep.c:586:         layer->gradients_input = idx_layer == 0 ? NULL : model->layers[idx_layer - 1]->gradients_output;
	.loc 1 586 56 discriminator 1
	movq	40(%rax), %rax	# _41->gradients_output, iftmp.3_71
	jmp	.L175	#
.L174:
# src/deep.c:586:         layer->gradients_input = idx_layer == 0 ? NULL : model->layers[idx_layer - 1]->gradients_output;
	.loc 1 586 56 is_stmt 0 discriminator 2
	movl	$0, %eax	#, iftmp.3_71
.L175:
# src/deep.c:586:         layer->gradients_input = idx_layer == 0 ? NULL : model->layers[idx_layer - 1]->gradients_output;
	.loc 1 586 32 is_stmt 1 discriminator 4
	movq	-8(%rbp), %rdx	# layer, tmp176
	movq	%rax, 32(%rdx)	# iftmp.3_71, layer_82->gradients_input
# src/deep.c:589:         : model->layers[idx_layer -1]->gradients_output + model->layers[idx_layer -1]->size_neurons * data->nImages;
	.loc 1 589 9 discriminator 4
	cmpq	$0, -16(%rbp)	#, idx_layer
	jne	.L176	#,
# src/deep.c:589:         : model->layers[idx_layer -1]->gradients_output + model->layers[idx_layer -1]->size_neurons * data->nImages;
	.loc 1 589 9 is_stmt 0 discriminator 1
	movq	-40(%rbp), %rax	# gradients, tmp177
	movq	(%rax), %rax	# gradients_78(D)->grads, iftmp.4_72
	jmp	.L177	#
.L176:
# src/deep.c:589:         : model->layers[idx_layer -1]->gradients_output + model->layers[idx_layer -1]->size_neurons * data->nImages;
	.loc 1 589 16 is_stmt 1 discriminator 2
	movq	-48(%rbp), %rax	# model, tmp178
	movq	(%rax), %rax	# model_77(D)->layers, _42
# src/deep.c:589:         : model->layers[idx_layer -1]->gradients_output + model->layers[idx_layer -1]->size_neurons * data->nImages;
	.loc 1 589 24 discriminator 2
	movq	-16(%rbp), %rdx	# idx_layer, tmp179
	salq	$3, %rdx	#, _43
	subq	$8, %rdx	#, _44
	addq	%rdx, %rax	# _44, _45
	movq	(%rax), %rax	# *_45, _46
# src/deep.c:589:         : model->layers[idx_layer -1]->gradients_output + model->layers[idx_layer -1]->size_neurons * data->nImages;
	.loc 1 589 38 discriminator 2
	movq	40(%rax), %rdx	# _46->gradients_output, _47
# src/deep.c:589:         : model->layers[idx_layer -1]->gradients_output + model->layers[idx_layer -1]->size_neurons * data->nImages;
	.loc 1 589 64 discriminator 2
	movq	-48(%rbp), %rax	# model, tmp180
	movq	(%rax), %rax	# model_77(D)->layers, _48
# src/deep.c:589:         : model->layers[idx_layer -1]->gradients_output + model->layers[idx_layer -1]->size_neurons * data->nImages;
	.loc 1 589 72 discriminator 2
	movq	-16(%rbp), %rcx	# idx_layer, tmp181
	salq	$3, %rcx	#, _49
	subq	$8, %rcx	#, _50
	addq	%rcx, %rax	# _50, _51
	movq	(%rax), %rax	# *_51, _52
# src/deep.c:589:         : model->layers[idx_layer -1]->gradients_output + model->layers[idx_layer -1]->size_neurons * data->nImages;
	.loc 1 589 86 discriminator 2
	movq	72(%rax), %rcx	# _52->size_neurons, _53
# src/deep.c:589:         : model->layers[idx_layer -1]->gradients_output + model->layers[idx_layer -1]->size_neurons * data->nImages;
	.loc 1 589 107 discriminator 2
	movq	-56(%rbp), %rax	# data, tmp182
	movl	16(%rax), %eax	# data_86(D)->nImages, _54
	cltq
# src/deep.c:589:         : model->layers[idx_layer -1]->gradients_output + model->layers[idx_layer -1]->size_neurons * data->nImages;
	.loc 1 589 101 discriminator 2
	imulq	%rcx, %rax	# _53, _56
# src/deep.c:589:         : model->layers[idx_layer -1]->gradients_output + model->layers[idx_layer -1]->size_neurons * data->nImages;
	.loc 1 589 57 discriminator 2
	salq	$2, %rax	#, _57
# src/deep.c:589:         : model->layers[idx_layer -1]->gradients_output + model->layers[idx_layer -1]->size_neurons * data->nImages;
	.loc 1 589 9 discriminator 2
	addq	%rdx, %rax	# _47, iftmp.4_72
.L177:
# src/deep.c:588:         layer->gradients_biases = idx_layer == 0 ? gradients->grads 
	.loc 1 588 33 discriminator 2
	movq	-8(%rbp), %rdx	# layer, tmp183
	movq	%rax, 56(%rdx)	# iftmp.4_72, layer_82->gradients_biases
# src/deep.c:591:         layer->gradients_weights =  layer->gradients_biases + layer->size_neurons;
	.loc 1 591 42 discriminator 2
	movq	-8(%rbp), %rax	# layer, tmp184
	movq	56(%rax), %rdx	# layer_82->gradients_biases, _58
# src/deep.c:591:         layer->gradients_weights =  layer->gradients_biases + layer->size_neurons;
	.loc 1 591 68 discriminator 2
	movq	-8(%rbp), %rax	# layer, tmp185
	movq	72(%rax), %rax	# layer_82->size_neurons, _59
# src/deep.c:591:         layer->gradients_weights =  layer->gradients_biases + layer->size_neurons;
	.loc 1 591 61 discriminator 2
	salq	$2, %rax	#, _60
	addq	%rax, %rdx	# _60, _61
# src/deep.c:591:         layer->gradients_weights =  layer->gradients_biases + layer->size_neurons;
	.loc 1 591 34 discriminator 2
	movq	-8(%rbp), %rax	# layer, tmp186
	movq	%rdx, 48(%rax)	# _61, layer_82->gradients_weights
# src/deep.c:593:         layer->gradients_output = layer->gradients_weights + layer->size_inputs * layer->size_neurons;
	.loc 1 593 40 discriminator 2
	movq	-8(%rbp), %rax	# layer, tmp187
	movq	48(%rax), %rdx	# layer_82->gradients_weights, _62
# src/deep.c:593:         layer->gradients_output = layer->gradients_weights + layer->size_inputs * layer->size_neurons;
	.loc 1 593 67 discriminator 2
	movq	-8(%rbp), %rax	# layer, tmp188
	movq	64(%rax), %rcx	# layer_82->size_inputs, _63
# src/deep.c:593:         layer->gradients_output = layer->gradients_weights + layer->size_inputs * layer->size_neurons;
	.loc 1 593 88 discriminator 2
	movq	-8(%rbp), %rax	# layer, tmp189
	movq	72(%rax), %rax	# layer_82->size_neurons, _64
# src/deep.c:593:         layer->gradients_output = layer->gradients_weights + layer->size_inputs * layer->size_neurons;
	.loc 1 593 81 discriminator 2
	imulq	%rcx, %rax	# _63, _65
# src/deep.c:593:         layer->gradients_output = layer->gradients_weights + layer->size_inputs * layer->size_neurons;
	.loc 1 593 60 discriminator 2
	salq	$2, %rax	#, _66
	addq	%rax, %rdx	# _66, _67
# src/deep.c:593:         layer->gradients_output = layer->gradients_weights + layer->size_inputs * layer->size_neurons;
	.loc 1 593 33 discriminator 2
	movq	-8(%rbp), %rax	# layer, tmp190
	movq	%rdx, 40(%rax)	# _67, layer_82->gradients_output
.LBE61:
# src/deep.c:584:     for (size_t idx_layer = 0; idx_layer < model->size_layers; idx_layer++) {
	.loc 1 584 73 discriminator 2
	addq	$1, -16(%rbp)	#, idx_layer
.L173:
# src/deep.c:584:     for (size_t idx_layer = 0; idx_layer < model->size_layers; idx_layer++) {
	.loc 1 584 49 discriminator 1
	movq	-48(%rbp), %rax	# model, tmp191
	movq	8(%rax), %rax	# model_77(D)->size_layers, _68
# src/deep.c:584:     for (size_t idx_layer = 0; idx_layer < model->size_layers; idx_layer++) {
	.loc 1 584 5 discriminator 1
	cmpq	%rax, -16(%rbp)	# _68, idx_layer
	jb	.L178	#,
.LBE60:
# src/deep.c:595: }
	.loc 1 595 1
	nop	
	nop	
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE40:
	.size	initialise_gradients, .-initialise_gradients
	.globl	free_gradients
	.type	free_gradients, @function
free_gradients:
.LFB41:
	.loc 1 598 1
	.cfi_startproc
	endbr64	
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$16, %rsp	#,
	movq	%rdi, -8(%rbp)	# gradients, gradients
# src/deep.c:599:     free(gradients->grads);
	.loc 1 599 19
	movq	-8(%rbp), %rax	# gradients, tmp83
	movq	(%rax), %rax	# gradients_3(D)->grads, _1
# src/deep.c:599:     free(gradients->grads);
	.loc 1 599 5
	movq	%rax, %rdi	# _1,
	call	free@PLT	#
# src/deep.c:600: }
	.loc 1 600 1
	nop	
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE41:
	.size	free_gradients, .-free_gradients
	.globl	allocate_mini_batch_memory
	.type	allocate_mini_batch_memory, @function
allocate_mini_batch_memory:
.LFB42:
	.loc 1 603 1
	.cfi_startproc
	endbr64	
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$16, %rsp	#,
	movq	%rdi, -8(%rbp)	# mini_batch_data, mini_batch_data
# src/deep.c:604:     mini_batch_data->images = calloc(mini_batch_data->nImages * mini_batch_data->rows * mini_batch_data->cols, sizeof(unsigned char));
	.loc 1 604 53
	movq	-8(%rbp), %rax	# mini_batch_data, tmp92
	movl	16(%rax), %edx	# mini_batch_data_12(D)->nImages, _1
# src/deep.c:604:     mini_batch_data->images = calloc(mini_batch_data->nImages * mini_batch_data->rows * mini_batch_data->cols, sizeof(unsigned char));
	.loc 1 604 80
	movq	-8(%rbp), %rax	# mini_batch_data, tmp93
	movl	20(%rax), %eax	# mini_batch_data_12(D)->rows, _2
# src/deep.c:604:     mini_batch_data->images = calloc(mini_batch_data->nImages * mini_batch_data->rows * mini_batch_data->cols, sizeof(unsigned char));
	.loc 1 604 63
	imull	%eax, %edx	# _2, _3
# src/deep.c:604:     mini_batch_data->images = calloc(mini_batch_data->nImages * mini_batch_data->rows * mini_batch_data->cols, sizeof(unsigned char));
	.loc 1 604 104
	movq	-8(%rbp), %rax	# mini_batch_data, tmp94
	movl	24(%rax), %eax	# mini_batch_data_12(D)->cols, _4
# src/deep.c:604:     mini_batch_data->images = calloc(mini_batch_data->nImages * mini_batch_data->rows * mini_batch_data->cols, sizeof(unsigned char));
	.loc 1 604 87
	imull	%edx, %eax	# _3, _5
# src/deep.c:604:     mini_batch_data->images = calloc(mini_batch_data->nImages * mini_batch_data->rows * mini_batch_data->cols, sizeof(unsigned char));
	.loc 1 604 31
	cltq
	movl	$1, %esi	#,
	movq	%rax, %rdi	# _6,
	call	calloc@PLT	#
	movq	%rax, %rdx	# tmp95, _7
# src/deep.c:604:     mini_batch_data->images = calloc(mini_batch_data->nImages * mini_batch_data->rows * mini_batch_data->cols, sizeof(unsigned char));
	.loc 1 604 29
	movq	-8(%rbp), %rax	# mini_batch_data, tmp96
	movq	%rdx, (%rax)	# _7, mini_batch_data_12(D)->images
# src/deep.c:605:     mini_batch_data->labels = calloc(mini_batch_data->nImages, sizeof(unsigned char));
	.loc 1 605 53
	movq	-8(%rbp), %rax	# mini_batch_data, tmp97
	movl	16(%rax), %eax	# mini_batch_data_12(D)->nImages, _8
# src/deep.c:605:     mini_batch_data->labels = calloc(mini_batch_data->nImages, sizeof(unsigned char));
	.loc 1 605 31
	cltq
	movl	$1, %esi	#,
	movq	%rax, %rdi	# _9,
	call	calloc@PLT	#
	movq	%rax, %rdx	# tmp98, _10
# src/deep.c:605:     mini_batch_data->labels = calloc(mini_batch_data->nImages, sizeof(unsigned char));
	.loc 1 605 29
	movq	-8(%rbp), %rax	# mini_batch_data, tmp99
	movq	%rdx, 8(%rax)	# _10, mini_batch_data_12(D)->labels
# src/deep.c:606: }
	.loc 1 606 1
	nop	
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE42:
	.size	allocate_mini_batch_memory, .-allocate_mini_batch_memory
	.globl	free_mini_batch_memory
	.type	free_mini_batch_memory, @function
free_mini_batch_memory:
.LFB43:
	.loc 1 609 1
	.cfi_startproc
	endbr64	
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$16, %rsp	#,
	movq	%rdi, -8(%rbp)	# mini_batch_data, mini_batch_data
# src/deep.c:610:     free(mini_batch_data->images);
	.loc 1 610 25
	movq	-8(%rbp), %rax	# mini_batch_data, tmp84
	movq	(%rax), %rax	# mini_batch_data_4(D)->images, _1
# src/deep.c:610:     free(mini_batch_data->images);
	.loc 1 610 5
	movq	%rax, %rdi	# _1,
	call	free@PLT	#
# src/deep.c:611:     free(mini_batch_data->labels);
	.loc 1 611 25
	movq	-8(%rbp), %rax	# mini_batch_data, tmp85
	movq	8(%rax), %rax	# mini_batch_data_4(D)->labels, _2
# src/deep.c:611:     free(mini_batch_data->labels);
	.loc 1 611 5
	movq	%rax, %rdi	# _2,
	call	free@PLT	#
# src/deep.c:612: }
	.loc 1 612 1
	nop	
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE43:
	.size	free_mini_batch_memory, .-free_mini_batch_memory
	.globl	initialise_mini_batch
	.type	initialise_mini_batch, @function
initialise_mini_batch:
.LFB44:
	.loc 1 614 83
	.cfi_startproc
	endbr64	
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$32, %rsp	#,
	movq	%rdi, -24(%rbp)	# training_data, training_data
	movq	%rsi, -32(%rbp)	# mini_batch_data, mini_batch_data
.LBB62:
# src/deep.c:615:     for (size_t idx_mini_batch_image = 0; idx_mini_batch_image < mini_batch_data->nImages; idx_mini_batch_image++) {
	.loc 1 615 17
	movq	$0, -16(%rbp)	#, idx_mini_batch_image
# src/deep.c:615:     for (size_t idx_mini_batch_image = 0; idx_mini_batch_image < mini_batch_data->nImages; idx_mini_batch_image++) {
	.loc 1 615 5
	jmp	.L183	#
.L184:
.LBB63:
# src/deep.c:616:         size_t idx_training_image = rand() % training_data->nImages;
	.loc 1 616 37 discriminator 3
	call	rand@PLT	#
# src/deep.c:616:         size_t idx_training_image = rand() % training_data->nImages;
	.loc 1 616 59 discriminator 3
	movq	-24(%rbp), %rdx	# training_data, tmp97
	movl	16(%rdx), %ecx	# training_data_22(D)->nImages, _2
# src/deep.c:616:         size_t idx_training_image = rand() % training_data->nImages;
	.loc 1 616 44 discriminator 3
	cltd
	idivl	%ecx	# _2
	movl	%edx, %eax	# tmp98, _3
# src/deep.c:616:         size_t idx_training_image = rand() % training_data->nImages;
	.loc 1 616 16 discriminator 3
	cltq
	movq	%rax, -8(%rbp)	# tmp100, idx_training_image
# src/deep.c:617:         mini_batch_data->images[idx_mini_batch_image] = training_data->images[idx_training_image];
	.loc 1 617 70 discriminator 3
	movq	-24(%rbp), %rax	# training_data, tmp101
	movq	(%rax), %rdx	# training_data_22(D)->images, _4
# src/deep.c:617:         mini_batch_data->images[idx_mini_batch_image] = training_data->images[idx_training_image];
	.loc 1 617 78 discriminator 3
	movq	-8(%rbp), %rax	# idx_training_image, tmp102
	leaq	(%rdx,%rax), %rcx	#, _5
# src/deep.c:617:         mini_batch_data->images[idx_mini_batch_image] = training_data->images[idx_training_image];
	.loc 1 617 24 discriminator 3
	movq	-32(%rbp), %rax	# mini_batch_data, tmp103
	movq	(%rax), %rdx	# mini_batch_data_20(D)->images, _6
# src/deep.c:617:         mini_batch_data->images[idx_mini_batch_image] = training_data->images[idx_training_image];
	.loc 1 617 32 discriminator 3
	movq	-16(%rbp), %rax	# idx_mini_batch_image, tmp104
	addq	%rax, %rdx	# tmp104, _7
# src/deep.c:617:         mini_batch_data->images[idx_mini_batch_image] = training_data->images[idx_training_image];
	.loc 1 617 78 discriminator 3
	movzbl	(%rcx), %eax	# *_5, _8
# src/deep.c:617:         mini_batch_data->images[idx_mini_batch_image] = training_data->images[idx_training_image];
	.loc 1 617 55 discriminator 3
	movb	%al, (%rdx)	# _8, *_7
# src/deep.c:618:         mini_batch_data->labels[idx_mini_batch_image] = training_data->labels[idx_training_image];
	.loc 1 618 70 discriminator 3
	movq	-24(%rbp), %rax	# training_data, tmp105
	movq	8(%rax), %rdx	# training_data_22(D)->labels, _9
# src/deep.c:618:         mini_batch_data->labels[idx_mini_batch_image] = training_data->labels[idx_training_image];
	.loc 1 618 78 discriminator 3
	movq	-8(%rbp), %rax	# idx_training_image, tmp106
	leaq	(%rdx,%rax), %rcx	#, _10
# src/deep.c:618:         mini_batch_data->labels[idx_mini_batch_image] = training_data->labels[idx_training_image];
	.loc 1 618 24 discriminator 3
	movq	-32(%rbp), %rax	# mini_batch_data, tmp107
	movq	8(%rax), %rdx	# mini_batch_data_20(D)->labels, _11
# src/deep.c:618:         mini_batch_data->labels[idx_mini_batch_image] = training_data->labels[idx_training_image];
	.loc 1 618 32 discriminator 3
	movq	-16(%rbp), %rax	# idx_mini_batch_image, tmp108
	addq	%rax, %rdx	# tmp108, _12
# src/deep.c:618:         mini_batch_data->labels[idx_mini_batch_image] = training_data->labels[idx_training_image];
	.loc 1 618 78 discriminator 3
	movzbl	(%rcx), %eax	# *_10, _13
# src/deep.c:618:         mini_batch_data->labels[idx_mini_batch_image] = training_data->labels[idx_training_image];
	.loc 1 618 55 discriminator 3
	movb	%al, (%rdx)	# _13, *_12
.LBE63:
# src/deep.c:615:     for (size_t idx_mini_batch_image = 0; idx_mini_batch_image < mini_batch_data->nImages; idx_mini_batch_image++) {
	.loc 1 615 112 discriminator 3
	addq	$1, -16(%rbp)	#, idx_mini_batch_image
.L183:
# src/deep.c:615:     for (size_t idx_mini_batch_image = 0; idx_mini_batch_image < mini_batch_data->nImages; idx_mini_batch_image++) {
	.loc 1 615 81 discriminator 1
	movq	-32(%rbp), %rax	# mini_batch_data, tmp109
	movl	16(%rax), %eax	# mini_batch_data_20(D)->nImages, _14
	cltq
# src/deep.c:615:     for (size_t idx_mini_batch_image = 0; idx_mini_batch_image < mini_batch_data->nImages; idx_mini_batch_image++) {
	.loc 1 615 5 discriminator 1
	cmpq	%rax, -16(%rbp)	# _15, idx_mini_batch_image
	jb	.L184	#,
.LBE62:
# src/deep.c:620: }
	.loc 1 620 1
	nop	
	nop	
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE44:
	.size	initialise_mini_batch, .-initialise_mini_batch
	.globl	free_model
	.type	free_model, @function
free_model:
.LFB45:
	.loc 1 622 31
	.cfi_startproc
	endbr64	
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$32, %rsp	#,
	movq	%rdi, -24(%rbp)	# model, model
# src/deep.c:623:     free(model->layers[0]->weights);
	.loc 1 623 15
	movq	-24(%rbp), %rax	# model, tmp91
	movq	(%rax), %rax	# model_13(D)->layers, _1
# src/deep.c:623:     free(model->layers[0]->weights);
	.loc 1 623 23
	movq	(%rax), %rax	# *_1, _2
# src/deep.c:623:     free(model->layers[0]->weights);
	.loc 1 623 26
	movq	(%rax), %rax	# _2->weights, _3
# src/deep.c:623:     free(model->layers[0]->weights);
	.loc 1 623 5
	movq	%rax, %rdi	# _3,
	call	free@PLT	#
.LBB64:
# src/deep.c:624:     for (size_t idx_layer = 0; idx_layer < model->size_layers; idx_layer++)
	.loc 1 624 17
	movq	$0, -8(%rbp)	#, idx_layer
# src/deep.c:624:     for (size_t idx_layer = 0; idx_layer < model->size_layers; idx_layer++)
	.loc 1 624 5
	jmp	.L186	#
.L187:
# src/deep.c:626:         free(model->layers[idx_layer]);
	.loc 1 626 19 discriminator 3
	movq	-24(%rbp), %rax	# model, tmp92
	movq	(%rax), %rax	# model_13(D)->layers, _4
# src/deep.c:626:         free(model->layers[idx_layer]);
	.loc 1 626 27 discriminator 3
	movq	-8(%rbp), %rdx	# idx_layer, tmp93
	salq	$3, %rdx	#, _5
	addq	%rdx, %rax	# _5, _6
# src/deep.c:626:         free(model->layers[idx_layer]);
	.loc 1 626 9 discriminator 3
	movq	(%rax), %rax	# *_6, _7
	movq	%rax, %rdi	# _7,
	call	free@PLT	#
# src/deep.c:624:     for (size_t idx_layer = 0; idx_layer < model->size_layers; idx_layer++)
	.loc 1 624 73 discriminator 3
	addq	$1, -8(%rbp)	#, idx_layer
.L186:
# src/deep.c:624:     for (size_t idx_layer = 0; idx_layer < model->size_layers; idx_layer++)
	.loc 1 624 49 discriminator 1
	movq	-24(%rbp), %rax	# model, tmp94
	movq	8(%rax), %rax	# model_13(D)->size_layers, _8
# src/deep.c:624:     for (size_t idx_layer = 0; idx_layer < model->size_layers; idx_layer++)
	.loc 1 624 5 discriminator 1
	cmpq	%rax, -8(%rbp)	# _8, idx_layer
	jb	.L187	#,
.LBE64:
# src/deep.c:628:     free(model->layers);
	.loc 1 628 15
	movq	-24(%rbp), %rax	# model, tmp95
	movq	(%rax), %rax	# model_13(D)->layers, _9
# src/deep.c:628:     free(model->layers);
	.loc 1 628 5
	movq	%rax, %rdi	# _9,
	call	free@PLT	#
# src/deep.c:629: }
	.loc 1 629 1
	nop	
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE45:
	.size	free_model, .-free_model
	.section	.rodata
.LC29:
	.string	"DATA_PATH"
.LC30:
	.string	"/train-images.idx3-ubyte"
.LC31:
	.string	"/train-labels.idx1-ubyte"
	.align 8
.LC32:
	.string	"Number of training images: %d\n"
.LC33:
	.string	"/t10k-images.idx3-ubyte"
.LC34:
	.string	"/t10k-labels.idx1-ubyte"
.LC35:
	.string	"Number of test images: %d\n"
.LC36:
	.string	"Number of parameters: %zu\n"
.LC37:
	.string	"../models"
	.align 8
.LC38:
	.string	"No model found, training from scratch"
.LC39:
	.string	"Model loaded successfully"
	.align 8
.LC40:
	.string	"Test loss before training: %f\n"
	.align 8
.LC41:
	.string	"Test accuracy before training: %f\n"
.LC42:
	.string	"\nepoch: %zu\n"
.LC43:
	.string	"Training loss: %f\n"
.LC44:
	.string	"Training accuracy: %f\n"
.LC45:
	.string	"models/model"
.LC46:
	.string	"Test loss after training: %f\n"
	.align 8
.LC47:
	.string	"Test accuracy after training: %f\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB46:
	.loc 1 632 12
	.cfi_startproc
	endbr64	
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$224, %rsp	#,
# src/deep.c:632: int main() {
	.loc 1 632 12
	movq	%fs:40, %rax	# MEM[(<address-space-1> long unsigned int *)40B], tmp204
	movq	%rax, -8(%rbp)	# tmp204, D.5564
	xorl	%eax, %eax	# tmp204
# src/deep.c:634:     InputData data_training, data_test, data_mini_batch = {0};
	.loc 1 634 41
	movq	$0, -48(%rbp)	#, data_mini_batch
	movq	$0, -40(%rbp)	#, data_mini_batch
	movq	$0, -32(%rbp)	#, data_mini_batch
	movq	$0, -24(%rbp)	#, data_mini_batch
# src/deep.c:636:     const char * data_path = getenv("DATA_PATH");
	.loc 1 636 30
	leaq	.LC29(%rip), %rdi	#,
	call	getenv@PLT	#
	movq	%rax, -216(%rbp)	# tmp114, data_path
# src/deep.c:638:     const char * training_images_path = concatStrings(data_path, "/train-images.idx3-ubyte");
	.loc 1 638 41
	movq	-216(%rbp), %rax	# data_path, tmp115
	leaq	.LC30(%rip), %rsi	#,
	movq	%rax, %rdi	# tmp115,
	call	concatStrings	#
	movq	%rax, -208(%rbp)	# tmp116, training_images_path
# src/deep.c:639:     const char *training_labels_path = concatStrings(data_path, "/train-labels.idx1-ubyte");
	.loc 1 639 40
	movq	-216(%rbp), %rax	# data_path, tmp117
	leaq	.LC31(%rip), %rsi	#,
	movq	%rax, %rdi	# tmp117,
	call	concatStrings	#
	movq	%rax, -200(%rbp)	# tmp118, training_labels_path
# src/deep.c:640:     read_mnist_images(training_images_path, &data_training);
	.loc 1 640 5
	leaq	-112(%rbp), %rdx	#, tmp119
	movq	-208(%rbp), %rax	# training_images_path, tmp120
	movq	%rdx, %rsi	# tmp119,
	movq	%rax, %rdi	# tmp120,
	call	read_mnist_images	#
# src/deep.c:641:     read_mnist_labels(training_labels_path, &data_training.labels, &data_training.nImages);
	.loc 1 641 5
	leaq	-112(%rbp), %rax	#, tmp121
	leaq	16(%rax), %rdx	#, tmp122
	leaq	-112(%rbp), %rax	#, tmp123
	leaq	8(%rax), %rcx	#, tmp124
	movq	-200(%rbp), %rax	# training_labels_path, tmp125
	movq	%rcx, %rsi	# tmp124,
	movq	%rax, %rdi	# tmp125,
	call	read_mnist_labels	#
# src/deep.c:642:     printf("Number of training images: %d\n", data_training.nImages);
	.loc 1 642 5
	movl	-96(%rbp), %eax	# data_training.nImages, _1
	movl	%eax, %esi	# _1,
	leaq	.LC32(%rip), %rdi	#,
	movl	$0, %eax	#,
	call	printf@PLT	#
# src/deep.c:644:     free((char *)training_images_path);
	.loc 1 644 5
	movq	-208(%rbp), %rax	# training_images_path, tmp126
	movq	%rax, %rdi	# tmp126,
	call	free@PLT	#
# src/deep.c:645:     free((char *)training_labels_path);
	.loc 1 645 5
	movq	-200(%rbp), %rax	# training_labels_path, tmp127
	movq	%rax, %rdi	# tmp127,
	call	free@PLT	#
# src/deep.c:647:     const char *test_images_path = concatStrings(data_path, "/t10k-images.idx3-ubyte");
	.loc 1 647 36
	movq	-216(%rbp), %rax	# data_path, tmp128
	leaq	.LC33(%rip), %rsi	#,
	movq	%rax, %rdi	# tmp128,
	call	concatStrings	#
	movq	%rax, -192(%rbp)	# tmp129, test_images_path
# src/deep.c:648:     const char *test_labels_path = concatStrings(data_path, "/t10k-labels.idx1-ubyte");
	.loc 1 648 36
	movq	-216(%rbp), %rax	# data_path, tmp130
	leaq	.LC34(%rip), %rsi	#,
	movq	%rax, %rdi	# tmp130,
	call	concatStrings	#
	movq	%rax, -184(%rbp)	# tmp131, test_labels_path
# src/deep.c:649:     read_mnist_images(test_images_path, &data_test);
	.loc 1 649 5
	leaq	-80(%rbp), %rdx	#, tmp132
	movq	-192(%rbp), %rax	# test_images_path, tmp133
	movq	%rdx, %rsi	# tmp132,
	movq	%rax, %rdi	# tmp133,
	call	read_mnist_images	#
# src/deep.c:650:     read_mnist_labels(test_labels_path, &data_test.labels, &data_test.nImages);
	.loc 1 650 5
	leaq	-80(%rbp), %rax	#, tmp134
	leaq	16(%rax), %rdx	#, tmp135
	leaq	-80(%rbp), %rax	#, tmp136
	leaq	8(%rax), %rcx	#, tmp137
	movq	-184(%rbp), %rax	# test_labels_path, tmp138
	movq	%rcx, %rsi	# tmp137,
	movq	%rax, %rdi	# tmp138,
	call	read_mnist_labels	#
# src/deep.c:651:     printf("Number of test images: %d\n", data_test.nImages);
	.loc 1 651 5
	movl	-64(%rbp), %eax	# data_test.nImages, _2
	movl	%eax, %esi	# _2,
	leaq	.LC35(%rip), %rdi	#,
	movl	$0, %eax	#,
	call	printf@PLT	#
# src/deep.c:653:     free((char *)test_images_path);
	.loc 1 653 5
	movq	-192(%rbp), %rax	# test_images_path, tmp139
	movq	%rax, %rdi	# tmp139,
	call	free@PLT	#
# src/deep.c:654:     free((char *)test_labels_path);
	.loc 1 654 5
	movq	-184(%rbp), %rax	# test_labels_path, tmp140
	movq	%rax, %rdi	# tmp140,
	call	free@PLT	#
# src/deep.c:657:     Model model = {0};
	.loc 1 657 11
	movq	$0, -144(%rbp)	#, model
	movq	$0, -136(%rbp)	#, model
	movq	$0, -128(%rbp)	#, model
# src/deep.c:660:     add_layer(&model, data_test.cols * data_test.rows, SIZE_HIDDEN, relu_forward, relu_backward, generate_kaiming_number);
	.loc 1 660 32
	movl	-56(%rbp), %edx	# data_test.cols, _3
# src/deep.c:660:     add_layer(&model, data_test.cols * data_test.rows, SIZE_HIDDEN, relu_forward, relu_backward, generate_kaiming_number);
	.loc 1 660 49
	movl	-60(%rbp), %eax	# data_test.rows, _4
# src/deep.c:660:     add_layer(&model, data_test.cols * data_test.rows, SIZE_HIDDEN, relu_forward, relu_backward, generate_kaiming_number);
	.loc 1 660 38
	imull	%edx, %eax	# _3, _5
# src/deep.c:660:     add_layer(&model, data_test.cols * data_test.rows, SIZE_HIDDEN, relu_forward, relu_backward, generate_kaiming_number);
	.loc 1 660 5
	movslq	%eax, %rsi	# _5, _6
	leaq	-144(%rbp), %rax	#, tmp141
	leaq	generate_kaiming_number(%rip), %r9	#,
	leaq	relu_backward(%rip), %r8	#,
	leaq	relu_forward(%rip), %rcx	#,
	movl	$32, %edx	#,
	movq	%rax, %rdi	# tmp141,
	call	add_layer	#
# src/deep.c:661:     add_layer(&model, SIZE_HIDDEN, SIZE_OUTPUT, softmax_forward, loss_softmax_backward, generate_xavier_number);
	.loc 1 661 5
	leaq	-144(%rbp), %rax	#, tmp142
	leaq	generate_xavier_number(%rip), %r9	#,
	leaq	loss_softmax_backward(%rip), %r8	#,
	leaq	softmax_forward(%rip), %rcx	#,
	movl	$10, %edx	#,
	movl	$32, %esi	#,
	movq	%rax, %rdi	# tmp142,
	call	add_layer	#
# src/deep.c:663:     printf("Number of parameters: %zu\n", model.size_parameters);
	.loc 1 663 5
	movq	-128(%rbp), %rax	# model.size_parameters, _7
	movq	%rax, %rsi	# _7,
	leaq	.LC36(%rip), %rdi	#,
	movl	$0, %eax	#,
	call	printf@PLT	#
# src/deep.c:665:     allocate_parameters_memory(&model);
	.loc 1 665 5
	leaq	-144(%rbp), %rax	#, tmp143
	movq	%rax, %rdi	# tmp143,
	call	allocate_parameters_memory	#
# src/deep.c:667:     if (load_model(&model, "../models") == 0) {
	.loc 1 667 9
	leaq	-144(%rbp), %rax	#, tmp144
	leaq	.LC37(%rip), %rsi	#,
	movq	%rax, %rdi	# tmp144,
	call	load_model	#
# src/deep.c:667:     if (load_model(&model, "../models") == 0) {
	.loc 1 667 8
	testl	%eax, %eax	# _8
	jne	.L189	#,
# src/deep.c:669:         printf("No model found, training from scratch\n");
	.loc 1 669 9
	leaq	.LC38(%rip), %rdi	#,
	call	puts@PLT	#
	jmp	.L190	#
.L189:
# src/deep.c:671:         printf("Model loaded successfully\n");
	.loc 1 671 9
	leaq	.LC39(%rip), %rdi	#,
	call	puts@PLT	#
.L190:
# src/deep.c:674:     Activations activations = {0};
	.loc 1 674 17
	movq	$0, -176(%rbp)	#, activations
	movq	$0, -168(%rbp)	#, activations
# src/deep.c:675:     initialise_activations(&activations, &model, &data_test);
	.loc 1 675 5
	leaq	-80(%rbp), %rdx	#, tmp145
	leaq	-144(%rbp), %rcx	#, tmp146
	leaq	-176(%rbp), %rax	#, tmp147
	movq	%rcx, %rsi	# tmp146,
	movq	%rax, %rdi	# tmp147,
	call	initialise_activations	#
# src/deep.c:676:     model_forward(&model, &activations, &data_test);
	.loc 1 676 5
	leaq	-80(%rbp), %rdx	#, tmp148
	leaq	-176(%rbp), %rcx	#, tmp149
	leaq	-144(%rbp), %rax	#, tmp150
	movq	%rcx, %rsi	# tmp149,
	movq	%rax, %rdi	# tmp150,
	call	model_forward	#
# src/deep.c:677:     printf("Test loss before training: %f\n", get_loss(&model, &activations, &data_test));
	.loc 1 677 47
	leaq	-80(%rbp), %rdx	#, tmp151
	leaq	-176(%rbp), %rcx	#, tmp152
	leaq	-144(%rbp), %rax	#, tmp153
	movq	%rcx, %rsi	# tmp152,
	movq	%rax, %rdi	# tmp153,
	call	get_loss	#
# src/deep.c:677:     printf("Test loss before training: %f\n", get_loss(&model, &activations, &data_test));
	.loc 1 677 5
	cvtss2sd	%xmm0, %xmm0	# _9, _10
	leaq	.LC40(%rip), %rdi	#,
	movl	$1, %eax	#,
	call	printf@PLT	#
# src/deep.c:678:     printf("Test accuracy before training: %f\n", get_accuracy(&model, &activations, &data_test));
	.loc 1 678 51
	leaq	-80(%rbp), %rdx	#, tmp154
	leaq	-176(%rbp), %rcx	#, tmp155
	leaq	-144(%rbp), %rax	#, tmp156
	movq	%rcx, %rsi	# tmp155,
	movq	%rax, %rdi	# tmp156,
	call	get_accuracy	#
# src/deep.c:678:     printf("Test accuracy before training: %f\n", get_accuracy(&model, &activations, &data_test));
	.loc 1 678 5
	cvtss2sd	%xmm0, %xmm0	# _11, _12
	leaq	.LC41(%rip), %rdi	#,
	movl	$1, %eax	#,
	call	printf@PLT	#
# src/deep.c:679:     free_activations(&activations);
	.loc 1 679 5
	leaq	-176(%rbp), %rax	#, tmp157
	movq	%rax, %rdi	# tmp157,
	call	free_activations	#
# src/deep.c:683:     Gradients gradients = {0};
	.loc 1 683 15
	movq	$0, -160(%rbp)	#, gradients
	movq	$0, -152(%rbp)	#, gradients
# src/deep.c:684:     data_mini_batch.nImages = SIZE_MINI_BATCH;
	.loc 1 684 29
	movl	$32, -32(%rbp)	#, data_mini_batch.nImages
# src/deep.c:685:     data_mini_batch.rows = data_training.rows;
	.loc 1 685 41
	movl	-92(%rbp), %eax	# data_training.rows, _13
# src/deep.c:685:     data_mini_batch.rows = data_training.rows;
	.loc 1 685 26
	movl	%eax, -28(%rbp)	# _13, data_mini_batch.rows
# src/deep.c:686:     data_mini_batch.cols = data_training.cols;
	.loc 1 686 41
	movl	-88(%rbp), %eax	# data_training.cols, _14
# src/deep.c:686:     data_mini_batch.cols = data_training.cols;
	.loc 1 686 26
	movl	%eax, -24(%rbp)	# _14, data_mini_batch.cols
# src/deep.c:687:     allocate_mini_batch_memory(&data_mini_batch);
	.loc 1 687 5
	leaq	-48(%rbp), %rax	#, tmp158
	movq	%rax, %rdi	# tmp158,
	call	allocate_mini_batch_memory	#
# src/deep.c:688:     initialise_activations(&activations, &model, &data_mini_batch);
	.loc 1 688 5
	leaq	-48(%rbp), %rdx	#, tmp159
	leaq	-144(%rbp), %rcx	#, tmp160
	leaq	-176(%rbp), %rax	#, tmp161
	movq	%rcx, %rsi	# tmp160,
	movq	%rax, %rdi	# tmp161,
	call	initialise_activations	#
# src/deep.c:689:     initialise_gradients(&gradients, &model, &data_mini_batch);
	.loc 1 689 5
	leaq	-48(%rbp), %rdx	#, tmp162
	leaq	-144(%rbp), %rcx	#, tmp163
	leaq	-160(%rbp), %rax	#, tmp164
	movq	%rcx, %rsi	# tmp163,
	movq	%rax, %rdi	# tmp164,
	call	initialise_gradients	#
.LBB65:
# src/deep.c:691:     for (size_t epoch = 0; epoch < NUMBER_EPOCHS; epoch++) {
	.loc 1 691 17
	movq	$0, -224(%rbp)	#, epoch
# src/deep.c:691:     for (size_t epoch = 0; epoch < NUMBER_EPOCHS; epoch++) {
	.loc 1 691 5
	jmp	.L191	#
.L193:
# src/deep.c:692:         initialise_mini_batch(&data_training, &data_mini_batch);
	.loc 1 692 9
	leaq	-48(%rbp), %rdx	#, tmp165
	leaq	-112(%rbp), %rax	#, tmp166
	movq	%rdx, %rsi	# tmp165,
	movq	%rax, %rdi	# tmp166,
	call	initialise_mini_batch	#
# src/deep.c:693:         model_forward(&model, &activations, &data_mini_batch);
	.loc 1 693 9
	leaq	-48(%rbp), %rdx	#, tmp167
	leaq	-176(%rbp), %rcx	#, tmp168
	leaq	-144(%rbp), %rax	#, tmp169
	movq	%rcx, %rsi	# tmp168,
	movq	%rax, %rdi	# tmp169,
	call	model_forward	#
# src/deep.c:694:         model_backward(&model, &activations, &data_mini_batch);
	.loc 1 694 9
	leaq	-48(%rbp), %rdx	#, tmp170
	leaq	-176(%rbp), %rcx	#, tmp171
	leaq	-144(%rbp), %rax	#, tmp172
	movq	%rcx, %rsi	# tmp171,
	movq	%rax, %rdi	# tmp172,
	call	model_backward	#
# src/deep.c:695:         if (epoch % PRINT_EVERY == 0) {
	.loc 1 695 19
	movq	-224(%rbp), %rcx	# epoch, tmp173
	movabsq	$-3689348814741910323, %rdx	#, tmp175
	movq	%rcx, %rax	# tmp173, tmp205
	mulq	%rdx	# tmp175
	shrq	$3, %rdx	#, _15
	movq	%rdx, %rax	# _15, tmp176
	salq	$2, %rax	#, tmp176
	addq	%rdx, %rax	# _15, tmp176
	addq	%rax, %rax	# tmp177
	subq	%rax, %rcx	# tmp176, tmp173
	movq	%rcx, %rdx	# tmp173, _15
# src/deep.c:695:         if (epoch % PRINT_EVERY == 0) {
	.loc 1 695 12
	testq	%rdx, %rdx	# _15
	jne	.L192	#,
# src/deep.c:696:             printf("\nepoch: %zu\n", epoch);
	.loc 1 696 13
	movq	-224(%rbp), %rax	# epoch, tmp178
	movq	%rax, %rsi	# tmp178,
	leaq	.LC42(%rip), %rdi	#,
	movl	$0, %eax	#,
	call	printf@PLT	#
# src/deep.c:697:             printf("Training loss: %f\n", get_loss(&model, &activations, &data_mini_batch));
	.loc 1 697 43
	leaq	-48(%rbp), %rdx	#, tmp179
	leaq	-176(%rbp), %rcx	#, tmp180
	leaq	-144(%rbp), %rax	#, tmp181
	movq	%rcx, %rsi	# tmp180,
	movq	%rax, %rdi	# tmp181,
	call	get_loss	#
# src/deep.c:697:             printf("Training loss: %f\n", get_loss(&model, &activations, &data_mini_batch));
	.loc 1 697 13
	cvtss2sd	%xmm0, %xmm0	# _16, _17
	leaq	.LC43(%rip), %rdi	#,
	movl	$1, %eax	#,
	call	printf@PLT	#
# src/deep.c:698:             printf("Training accuracy: %f\n", get_accuracy(&model, &activations, &data_mini_batch));
	.loc 1 698 47
	leaq	-48(%rbp), %rdx	#, tmp182
	leaq	-176(%rbp), %rcx	#, tmp183
	leaq	-144(%rbp), %rax	#, tmp184
	movq	%rcx, %rsi	# tmp183,
	movq	%rax, %rdi	# tmp184,
	call	get_accuracy	#
# src/deep.c:698:             printf("Training accuracy: %f\n", get_accuracy(&model, &activations, &data_mini_batch));
	.loc 1 698 13
	cvtss2sd	%xmm0, %xmm0	# _18, _19
	leaq	.LC44(%rip), %rdi	#,
	movl	$1, %eax	#,
	call	printf@PLT	#
.L192:
# src/deep.c:700:         memset(gradients.grads, 0, gradients.size_grads * sizeof(float));
	.loc 1 700 45 discriminator 2
	movq	-152(%rbp), %rax	# gradients.size_grads, _20
# src/deep.c:700:         memset(gradients.grads, 0, gradients.size_grads * sizeof(float));
	.loc 1 700 9 discriminator 2
	leaq	0(,%rax,4), %rdx	#, _21
# src/deep.c:700:         memset(gradients.grads, 0, gradients.size_grads * sizeof(float));
	.loc 1 700 25 discriminator 2
	movq	-160(%rbp), %rax	# gradients.grads, _22
# src/deep.c:700:         memset(gradients.grads, 0, gradients.size_grads * sizeof(float));
	.loc 1 700 9 discriminator 2
	movl	$0, %esi	#,
	movq	%rax, %rdi	# _22,
	call	memset@PLT	#
# src/deep.c:691:     for (size_t epoch = 0; epoch < NUMBER_EPOCHS; epoch++) {
	.loc 1 691 56 discriminator 2
	addq	$1, -224(%rbp)	#, epoch
.L191:
# src/deep.c:691:     for (size_t epoch = 0; epoch < NUMBER_EPOCHS; epoch++) {
	.loc 1 691 5 discriminator 1
	cmpq	$99, -224(%rbp)	#, epoch
	jbe	.L193	#,
.LBE65:
# src/deep.c:703:     free_activations(&activations);
	.loc 1 703 5
	leaq	-176(%rbp), %rax	#, tmp185
	movq	%rax, %rdi	# tmp185,
	call	free_activations	#
# src/deep.c:706:     save_model(&model, "models/model");
	.loc 1 706 5
	leaq	-144(%rbp), %rax	#, tmp186
	leaq	.LC45(%rip), %rsi	#,
	movq	%rax, %rdi	# tmp186,
	call	save_model	#
# src/deep.c:709:     initialise_activations(&activations, &model, &data_test);
	.loc 1 709 5
	leaq	-80(%rbp), %rdx	#, tmp187
	leaq	-144(%rbp), %rcx	#, tmp188
	leaq	-176(%rbp), %rax	#, tmp189
	movq	%rcx, %rsi	# tmp188,
	movq	%rax, %rdi	# tmp189,
	call	initialise_activations	#
# src/deep.c:710:     model_forward(&model, &activations, &data_test);
	.loc 1 710 5
	leaq	-80(%rbp), %rdx	#, tmp190
	leaq	-176(%rbp), %rcx	#, tmp191
	leaq	-144(%rbp), %rax	#, tmp192
	movq	%rcx, %rsi	# tmp191,
	movq	%rax, %rdi	# tmp192,
	call	model_forward	#
# src/deep.c:711:     printf("Test loss after training: %f\n", get_loss(&model, &activations, &data_test));
	.loc 1 711 46
	leaq	-80(%rbp), %rdx	#, tmp193
	leaq	-176(%rbp), %rcx	#, tmp194
	leaq	-144(%rbp), %rax	#, tmp195
	movq	%rcx, %rsi	# tmp194,
	movq	%rax, %rdi	# tmp195,
	call	get_loss	#
# src/deep.c:711:     printf("Test loss after training: %f\n", get_loss(&model, &activations, &data_test));
	.loc 1 711 5
	cvtss2sd	%xmm0, %xmm0	# _23, _24
	leaq	.LC46(%rip), %rdi	#,
	movl	$1, %eax	#,
	call	printf@PLT	#
# src/deep.c:712:     printf("Test accuracy after training: %f\n", get_accuracy(&model, &activations, &data_test));
	.loc 1 712 50
	leaq	-80(%rbp), %rdx	#, tmp196
	leaq	-176(%rbp), %rcx	#, tmp197
	leaq	-144(%rbp), %rax	#, tmp198
	movq	%rcx, %rsi	# tmp197,
	movq	%rax, %rdi	# tmp198,
	call	get_accuracy	#
# src/deep.c:712:     printf("Test accuracy after training: %f\n", get_accuracy(&model, &activations, &data_test));
	.loc 1 712 5
	cvtss2sd	%xmm0, %xmm0	# _25, _26
	leaq	.LC47(%rip), %rdi	#,
	movl	$1, %eax	#,
	call	printf@PLT	#
# src/deep.c:716:     free_mini_batch_memory(&data_mini_batch);
	.loc 1 716 5
	leaq	-48(%rbp), %rax	#, tmp199
	movq	%rax, %rdi	# tmp199,
	call	free_mini_batch_memory	#
# src/deep.c:717:     free_gradients(&gradients);
	.loc 1 717 5
	leaq	-160(%rbp), %rax	#, tmp200
	movq	%rax, %rdi	# tmp200,
	call	free_gradients	#
# src/deep.c:719:     free_activations(&activations);
	.loc 1 719 5
	leaq	-176(%rbp), %rax	#, tmp201
	movq	%rax, %rdi	# tmp201,
	call	free_activations	#
# src/deep.c:721:     free_model(&model);
	.loc 1 721 5
	leaq	-144(%rbp), %rax	#, tmp202
	movq	%rax, %rdi	# tmp202,
	call	free_model	#
# src/deep.c:723:     free(data_training.images);
	.loc 1 723 23
	movq	-112(%rbp), %rax	# data_training.images, _27
# src/deep.c:723:     free(data_training.images);
	.loc 1 723 5
	movq	%rax, %rdi	# _27,
	call	free@PLT	#
# src/deep.c:724:     free(data_training.labels);
	.loc 1 724 23
	movq	-104(%rbp), %rax	# data_training.labels, _28
# src/deep.c:724:     free(data_training.labels);
	.loc 1 724 5
	movq	%rax, %rdi	# _28,
	call	free@PLT	#
# src/deep.c:725:     free(data_test.images);
	.loc 1 725 19
	movq	-80(%rbp), %rax	# data_test.images, _29
# src/deep.c:725:     free(data_test.images);
	.loc 1 725 5
	movq	%rax, %rdi	# _29,
	call	free@PLT	#
# src/deep.c:726:     free(data_test.labels);
	.loc 1 726 19
	movq	-72(%rbp), %rax	# data_test.labels, _30
# src/deep.c:726:     free(data_test.labels);
	.loc 1 726 5
	movq	%rax, %rdi	# _30,
	call	free@PLT	#
# src/deep.c:728:     return 0;
	.loc 1 728 12
	movl	$0, %eax	#, _97
# src/deep.c:729: }
	.loc 1 729 1
	movq	-8(%rbp), %rsi	# D.5564, tmp206
	xorq	%fs:40, %rsi	# MEM[(<address-space-1> long unsigned int *)40B], tmp206
	je	.L195	#,
	call	__stack_chk_fail@PLT	#
.L195:
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE46:
	.size	main, .-main
	.section	.rodata
	.align 4
.LC2:
	.long	1065353216
	.align 4
.LC3:
	.long	1036831949
	.align 4
.LC15:
	.long	1325400064
	.align 8
.LC16:
	.long	0
	.long	-1073741824
	.align 8
.LC17:
	.long	1413754136
	.long	1075388923
	.align 4
.LC18:
	.long	1073741824
	.align 4
.LC27:
	.long	1132396544
	.text
.Letext0:
	.file 2 "/usr/lib/gcc/x86_64-linux-gnu/9/include/stddef.h"
	.file 3 "/usr/include/x86_64-linux-gnu/bits/types.h"
	.file 4 "/usr/include/x86_64-linux-gnu/bits/types/struct_FILE.h"
	.file 5 "/usr/include/x86_64-linux-gnu/bits/types/FILE.h"
	.file 6 "/usr/include/stdio.h"
	.file 7 "/usr/include/x86_64-linux-gnu/bits/sys_errlist.h"
	.file 8 "/usr/include/x86_64-linux-gnu/bits/types/time_t.h"
	.file 9 "/usr/include/x86_64-linux-gnu/bits/types/struct_timespec.h"
	.file 10 "/usr/include/math.h"
	.file 11 "/usr/include/x86_64-linux-gnu/bits/types/struct_tm.h"
	.file 12 "/usr/include/time.h"
	.file 13 "/usr/include/x86_64-linux-gnu/bits/dirent.h"
	.file 14 "/usr/include/x86_64-linux-gnu/bits/stat.h"
	.file 15 "/usr/include/unistd.h"
	.file 16 "/usr/include/x86_64-linux-gnu/bits/getopt_core.h"
	.file 17 "/usr/include/dirent.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x1f29
	.value	0x4
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF255
	.byte	0xc
	.long	.LASF256
	.long	.LASF257
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.long	.Ldebug_line0
	.uleb128 0x2
	.long	.LASF7
	.byte	0x2
	.byte	0xd1
	.byte	0x17
	.long	0x39
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.long	.LASF0
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.long	.LASF1
	.uleb128 0x4
	.byte	0x8
	.uleb128 0x3
	.byte	0x1
	.byte	0x8
	.long	.LASF2
	.uleb128 0x3
	.byte	0x2
	.byte	0x7
	.long	.LASF3
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF4
	.uleb128 0x3
	.byte	0x2
	.byte	0x5
	.long	.LASF5
	.uleb128 0x5
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.long	.LASF6
	.uleb128 0x2
	.long	.LASF8
	.byte	0x3
	.byte	0x91
	.byte	0x19
	.long	0x39
	.uleb128 0x2
	.long	.LASF9
	.byte	0x3
	.byte	0x92
	.byte	0x19
	.long	0x40
	.uleb128 0x2
	.long	.LASF10
	.byte	0x3
	.byte	0x93
	.byte	0x19
	.long	0x40
	.uleb128 0x2
	.long	.LASF11
	.byte	0x3
	.byte	0x94
	.byte	0x19
	.long	0x39
	.uleb128 0x2
	.long	.LASF12
	.byte	0x3
	.byte	0x96
	.byte	0x1a
	.long	0x40
	.uleb128 0x2
	.long	.LASF13
	.byte	0x3
	.byte	0x97
	.byte	0x1b
	.long	0x39
	.uleb128 0x2
	.long	.LASF14
	.byte	0x3
	.byte	0x98
	.byte	0x19
	.long	0x6c
	.uleb128 0x2
	.long	.LASF15
	.byte	0x3
	.byte	0x99
	.byte	0x1b
	.long	0x6c
	.uleb128 0x2
	.long	.LASF16
	.byte	0x3
	.byte	0xa0
	.byte	0x1a
	.long	0x6c
	.uleb128 0x2
	.long	.LASF17
	.byte	0x3
	.byte	0xae
	.byte	0x1d
	.long	0x6c
	.uleb128 0x2
	.long	.LASF18
	.byte	0x3
	.byte	0xb3
	.byte	0x1c
	.long	0x6c
	.uleb128 0x2
	.long	.LASF19
	.byte	0x3
	.byte	0xc4
	.byte	0x21
	.long	0x6c
	.uleb128 0x6
	.byte	0x8
	.long	0x109
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF20
	.uleb128 0x7
	.long	0x109
	.uleb128 0x8
	.long	.LASF61
	.byte	0xd8
	.byte	0x4
	.byte	0x31
	.byte	0x8
	.long	0x29c
	.uleb128 0x9
	.long	.LASF21
	.byte	0x4
	.byte	0x33
	.byte	0x7
	.long	0x65
	.byte	0
	.uleb128 0x9
	.long	.LASF22
	.byte	0x4
	.byte	0x36
	.byte	0x9
	.long	0x103
	.byte	0x8
	.uleb128 0x9
	.long	.LASF23
	.byte	0x4
	.byte	0x37
	.byte	0x9
	.long	0x103
	.byte	0x10
	.uleb128 0x9
	.long	.LASF24
	.byte	0x4
	.byte	0x38
	.byte	0x9
	.long	0x103
	.byte	0x18
	.uleb128 0x9
	.long	.LASF25
	.byte	0x4
	.byte	0x39
	.byte	0x9
	.long	0x103
	.byte	0x20
	.uleb128 0x9
	.long	.LASF26
	.byte	0x4
	.byte	0x3a
	.byte	0x9
	.long	0x103
	.byte	0x28
	.uleb128 0x9
	.long	.LASF27
	.byte	0x4
	.byte	0x3b
	.byte	0x9
	.long	0x103
	.byte	0x30
	.uleb128 0x9
	.long	.LASF28
	.byte	0x4
	.byte	0x3c
	.byte	0x9
	.long	0x103
	.byte	0x38
	.uleb128 0x9
	.long	.LASF29
	.byte	0x4
	.byte	0x3d
	.byte	0x9
	.long	0x103
	.byte	0x40
	.uleb128 0x9
	.long	.LASF30
	.byte	0x4
	.byte	0x40
	.byte	0x9
	.long	0x103
	.byte	0x48
	.uleb128 0x9
	.long	.LASF31
	.byte	0x4
	.byte	0x41
	.byte	0x9
	.long	0x103
	.byte	0x50
	.uleb128 0x9
	.long	.LASF32
	.byte	0x4
	.byte	0x42
	.byte	0x9
	.long	0x103
	.byte	0x58
	.uleb128 0x9
	.long	.LASF33
	.byte	0x4
	.byte	0x44
	.byte	0x16
	.long	0x2b5
	.byte	0x60
	.uleb128 0x9
	.long	.LASF34
	.byte	0x4
	.byte	0x46
	.byte	0x14
	.long	0x2bb
	.byte	0x68
	.uleb128 0x9
	.long	.LASF35
	.byte	0x4
	.byte	0x48
	.byte	0x7
	.long	0x65
	.byte	0x70
	.uleb128 0x9
	.long	.LASF36
	.byte	0x4
	.byte	0x49
	.byte	0x7
	.long	0x65
	.byte	0x74
	.uleb128 0x9
	.long	.LASF37
	.byte	0x4
	.byte	0x4a
	.byte	0xb
	.long	0xbb
	.byte	0x78
	.uleb128 0x9
	.long	.LASF38
	.byte	0x4
	.byte	0x4d
	.byte	0x12
	.long	0x50
	.byte	0x80
	.uleb128 0x9
	.long	.LASF39
	.byte	0x4
	.byte	0x4e
	.byte	0xf
	.long	0x57
	.byte	0x82
	.uleb128 0x9
	.long	.LASF40
	.byte	0x4
	.byte	0x4f
	.byte	0x8
	.long	0x2c1
	.byte	0x83
	.uleb128 0x9
	.long	.LASF41
	.byte	0x4
	.byte	0x51
	.byte	0xf
	.long	0x2d1
	.byte	0x88
	.uleb128 0x9
	.long	.LASF42
	.byte	0x4
	.byte	0x59
	.byte	0xd
	.long	0xc7
	.byte	0x90
	.uleb128 0x9
	.long	.LASF43
	.byte	0x4
	.byte	0x5b
	.byte	0x17
	.long	0x2dc
	.byte	0x98
	.uleb128 0x9
	.long	.LASF44
	.byte	0x4
	.byte	0x5c
	.byte	0x19
	.long	0x2e7
	.byte	0xa0
	.uleb128 0x9
	.long	.LASF45
	.byte	0x4
	.byte	0x5d
	.byte	0x14
	.long	0x2bb
	.byte	0xa8
	.uleb128 0x9
	.long	.LASF46
	.byte	0x4
	.byte	0x5e
	.byte	0x9
	.long	0x47
	.byte	0xb0
	.uleb128 0x9
	.long	.LASF47
	.byte	0x4
	.byte	0x5f
	.byte	0xa
	.long	0x2d
	.byte	0xb8
	.uleb128 0x9
	.long	.LASF48
	.byte	0x4
	.byte	0x60
	.byte	0x7
	.long	0x65
	.byte	0xc0
	.uleb128 0x9
	.long	.LASF49
	.byte	0x4
	.byte	0x62
	.byte	0x8
	.long	0x2ed
	.byte	0xc4
	.byte	0
	.uleb128 0x2
	.long	.LASF50
	.byte	0x5
	.byte	0x7
	.byte	0x19
	.long	0x115
	.uleb128 0xa
	.long	.LASF258
	.byte	0x4
	.byte	0x2b
	.byte	0xe
	.uleb128 0xb
	.long	.LASF51
	.uleb128 0x6
	.byte	0x8
	.long	0x2b0
	.uleb128 0x6
	.byte	0x8
	.long	0x115
	.uleb128 0xc
	.long	0x109
	.long	0x2d1
	.uleb128 0xd
	.long	0x39
	.byte	0
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x2a8
	.uleb128 0xb
	.long	.LASF52
	.uleb128 0x6
	.byte	0x8
	.long	0x2d7
	.uleb128 0xb
	.long	.LASF53
	.uleb128 0x6
	.byte	0x8
	.long	0x2e2
	.uleb128 0xc
	.long	0x109
	.long	0x2fd
	.uleb128 0xd
	.long	0x39
	.byte	0x13
	.byte	0
	.uleb128 0xe
	.long	.LASF54
	.byte	0x6
	.byte	0x89
	.byte	0xe
	.long	0x309
	.uleb128 0x6
	.byte	0x8
	.long	0x29c
	.uleb128 0xe
	.long	.LASF55
	.byte	0x6
	.byte	0x8a
	.byte	0xe
	.long	0x309
	.uleb128 0xe
	.long	.LASF56
	.byte	0x6
	.byte	0x8b
	.byte	0xe
	.long	0x309
	.uleb128 0xe
	.long	.LASF57
	.byte	0x7
	.byte	0x1a
	.byte	0xc
	.long	0x65
	.uleb128 0xc
	.long	0x349
	.long	0x33e
	.uleb128 0xf
	.byte	0
	.uleb128 0x7
	.long	0x333
	.uleb128 0x6
	.byte	0x8
	.long	0x110
	.uleb128 0x7
	.long	0x343
	.uleb128 0xe
	.long	.LASF58
	.byte	0x7
	.byte	0x1b
	.byte	0x1a
	.long	0x33e
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.long	.LASF59
	.uleb128 0x2
	.long	.LASF60
	.byte	0x8
	.byte	0x7
	.byte	0x12
	.long	0xd3
	.uleb128 0x8
	.long	.LASF62
	.byte	0x10
	.byte	0x9
	.byte	0xa
	.byte	0x8
	.long	0x395
	.uleb128 0x9
	.long	.LASF63
	.byte	0x9
	.byte	0xc
	.byte	0xc
	.long	0xd3
	.byte	0
	.uleb128 0x9
	.long	.LASF64
	.byte	0x9
	.byte	0x10
	.byte	0x15
	.long	0xf7
	.byte	0x8
	.byte	0
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.long	.LASF65
	.uleb128 0xc
	.long	0x109
	.long	0x3ac
	.uleb128 0xd
	.long	0x39
	.byte	0x1f
	.byte	0
	.uleb128 0x3
	.byte	0x4
	.byte	0x4
	.long	.LASF66
	.uleb128 0x3
	.byte	0x8
	.byte	0x4
	.long	.LASF67
	.uleb128 0x10
	.long	.LASF68
	.byte	0xa
	.value	0x305
	.byte	0xc
	.long	0x65
	.uleb128 0x11
	.string	"tm"
	.byte	0x38
	.byte	0xb
	.byte	0x7
	.byte	0x8
	.long	0x463
	.uleb128 0x9
	.long	.LASF69
	.byte	0xb
	.byte	0x9
	.byte	0x7
	.long	0x65
	.byte	0
	.uleb128 0x9
	.long	.LASF70
	.byte	0xb
	.byte	0xa
	.byte	0x7
	.long	0x65
	.byte	0x4
	.uleb128 0x9
	.long	.LASF71
	.byte	0xb
	.byte	0xb
	.byte	0x7
	.long	0x65
	.byte	0x8
	.uleb128 0x9
	.long	.LASF72
	.byte	0xb
	.byte	0xc
	.byte	0x7
	.long	0x65
	.byte	0xc
	.uleb128 0x9
	.long	.LASF73
	.byte	0xb
	.byte	0xd
	.byte	0x7
	.long	0x65
	.byte	0x10
	.uleb128 0x9
	.long	.LASF74
	.byte	0xb
	.byte	0xe
	.byte	0x7
	.long	0x65
	.byte	0x14
	.uleb128 0x9
	.long	.LASF75
	.byte	0xb
	.byte	0xf
	.byte	0x7
	.long	0x65
	.byte	0x18
	.uleb128 0x9
	.long	.LASF76
	.byte	0xb
	.byte	0x10
	.byte	0x7
	.long	0x65
	.byte	0x1c
	.uleb128 0x9
	.long	.LASF77
	.byte	0xb
	.byte	0x11
	.byte	0x7
	.long	0x65
	.byte	0x20
	.uleb128 0x9
	.long	.LASF78
	.byte	0xb
	.byte	0x14
	.byte	0xc
	.long	0x6c
	.byte	0x28
	.uleb128 0x9
	.long	.LASF79
	.byte	0xb
	.byte	0x15
	.byte	0xf
	.long	0x343
	.byte	0x30
	.byte	0
	.uleb128 0xc
	.long	0x103
	.long	0x473
	.uleb128 0xd
	.long	0x39
	.byte	0x1
	.byte	0
	.uleb128 0xe
	.long	.LASF80
	.byte	0xc
	.byte	0x9f
	.byte	0xe
	.long	0x463
	.uleb128 0xe
	.long	.LASF81
	.byte	0xc
	.byte	0xa0
	.byte	0xc
	.long	0x65
	.uleb128 0xe
	.long	.LASF82
	.byte	0xc
	.byte	0xa1
	.byte	0x11
	.long	0x6c
	.uleb128 0xe
	.long	.LASF83
	.byte	0xc
	.byte	0xa6
	.byte	0xe
	.long	0x463
	.uleb128 0xe
	.long	.LASF84
	.byte	0xc
	.byte	0xae
	.byte	0xc
	.long	0x65
	.uleb128 0xe
	.long	.LASF85
	.byte	0xc
	.byte	0xaf
	.byte	0x11
	.long	0x6c
	.uleb128 0x12
	.long	.LASF86
	.value	0x118
	.byte	0xd
	.byte	0x16
	.byte	0x8
	.long	0x50b
	.uleb128 0x9
	.long	.LASF87
	.byte	0xd
	.byte	0x19
	.byte	0xd
	.long	0x97
	.byte	0
	.uleb128 0x9
	.long	.LASF88
	.byte	0xd
	.byte	0x1a
	.byte	0xd
	.long	0xbb
	.byte	0x8
	.uleb128 0x9
	.long	.LASF89
	.byte	0xd
	.byte	0x1f
	.byte	0x18
	.long	0x50
	.byte	0x10
	.uleb128 0x9
	.long	.LASF90
	.byte	0xd
	.byte	0x20
	.byte	0x13
	.long	0x49
	.byte	0x12
	.uleb128 0x9
	.long	.LASF91
	.byte	0xd
	.byte	0x21
	.byte	0xa
	.long	0x50b
	.byte	0x13
	.byte	0
	.uleb128 0xc
	.long	0x109
	.long	0x51b
	.uleb128 0xd
	.long	0x39
	.byte	0xff
	.byte	0
	.uleb128 0x13
	.string	"DIR"
	.byte	0x11
	.byte	0x7f
	.byte	0x1c
	.long	0x527
	.uleb128 0xb
	.long	.LASF92
	.uleb128 0x8
	.long	.LASF93
	.byte	0x90
	.byte	0xe
	.byte	0x2e
	.byte	0x8
	.long	0x5fd
	.uleb128 0x9
	.long	.LASF94
	.byte	0xe
	.byte	0x30
	.byte	0xd
	.long	0x73
	.byte	0
	.uleb128 0x9
	.long	.LASF95
	.byte	0xe
	.byte	0x35
	.byte	0xd
	.long	0x97
	.byte	0x8
	.uleb128 0x9
	.long	.LASF96
	.byte	0xe
	.byte	0x3d
	.byte	0xf
	.long	0xaf
	.byte	0x10
	.uleb128 0x9
	.long	.LASF97
	.byte	0xe
	.byte	0x3e
	.byte	0xe
	.long	0xa3
	.byte	0x18
	.uleb128 0x9
	.long	.LASF98
	.byte	0xe
	.byte	0x40
	.byte	0xd
	.long	0x7f
	.byte	0x1c
	.uleb128 0x9
	.long	.LASF99
	.byte	0xe
	.byte	0x41
	.byte	0xd
	.long	0x8b
	.byte	0x20
	.uleb128 0x9
	.long	.LASF100
	.byte	0xe
	.byte	0x43
	.byte	0x9
	.long	0x65
	.byte	0x24
	.uleb128 0x9
	.long	.LASF101
	.byte	0xe
	.byte	0x45
	.byte	0xd
	.long	0x73
	.byte	0x28
	.uleb128 0x9
	.long	.LASF102
	.byte	0xe
	.byte	0x4a
	.byte	0xd
	.long	0xbb
	.byte	0x30
	.uleb128 0x9
	.long	.LASF103
	.byte	0xe
	.byte	0x4e
	.byte	0x11
	.long	0xdf
	.byte	0x38
	.uleb128 0x9
	.long	.LASF104
	.byte	0xe
	.byte	0x50
	.byte	0x10
	.long	0xeb
	.byte	0x40
	.uleb128 0x9
	.long	.LASF105
	.byte	0xe
	.byte	0x5b
	.byte	0x15
	.long	0x36d
	.byte	0x48
	.uleb128 0x9
	.long	.LASF106
	.byte	0xe
	.byte	0x5c
	.byte	0x15
	.long	0x36d
	.byte	0x58
	.uleb128 0x9
	.long	.LASF107
	.byte	0xe
	.byte	0x5d
	.byte	0x15
	.long	0x36d
	.byte	0x68
	.uleb128 0x9
	.long	.LASF108
	.byte	0xe
	.byte	0x6a
	.byte	0x17
	.long	0x5fd
	.byte	0x78
	.byte	0
	.uleb128 0xc
	.long	0xf7
	.long	0x60d
	.uleb128 0xd
	.long	0x39
	.byte	0x2
	.byte	0
	.uleb128 0x10
	.long	.LASF109
	.byte	0xf
	.value	0x21f
	.byte	0xf
	.long	0x61a
	.uleb128 0x6
	.byte	0x8
	.long	0x103
	.uleb128 0xe
	.long	.LASF110
	.byte	0x10
	.byte	0x24
	.byte	0xe
	.long	0x103
	.uleb128 0xe
	.long	.LASF111
	.byte	0x10
	.byte	0x32
	.byte	0xc
	.long	0x65
	.uleb128 0xe
	.long	.LASF112
	.byte	0x10
	.byte	0x37
	.byte	0xc
	.long	0x65
	.uleb128 0xe
	.long	.LASF113
	.byte	0x10
	.byte	0x3b
	.byte	0xc
	.long	0x65
	.uleb128 0x14
	.byte	0x20
	.byte	0x1
	.byte	0x13
	.byte	0x9
	.long	0x69b
	.uleb128 0x9
	.long	.LASF114
	.byte	0x1
	.byte	0x14
	.byte	0x14
	.long	0x69b
	.byte	0
	.uleb128 0x9
	.long	.LASF115
	.byte	0x1
	.byte	0x14
	.byte	0x1d
	.long	0x69b
	.byte	0x8
	.uleb128 0x9
	.long	.LASF116
	.byte	0x1
	.byte	0x15
	.byte	0x9
	.long	0x65
	.byte	0x10
	.uleb128 0x9
	.long	.LASF117
	.byte	0x1
	.byte	0x15
	.byte	0x12
	.long	0x65
	.byte	0x14
	.uleb128 0x9
	.long	.LASF118
	.byte	0x1
	.byte	0x15
	.byte	0x18
	.long	0x65
	.byte	0x18
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x49
	.uleb128 0x2
	.long	.LASF119
	.byte	0x1
	.byte	0x16
	.byte	0x3
	.long	0x650
	.uleb128 0x8
	.long	.LASF120
	.byte	0x68
	.byte	0x1
	.byte	0x19
	.byte	0x10
	.long	0x764
	.uleb128 0x9
	.long	.LASF121
	.byte	0x1
	.byte	0x1a
	.byte	0xc
	.long	0x764
	.byte	0
	.uleb128 0x9
	.long	.LASF122
	.byte	0x1
	.byte	0x1a
	.byte	0x16
	.long	0x764
	.byte	0x8
	.uleb128 0x9
	.long	.LASF123
	.byte	0x1
	.byte	0x1a
	.byte	0x1f
	.long	0x764
	.byte	0x10
	.uleb128 0x9
	.long	.LASF124
	.byte	0x1
	.byte	0x1a
	.byte	0x33
	.long	0x764
	.byte	0x18
	.uleb128 0x9
	.long	.LASF125
	.byte	0x1
	.byte	0x1b
	.byte	0x6
	.long	0x764
	.byte	0x20
	.uleb128 0x9
	.long	.LASF126
	.byte	0x1
	.byte	0x1b
	.byte	0x18
	.long	0x764
	.byte	0x28
	.uleb128 0x9
	.long	.LASF127
	.byte	0x1
	.byte	0x1b
	.byte	0x2b
	.long	0x764
	.byte	0x30
	.uleb128 0x9
	.long	.LASF128
	.byte	0x1
	.byte	0x1b
	.byte	0x3f
	.long	0x764
	.byte	0x38
	.uleb128 0x9
	.long	.LASF129
	.byte	0x1
	.byte	0x1c
	.byte	0xc
	.long	0x2d
	.byte	0x40
	.uleb128 0x9
	.long	.LASF130
	.byte	0x1
	.byte	0x1c
	.byte	0x19
	.long	0x2d
	.byte	0x48
	.uleb128 0x9
	.long	.LASF131
	.byte	0x1
	.byte	0x1d
	.byte	0xc
	.long	0x780
	.byte	0x50
	.uleb128 0x9
	.long	.LASF132
	.byte	0x1
	.byte	0x1e
	.byte	0xc
	.long	0x79b
	.byte	0x58
	.uleb128 0x9
	.long	.LASF133
	.byte	0x1
	.byte	0x1f
	.byte	0xd
	.long	0x7ac
	.byte	0x60
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x3ac
	.uleb128 0x15
	.long	0x77a
	.uleb128 0x16
	.long	0x77a
	.uleb128 0x16
	.long	0x2d
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x6ad
	.uleb128 0x6
	.byte	0x8
	.long	0x76a
	.uleb128 0x15
	.long	0x79b
	.uleb128 0x16
	.long	0x77a
	.uleb128 0x16
	.long	0x69b
	.uleb128 0x16
	.long	0x2d
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x786
	.uleb128 0x17
	.long	0x3ac
	.long	0x7ac
	.uleb128 0x18
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x7a1
	.uleb128 0x2
	.long	.LASF120
	.byte	0x1
	.byte	0x20
	.byte	0x3
	.long	0x6ad
	.uleb128 0x14
	.byte	0x18
	.byte	0x1
	.byte	0x22
	.byte	0x9
	.long	0x7ef
	.uleb128 0x9
	.long	.LASF134
	.byte	0x1
	.byte	0x23
	.byte	0xd
	.long	0x7ef
	.byte	0
	.uleb128 0x9
	.long	.LASF135
	.byte	0x1
	.byte	0x24
	.byte	0xc
	.long	0x2d
	.byte	0x8
	.uleb128 0x9
	.long	.LASF136
	.byte	0x1
	.byte	0x25
	.byte	0xc
	.long	0x2d
	.byte	0x10
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x7f5
	.uleb128 0x6
	.byte	0x8
	.long	0x7b2
	.uleb128 0x2
	.long	.LASF137
	.byte	0x1
	.byte	0x26
	.byte	0x3
	.long	0x7be
	.uleb128 0x14
	.byte	0x10
	.byte	0x1
	.byte	0x28
	.byte	0x9
	.long	0x82b
	.uleb128 0x9
	.long	.LASF138
	.byte	0x1
	.byte	0x29
	.byte	0xc
	.long	0x764
	.byte	0
	.uleb128 0x9
	.long	.LASF139
	.byte	0x1
	.byte	0x2a
	.byte	0xc
	.long	0x2d
	.byte	0x8
	.byte	0
	.uleb128 0x2
	.long	.LASF140
	.byte	0x1
	.byte	0x2b
	.byte	0x3
	.long	0x807
	.uleb128 0x14
	.byte	0x10
	.byte	0x1
	.byte	0x2d
	.byte	0x9
	.long	0x85b
	.uleb128 0x9
	.long	.LASF141
	.byte	0x1
	.byte	0x2e
	.byte	0xc
	.long	0x764
	.byte	0
	.uleb128 0x9
	.long	.LASF142
	.byte	0x1
	.byte	0x2f
	.byte	0xc
	.long	0x2d
	.byte	0x8
	.byte	0
	.uleb128 0x2
	.long	.LASF143
	.byte	0x1
	.byte	0x30
	.byte	0x3
	.long	0x837
	.uleb128 0x19
	.long	.LASF155
	.byte	0x1
	.value	0x278
	.byte	0x5
	.long	0x65
	.quad	.LFB46
	.quad	.LFE46-.LFB46
	.uleb128 0x1
	.byte	0x9c
	.long	0x968
	.uleb128 0x1a
	.long	.LASF144
	.byte	0x1
	.value	0x27a
	.byte	0xf
	.long	0x6a1
	.uleb128 0x3
	.byte	0x91
	.sleb128 -128
	.uleb128 0x1a
	.long	.LASF145
	.byte	0x1
	.value	0x27a
	.byte	0x1e
	.long	0x6a1
	.uleb128 0x3
	.byte	0x91
	.sleb128 -96
	.uleb128 0x1a
	.long	.LASF146
	.byte	0x1
	.value	0x27a
	.byte	0x29
	.long	0x6a1
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x1a
	.long	.LASF147
	.byte	0x1
	.value	0x27c
	.byte	0x12
	.long	0x343
	.uleb128 0x3
	.byte	0x91
	.sleb128 -232
	.uleb128 0x1a
	.long	.LASF148
	.byte	0x1
	.value	0x27e
	.byte	0x12
	.long	0x343
	.uleb128 0x3
	.byte	0x91
	.sleb128 -224
	.uleb128 0x1a
	.long	.LASF149
	.byte	0x1
	.value	0x27f
	.byte	0x11
	.long	0x343
	.uleb128 0x3
	.byte	0x91
	.sleb128 -216
	.uleb128 0x1a
	.long	.LASF150
	.byte	0x1
	.value	0x287
	.byte	0x11
	.long	0x343
	.uleb128 0x3
	.byte	0x91
	.sleb128 -208
	.uleb128 0x1a
	.long	.LASF151
	.byte	0x1
	.value	0x288
	.byte	0x11
	.long	0x343
	.uleb128 0x3
	.byte	0x91
	.sleb128 -200
	.uleb128 0x1a
	.long	.LASF152
	.byte	0x1
	.value	0x291
	.byte	0xb
	.long	0x7fb
	.uleb128 0x3
	.byte	0x91
	.sleb128 -160
	.uleb128 0x1a
	.long	.LASF138
	.byte	0x1
	.value	0x2a2
	.byte	0x11
	.long	0x82b
	.uleb128 0x3
	.byte	0x91
	.sleb128 -192
	.uleb128 0x1a
	.long	.LASF153
	.byte	0x1
	.value	0x2ab
	.byte	0xf
	.long	0x85b
	.uleb128 0x3
	.byte	0x91
	.sleb128 -176
	.uleb128 0x1b
	.quad	.LBB65
	.quad	.LBE65-.LBB65
	.uleb128 0x1a
	.long	.LASF154
	.byte	0x1
	.value	0x2b3
	.byte	0x11
	.long	0x2d
	.uleb128 0x3
	.byte	0x91
	.sleb128 -240
	.byte	0
	.byte	0
	.uleb128 0x1c
	.long	.LASF156
	.byte	0x1
	.value	0x26e
	.byte	0x6
	.quad	.LFB45
	.quad	.LFE45-.LFB45
	.uleb128 0x1
	.byte	0x9c
	.long	0x9ba
	.uleb128 0x1d
	.long	.LASF152
	.byte	0x1
	.value	0x26e
	.byte	0x19
	.long	0x9ba
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x1b
	.quad	.LBB64
	.quad	.LBE64-.LBB64
	.uleb128 0x1a
	.long	.LASF157
	.byte	0x1
	.value	0x270
	.byte	0x11
	.long	0x2d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x7fb
	.uleb128 0x1c
	.long	.LASF158
	.byte	0x1
	.value	0x266
	.byte	0x6
	.quad	.LFB44
	.quad	.LFE44-.LFB44
	.uleb128 0x1
	.byte	0x9c
	.long	0xa44
	.uleb128 0x1d
	.long	.LASF159
	.byte	0x1
	.value	0x266
	.byte	0x28
	.long	0xa44
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x1d
	.long	.LASF160
	.byte	0x1
	.value	0x266
	.byte	0x43
	.long	0xa44
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x1b
	.quad	.LBB62
	.quad	.LBE62-.LBB62
	.uleb128 0x1a
	.long	.LASF161
	.byte	0x1
	.value	0x267
	.byte	0x11
	.long	0x2d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x1b
	.quad	.LBB63
	.quad	.LBE63-.LBB63
	.uleb128 0x1a
	.long	.LASF162
	.byte	0x1
	.value	0x268
	.byte	0x10
	.long	0x2d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x6a1
	.uleb128 0x1c
	.long	.LASF163
	.byte	0x1
	.value	0x260
	.byte	0x6
	.quad	.LFB43
	.quad	.LFE43-.LFB43
	.uleb128 0x1
	.byte	0x9c
	.long	0xa7a
	.uleb128 0x1d
	.long	.LASF160
	.byte	0x1
	.value	0x260
	.byte	0x29
	.long	0xa44
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x1c
	.long	.LASF164
	.byte	0x1
	.value	0x25a
	.byte	0x6
	.quad	.LFB42
	.quad	.LFE42-.LFB42
	.uleb128 0x1
	.byte	0x9c
	.long	0xaaa
	.uleb128 0x1d
	.long	.LASF160
	.byte	0x1
	.value	0x25a
	.byte	0x2d
	.long	0xa44
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x1c
	.long	.LASF165
	.byte	0x1
	.value	0x255
	.byte	0x6
	.quad	.LFB41
	.quad	.LFE41-.LFB41
	.uleb128 0x1
	.byte	0x9c
	.long	0xada
	.uleb128 0x1d
	.long	.LASF153
	.byte	0x1
	.value	0x255
	.byte	0x21
	.long	0xada
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x85b
	.uleb128 0x1c
	.long	.LASF166
	.byte	0x1
	.value	0x23b
	.byte	0x6
	.quad	.LFB40
	.quad	.LFE40-.LFB40
	.uleb128 0x1
	.byte	0x9c
	.long	0xb99
	.uleb128 0x1d
	.long	.LASF153
	.byte	0x1
	.value	0x23b
	.byte	0x27
	.long	0xada
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x1d
	.long	.LASF152
	.byte	0x1
	.value	0x23b
	.byte	0x39
	.long	0x9ba
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x1d
	.long	.LASF167
	.byte	0x1
	.value	0x23b
	.byte	0x4b
	.long	0xa44
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.uleb128 0x1e
	.quad	.LBB59
	.quad	.LBE59-.LBB59
	.long	0xb54
	.uleb128 0x1f
	.string	"i"
	.byte	0x1
	.value	0x23d
	.byte	0x11
	.long	0x2d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.byte	0
	.uleb128 0x1b
	.quad	.LBB60
	.quad	.LBE60-.LBB60
	.uleb128 0x1a
	.long	.LASF157
	.byte	0x1
	.value	0x248
	.byte	0x11
	.long	0x2d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x1b
	.quad	.LBB61
	.quad	.LBE61-.LBB61
	.uleb128 0x1a
	.long	.LASF168
	.byte	0x1
	.value	0x249
	.byte	0x10
	.long	0x7f5
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x1c
	.long	.LASF169
	.byte	0x1
	.value	0x235
	.byte	0x6
	.quad	.LFB39
	.quad	.LFE39-.LFB39
	.uleb128 0x1
	.byte	0x9c
	.long	0xbc9
	.uleb128 0x1d
	.long	.LASF138
	.byte	0x1
	.value	0x235
	.byte	0x25
	.long	0xbc9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x82b
	.uleb128 0x1c
	.long	.LASF170
	.byte	0x1
	.value	0x21c
	.byte	0x6
	.quad	.LFB38
	.quad	.LFE38-.LFB38
	.uleb128 0x1
	.byte	0x9c
	.long	0xcd0
	.uleb128 0x1d
	.long	.LASF138
	.byte	0x1
	.value	0x21c
	.byte	0x2b
	.long	0xbc9
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.uleb128 0x1d
	.long	.LASF152
	.byte	0x1
	.value	0x21c
	.byte	0x3f
	.long	0x9ba
	.uleb128 0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0x1d
	.long	.LASF167
	.byte	0x1
	.value	0x21c
	.byte	0x51
	.long	0xa44
	.uleb128 0x3
	.byte	0x91
	.sleb128 -88
	.uleb128 0x1a
	.long	.LASF171
	.byte	0x1
	.value	0x22b
	.byte	0xc
	.long	0x764
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x1a
	.long	.LASF172
	.byte	0x1
	.value	0x22c
	.byte	0xc
	.long	0x764
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x1e
	.quad	.LBB55
	.quad	.LBE55-.LBB55
	.long	0xc65
	.uleb128 0x1f
	.string	"i"
	.byte	0x1
	.value	0x21f
	.byte	0x11
	.long	0x2d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.byte	0
	.uleb128 0x1e
	.quad	.LBB56
	.quad	.LBE56-.LBB56
	.long	0xc8b
	.uleb128 0x1a
	.long	.LASF173
	.byte	0x1
	.value	0x227
	.byte	0x11
	.long	0x2d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.byte	0
	.uleb128 0x1b
	.quad	.LBB57
	.quad	.LBE57-.LBB57
	.uleb128 0x1a
	.long	.LASF157
	.byte	0x1
	.value	0x22e
	.byte	0x11
	.long	0x2d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x1b
	.quad	.LBB58
	.quad	.LBE58-.LBB58
	.uleb128 0x1a
	.long	.LASF168
	.byte	0x1
	.value	0x22f
	.byte	0x10
	.long	0x7f5
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x20
	.long	.LASF180
	.byte	0x1
	.value	0x20c
	.byte	0x7
	.long	0x3ac
	.quad	.LFB37
	.quad	.LFE37-.LFB37
	.uleb128 0x1
	.byte	0x9c
	.long	0xdab
	.uleb128 0x1d
	.long	.LASF152
	.byte	0x1
	.value	0x20c
	.byte	0x1b
	.long	0x9ba
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.uleb128 0x1d
	.long	.LASF138
	.byte	0x1
	.value	0x20c
	.byte	0x2f
	.long	0xbc9
	.uleb128 0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0x1d
	.long	.LASF167
	.byte	0x1
	.value	0x20c
	.byte	0x47
	.long	0xa44
	.uleb128 0x3
	.byte	0x91
	.sleb128 -88
	.uleb128 0x1a
	.long	.LASF174
	.byte	0x1
	.value	0x20e
	.byte	0x9
	.long	0x65
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x1a
	.long	.LASF175
	.byte	0x1
	.value	0x20f
	.byte	0xc
	.long	0x764
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x1b
	.quad	.LBB53
	.quad	.LBE53-.LBB53
	.uleb128 0x1a
	.long	.LASF176
	.byte	0x1
	.value	0x210
	.byte	0x11
	.long	0x2d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x1b
	.quad	.LBB54
	.quad	.LBE54-.LBB54
	.uleb128 0x1a
	.long	.LASF177
	.byte	0x1
	.value	0x211
	.byte	0x17
	.long	0x49
	.uleb128 0x2
	.byte	0x91
	.sleb128 -49
	.uleb128 0x1a
	.long	.LASF178
	.byte	0x1
	.value	0x212
	.byte	0x10
	.long	0x2d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x1a
	.long	.LASF179
	.byte	0x1
	.value	0x213
	.byte	0xd
	.long	0x65
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x21
	.long	.LASF181
	.byte	0x1
	.value	0x1ff
	.byte	0x5
	.long	0x65
	.quad	.LFB36
	.quad	.LFE36-.LFB36
	.uleb128 0x1
	.byte	0x9c
	.long	0xe2f
	.uleb128 0x1d
	.long	.LASF175
	.byte	0x1
	.value	0x1ff
	.byte	0x14
	.long	0x764
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x1d
	.long	.LASF182
	.byte	0x1
	.value	0x1ff
	.byte	0x22
	.long	0x2d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x1a
	.long	.LASF183
	.byte	0x1
	.value	0x201
	.byte	0x9
	.long	0x65
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x1a
	.long	.LASF184
	.byte	0x1
	.value	0x202
	.byte	0xb
	.long	0x3ac
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x1b
	.quad	.LBB52
	.quad	.LBE52-.LBB52
	.uleb128 0x1f
	.string	"i"
	.byte	0x1
	.value	0x203
	.byte	0x11
	.long	0x2d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.byte	0
	.uleb128 0x20
	.long	.LASF185
	.byte	0x1
	.value	0x1f3
	.byte	0x7
	.long	0x3ac
	.quad	.LFB35
	.quad	.LFE35-.LFB35
	.uleb128 0x1
	.byte	0x9c
	.long	0xef8
	.uleb128 0x1d
	.long	.LASF152
	.byte	0x1
	.value	0x1f3
	.byte	0x17
	.long	0x9ba
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x1d
	.long	.LASF138
	.byte	0x1
	.value	0x1f3
	.byte	0x2b
	.long	0xbc9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x1d
	.long	.LASF167
	.byte	0x1
	.value	0x1f3
	.byte	0x43
	.long	0xa44
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.uleb128 0x1a
	.long	.LASF186
	.byte	0x1
	.value	0x1f5
	.byte	0xb
	.long	0x3ac
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x1a
	.long	.LASF175
	.byte	0x1
	.value	0x1f6
	.byte	0xc
	.long	0x764
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x1b
	.quad	.LBB50
	.quad	.LBE50-.LBB50
	.uleb128 0x1a
	.long	.LASF176
	.byte	0x1
	.value	0x1f7
	.byte	0x11
	.long	0x2d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x1b
	.quad	.LBB51
	.quad	.LBE51-.LBB51
	.uleb128 0x1a
	.long	.LASF177
	.byte	0x1
	.value	0x1f8
	.byte	0x17
	.long	0x49
	.uleb128 0x2
	.byte	0x91
	.sleb128 -45
	.uleb128 0x1a
	.long	.LASF187
	.byte	0x1
	.value	0x1f9
	.byte	0x10
	.long	0x2d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x1c
	.long	.LASF188
	.byte	0x1
	.value	0x1e1
	.byte	0x6
	.quad	.LFB34
	.quad	.LFE34-.LFB34
	.uleb128 0x1
	.byte	0x9c
	.long	0xfd1
	.uleb128 0x1d
	.long	.LASF152
	.byte	0x1
	.value	0x1e1
	.byte	0x19
	.long	0x9ba
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.uleb128 0x1d
	.long	.LASF138
	.byte	0x1
	.value	0x1e1
	.byte	0x2d
	.long	0xbc9
	.uleb128 0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0x1d
	.long	.LASF167
	.byte	0x1
	.value	0x1e1
	.byte	0x45
	.long	0xa44
	.uleb128 0x3
	.byte	0x91
	.sleb128 -88
	.uleb128 0x1a
	.long	.LASF175
	.byte	0x1
	.value	0x1e4
	.byte	0xc
	.long	0x764
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x1a
	.long	.LASF189
	.byte	0x1
	.value	0x1e5
	.byte	0xb
	.long	0x3ac
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.uleb128 0x1b
	.quad	.LBB47
	.quad	.LBE47-.LBB47
	.uleb128 0x1a
	.long	.LASF176
	.byte	0x1
	.value	0x1e6
	.byte	0x11
	.long	0x2d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x1b
	.quad	.LBB48
	.quad	.LBE48-.LBB48
	.uleb128 0x1a
	.long	.LASF187
	.byte	0x1
	.value	0x1e7
	.byte	0x10
	.long	0x2d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x1b
	.quad	.LBB49
	.quad	.LBE49-.LBB49
	.uleb128 0x1a
	.long	.LASF190
	.byte	0x1
	.value	0x1e9
	.byte	0x15
	.long	0x2d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x1c
	.long	.LASF191
	.byte	0x1
	.value	0x1da
	.byte	0x6
	.quad	.LFB33
	.quad	.LFE33-.LFB33
	.uleb128 0x1
	.byte	0x9c
	.long	0x1001
	.uleb128 0x1d
	.long	.LASF168
	.byte	0x1
	.value	0x1da
	.byte	0x18
	.long	0x7f5
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x1c
	.long	.LASF192
	.byte	0x1
	.value	0x1ce
	.byte	0x6
	.quad	.LFB32
	.quad	.LFE32-.LFB32
	.uleb128 0x1
	.byte	0x9c
	.long	0x1075
	.uleb128 0x1d
	.long	.LASF168
	.byte	0x1
	.value	0x1ce
	.byte	0x19
	.long	0x7f5
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x1e
	.quad	.LBB45
	.quad	.LBE45-.LBB45
	.long	0x1054
	.uleb128 0x1f
	.string	"i"
	.byte	0x1
	.value	0x1d2
	.byte	0x11
	.long	0x2d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.byte	0
	.uleb128 0x1b
	.quad	.LBB46
	.quad	.LBE46-.LBB46
	.uleb128 0x1f
	.string	"i"
	.byte	0x1
	.value	0x1d5
	.byte	0x11
	.long	0x2d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.byte	0
	.uleb128 0x1c
	.long	.LASF193
	.byte	0x1
	.value	0x1c4
	.byte	0x6
	.quad	.LFB31
	.quad	.LFE31-.LFB31
	.uleb128 0x1
	.byte	0x9c
	.long	0x10c5
	.uleb128 0x1d
	.long	.LASF168
	.byte	0x1
	.value	0x1c4
	.byte	0x20
	.long	0x7f5
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x1b
	.quad	.LBB44
	.quad	.LBE44-.LBB44
	.uleb128 0x1f
	.string	"i"
	.byte	0x1
	.value	0x1c7
	.byte	0x11
	.long	0x2d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.byte	0
	.uleb128 0x1c
	.long	.LASF194
	.byte	0x1
	.value	0x1bb
	.byte	0x6
	.quad	.LFB30
	.quad	.LFE30-.LFB30
	.uleb128 0x1
	.byte	0x9c
	.long	0x1115
	.uleb128 0x1d
	.long	.LASF168
	.byte	0x1
	.value	0x1bb
	.byte	0x21
	.long	0x7f5
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x1b
	.quad	.LBB43
	.quad	.LBE43-.LBB43
	.uleb128 0x1f
	.string	"i"
	.byte	0x1
	.value	0x1be
	.byte	0x11
	.long	0x2d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.byte	0
	.uleb128 0x1c
	.long	.LASF195
	.byte	0x1
	.value	0x1b2
	.byte	0x6
	.quad	.LFB29
	.quad	.LFE29-.LFB29
	.uleb128 0x1
	.byte	0x9c
	.long	0x1187
	.uleb128 0x1d
	.long	.LASF152
	.byte	0x1
	.value	0x1b2
	.byte	0x1e
	.long	0x9ba
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x1b
	.quad	.LBB41
	.quad	.LBE41-.LBB41
	.uleb128 0x1f
	.string	"i"
	.byte	0x1
	.value	0x1b4
	.byte	0x11
	.long	0x2d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x1b
	.quad	.LBB42
	.quad	.LBE42-.LBB42
	.uleb128 0x1a
	.long	.LASF168
	.byte	0x1
	.value	0x1b5
	.byte	0x10
	.long	0x7f5
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x1c
	.long	.LASF196
	.byte	0x1
	.value	0x1a5
	.byte	0x6
	.quad	.LFB28
	.quad	.LFE28-.LFB28
	.uleb128 0x1
	.byte	0x9c
	.long	0x1219
	.uleb128 0x1d
	.long	.LASF152
	.byte	0x1
	.value	0x1a5
	.byte	0x28
	.long	0x9ba
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x1a
	.long	.LASF197
	.byte	0x1
	.value	0x1a7
	.byte	0xc
	.long	0x764
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x1a
	.long	.LASF198
	.byte	0x1
	.value	0x1a8
	.byte	0xc
	.long	0x2d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x1b
	.quad	.LBB39
	.quad	.LBE39-.LBB39
	.uleb128 0x1f
	.string	"i"
	.byte	0x1
	.value	0x1a9
	.byte	0x11
	.long	0x2d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x1b
	.quad	.LBB40
	.quad	.LBE40-.LBB40
	.uleb128 0x1a
	.long	.LASF168
	.byte	0x1
	.value	0x1aa
	.byte	0x10
	.long	0x7f5
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x1c
	.long	.LASF199
	.byte	0x1
	.value	0x193
	.byte	0x6
	.quad	.LFB27
	.quad	.LFE27-.LFB27
	.uleb128 0x1
	.byte	0x9c
	.long	0x12ab
	.uleb128 0x1d
	.long	.LASF152
	.byte	0x1
	.value	0x193
	.byte	0x17
	.long	0x9ba
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x1d
	.long	.LASF129
	.byte	0x1
	.value	0x193
	.byte	0x25
	.long	0x2d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x1d
	.long	.LASF130
	.byte	0x1
	.value	0x193
	.byte	0x39
	.long	0x2d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x1d
	.long	.LASF131
	.byte	0x1
	.value	0x193
	.byte	0x4d
	.long	0x12bb
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x1d
	.long	.LASF132
	.byte	0x1
	.value	0x194
	.byte	0x16
	.long	0x12d6
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.uleb128 0x1d
	.long	.LASF133
	.byte	0x1
	.value	0x195
	.byte	0x15
	.long	0x7ac
	.uleb128 0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0x1a
	.long	.LASF168
	.byte	0x1
	.value	0x197
	.byte	0xc
	.long	0x7f5
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x15
	.long	0x12bb
	.uleb128 0x16
	.long	0x7f5
	.uleb128 0x16
	.long	0x2d
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x12ab
	.uleb128 0x15
	.long	0x12d6
	.uleb128 0x16
	.long	0x7f5
	.uleb128 0x16
	.long	0x69b
	.uleb128 0x16
	.long	0x2d
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x12c1
	.uleb128 0x1c
	.long	.LASF200
	.byte	0x1
	.value	0x17f
	.byte	0x6
	.quad	.LFB26
	.quad	.LFE26-.LFB26
	.uleb128 0x1
	.byte	0x9c
	.long	0x1371
	.uleb128 0x1d
	.long	.LASF168
	.byte	0x1
	.value	0x17f
	.byte	0x25
	.long	0x7f5
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x1d
	.long	.LASF171
	.byte	0x1
	.value	0x17f
	.byte	0x33
	.long	0x2d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x1d
	.long	.LASF172
	.byte	0x1
	.value	0x17f
	.byte	0x42
	.long	0x2d
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.uleb128 0x1e
	.quad	.LBB37
	.quad	.LBE37-.LBB37
	.long	0x1350
	.uleb128 0x1f
	.string	"i"
	.byte	0x1
	.value	0x18a
	.byte	0x11
	.long	0x2d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.byte	0
	.uleb128 0x1b
	.quad	.LBB38
	.quad	.LBE38-.LBB38
	.uleb128 0x1f
	.string	"i"
	.byte	0x1
	.value	0x18d
	.byte	0x11
	.long	0x2d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.byte	0
	.byte	0
	.uleb128 0x1c
	.long	.LASF201
	.byte	0x1
	.value	0x16d
	.byte	0x6
	.quad	.LFB25
	.quad	.LFE25-.LFB25
	.uleb128 0x1
	.byte	0x9c
	.long	0x1406
	.uleb128 0x1d
	.long	.LASF168
	.byte	0x1
	.value	0x16d
	.byte	0x26
	.long	0x7f5
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x1d
	.long	.LASF171
	.byte	0x1
	.value	0x16d
	.byte	0x34
	.long	0x2d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x1d
	.long	.LASF172
	.byte	0x1
	.value	0x16d
	.byte	0x43
	.long	0x2d
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.uleb128 0x1e
	.quad	.LBB35
	.quad	.LBE35-.LBB35
	.long	0x13e5
	.uleb128 0x1f
	.string	"i"
	.byte	0x1
	.value	0x178
	.byte	0x11
	.long	0x2d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.byte	0
	.uleb128 0x1b
	.quad	.LBB36
	.quad	.LBE36-.LBB36
	.uleb128 0x1f
	.string	"i"
	.byte	0x1
	.value	0x17b
	.byte	0x11
	.long	0x2d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.byte	0
	.byte	0
	.uleb128 0x1c
	.long	.LASF202
	.byte	0x1
	.value	0x164
	.byte	0x6
	.quad	.LFB24
	.quad	.LFE24-.LFB24
	.uleb128 0x1
	.byte	0x9c
	.long	0x148a
	.uleb128 0x1d
	.long	.LASF168
	.byte	0x1
	.value	0x164
	.byte	0x1e
	.long	0x7f5
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x1d
	.long	.LASF133
	.byte	0x1
	.value	0x164
	.byte	0x2d
	.long	0x7ac
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x1e
	.quad	.LBB33
	.quad	.LBE33-.LBB33
	.long	0x1469
	.uleb128 0x1f
	.string	"i"
	.byte	0x1
	.value	0x166
	.byte	0x11
	.long	0x2d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.byte	0
	.uleb128 0x1b
	.quad	.LBB34
	.quad	.LBE34-.LBB34
	.uleb128 0x1f
	.string	"i"
	.byte	0x1
	.value	0x169
	.byte	0x11
	.long	0x2d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.byte	0
	.byte	0
	.uleb128 0x20
	.long	.LASF203
	.byte	0x1
	.value	0x15d
	.byte	0x7
	.long	0x3ac
	.quad	.LFB23
	.quad	.LFE23-.LFB23
	.uleb128 0x1
	.byte	0x9c
	.long	0x14de
	.uleb128 0x1d
	.long	.LASF171
	.byte	0x1
	.value	0x15d
	.byte	0x26
	.long	0x2d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x1d
	.long	.LASF172
	.byte	0x1
	.value	0x15d
	.byte	0x35
	.long	0x2d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x1a
	.long	.LASF204
	.byte	0x1
	.value	0x15f
	.byte	0xb
	.long	0x3ac
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x20
	.long	.LASF205
	.byte	0x1
	.value	0x156
	.byte	0x7
	.long	0x3ac
	.quad	.LFB22
	.quad	.LFE22-.LFB22
	.uleb128 0x1
	.byte	0x9c
	.long	0x1532
	.uleb128 0x1d
	.long	.LASF171
	.byte	0x1
	.value	0x156
	.byte	0x25
	.long	0x2d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x1d
	.long	.LASF172
	.byte	0x1
	.value	0x156
	.byte	0x34
	.long	0x2d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x1a
	.long	.LASF204
	.byte	0x1
	.value	0x158
	.byte	0xb
	.long	0x3ac
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x19
	.long	.LASF206
	.byte	0x1
	.value	0x14b
	.byte	0x7
	.long	0x3ac
	.quad	.LFB21
	.quad	.LFE21-.LFB21
	.uleb128 0x1
	.byte	0x9c
	.long	0x1574
	.uleb128 0x1f
	.string	"u1"
	.byte	0x1
	.value	0x14e
	.byte	0xb
	.long	0x3ac
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x1f
	.string	"u2"
	.byte	0x1
	.value	0x14f
	.byte	0xb
	.long	0x3ac
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x20
	.long	.LASF207
	.byte	0x1
	.value	0x11e
	.byte	0x5
	.long	0x65
	.quad	.LFB20
	.quad	.LFE20-.LFB20
	.uleb128 0x1
	.byte	0x9c
	.long	0x1654
	.uleb128 0x1d
	.long	.LASF152
	.byte	0x1
	.value	0x11e
	.byte	0x18
	.long	0x9ba
	.uleb128 0x3
	.byte	0x91
	.sleb128 -760
	.uleb128 0x1d
	.long	.LASF208
	.byte	0x1
	.value	0x11e
	.byte	0x2b
	.long	0x343
	.uleb128 0x3
	.byte	0x91
	.sleb128 -768
	.uleb128 0x1f
	.string	"dir"
	.byte	0x1
	.value	0x11f
	.byte	0xa
	.long	0x1654
	.uleb128 0x3
	.byte	0x91
	.sleb128 -728
	.uleb128 0x1a
	.long	.LASF209
	.byte	0x1
	.value	0x120
	.byte	0x14
	.long	0x165a
	.uleb128 0x3
	.byte	0x91
	.sleb128 -720
	.uleb128 0x1a
	.long	.LASF210
	.byte	0x1
	.value	0x121
	.byte	0x11
	.long	0x52c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -704
	.uleb128 0x1f
	.string	"now"
	.byte	0x1
	.value	0x122
	.byte	0xc
	.long	0x361
	.uleb128 0x3
	.byte	0x91
	.sleb128 -744
	.uleb128 0x1a
	.long	.LASF211
	.byte	0x1
	.value	0x124
	.byte	0xc
	.long	0x361
	.uleb128 0x3
	.byte	0x91
	.sleb128 -736
	.uleb128 0x1a
	.long	.LASF212
	.byte	0x1
	.value	0x125
	.byte	0xa
	.long	0x1660
	.uleb128 0x3
	.byte	0x91
	.sleb128 -560
	.uleb128 0x1a
	.long	.LASF213
	.byte	0x1
	.value	0x126
	.byte	0xa
	.long	0x1660
	.uleb128 0x3
	.byte	0x91
	.sleb128 -288
	.uleb128 0x1b
	.quad	.LBB32
	.quad	.LBE32-.LBB32
	.uleb128 0x1a
	.long	.LASF214
	.byte	0x1
	.value	0x133
	.byte	0x14
	.long	0x361
	.uleb128 0x3
	.byte	0x91
	.sleb128 -712
	.byte	0
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x51b
	.uleb128 0x6
	.byte	0x8
	.long	0x4bb
	.uleb128 0xc
	.long	0x109
	.long	0x1671
	.uleb128 0x22
	.long	0x39
	.value	0x103
	.byte	0
	.uleb128 0x1c
	.long	.LASF215
	.byte	0x1
	.value	0x113
	.byte	0x6
	.quad	.LFB19
	.quad	.LFE19-.LFB19
	.uleb128 0x1
	.byte	0x9c
	.long	0x16c1
	.uleb128 0x1d
	.long	.LASF152
	.byte	0x1
	.value	0x113
	.byte	0x23
	.long	0x9ba
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x1d
	.long	.LASF216
	.byte	0x1
	.value	0x113
	.byte	0x36
	.long	0x343
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x1a
	.long	.LASF217
	.byte	0x1
	.value	0x114
	.byte	0xb
	.long	0x309
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x23
	.long	.LASF218
	.byte	0x1
	.byte	0xf4
	.byte	0x6
	.quad	.LFB18
	.quad	.LFE18-.LFB18
	.uleb128 0x1
	.byte	0x9c
	.long	0x1751
	.uleb128 0x24
	.long	.LASF152
	.byte	0x1
	.byte	0xf4
	.byte	0x19
	.long	0x9ba
	.uleb128 0x3
	.byte	0x91
	.sleb128 -232
	.uleb128 0x24
	.long	.LASF216
	.byte	0x1
	.byte	0xf4
	.byte	0x2c
	.long	0x343
	.uleb128 0x3
	.byte	0x91
	.sleb128 -240
	.uleb128 0x25
	.long	.LASF219
	.byte	0x1
	.byte	0xf5
	.byte	0xa
	.long	0x39c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -192
	.uleb128 0x26
	.string	"now"
	.byte	0x1
	.byte	0xf6
	.byte	0xc
	.long	0x361
	.uleb128 0x3
	.byte	0x91
	.sleb128 -216
	.uleb128 0x26
	.string	"ts"
	.byte	0x1
	.byte	0xf7
	.byte	0x10
	.long	0x1751
	.uleb128 0x3
	.byte	0x91
	.sleb128 -208
	.uleb128 0x1a
	.long	.LASF220
	.byte	0x1
	.value	0x101
	.byte	0xa
	.long	0x1757
	.uleb128 0x3
	.byte	0x91
	.sleb128 -160
	.uleb128 0x1a
	.long	.LASF217
	.byte	0x1
	.value	0x105
	.byte	0xb
	.long	0x309
	.uleb128 0x3
	.byte	0x91
	.sleb128 -200
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x3c7
	.uleb128 0xc
	.long	0x109
	.long	0x1767
	.uleb128 0xd
	.long	0x39
	.byte	0x7f
	.byte	0
	.uleb128 0x23
	.long	.LASF221
	.byte	0x1
	.byte	0xe4
	.byte	0x6
	.quad	.LFB17
	.quad	.LFE17-.LFB17
	.uleb128 0x1
	.byte	0x9c
	.long	0x17d2
	.uleb128 0x24
	.long	.LASF216
	.byte	0x1
	.byte	0xe4
	.byte	0x24
	.long	0x343
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x24
	.long	.LASF115
	.byte	0x1
	.byte	0xe4
	.byte	0x3e
	.long	0x17d2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x24
	.long	.LASF222
	.byte	0x1
	.byte	0xe4
	.byte	0x4b
	.long	0x17d8
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.uleb128 0x25
	.long	.LASF217
	.byte	0x1
	.byte	0xe5
	.byte	0xb
	.long	0x309
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x25
	.long	.LASF223
	.byte	0x1
	.byte	0xe8
	.byte	0x9
	.long	0x65
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x69b
	.uleb128 0x6
	.byte	0x8
	.long	0x65
	.uleb128 0x23
	.long	.LASF224
	.byte	0x1
	.byte	0xcd
	.byte	0x6
	.quad	.LFB16
	.quad	.LFE16-.LFB16
	.uleb128 0x1
	.byte	0x9c
	.long	0x1839
	.uleb128 0x24
	.long	.LASF216
	.byte	0x1
	.byte	0xcd
	.byte	0x24
	.long	0x343
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x24
	.long	.LASF167
	.byte	0x1
	.byte	0xcd
	.byte	0x39
	.long	0xa44
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x25
	.long	.LASF217
	.byte	0x1
	.byte	0xce
	.byte	0xb
	.long	0x309
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x25
	.long	.LASF223
	.byte	0x1
	.byte	0xd1
	.byte	0x9
	.long	0x65
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.byte	0
	.uleb128 0x23
	.long	.LASF225
	.byte	0x1
	.byte	0xc2
	.byte	0x6
	.quad	.LFB15
	.quad	.LFE15-.LFB15
	.uleb128 0x1
	.byte	0x9c
	.long	0x18c7
	.uleb128 0x24
	.long	.LASF152
	.byte	0x1
	.byte	0xc2
	.byte	0x1c
	.long	0x9ba
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x24
	.long	.LASF138
	.byte	0x1
	.byte	0xc2
	.byte	0x30
	.long	0xbc9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x24
	.long	.LASF167
	.byte	0x1
	.byte	0xc2
	.byte	0x48
	.long	0xa44
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x1b
	.quad	.LBB30
	.quad	.LBE30-.LBB30
	.uleb128 0x25
	.long	.LASF157
	.byte	0x1
	.byte	0xc4
	.byte	0xe
	.long	0x65
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x1b
	.quad	.LBB31
	.quad	.LBE31-.LBB31
	.uleb128 0x25
	.long	.LASF168
	.byte	0x1
	.byte	0xc5
	.byte	0x10
	.long	0x7f5
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x27
	.long	.LASF226
	.byte	0x1
	.byte	0xb7
	.byte	0x6
	.quad	.LFB14
	.quad	.LFE14-.LFB14
	.uleb128 0x1
	.byte	0x9c
	.long	0x194a
	.uleb128 0x24
	.long	.LASF168
	.byte	0x1
	.byte	0xb7
	.byte	0x1a
	.long	0x7f5
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x24
	.long	.LASF227
	.byte	0x1
	.byte	0xb7
	.byte	0x27
	.long	0x3ac
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x1e
	.quad	.LBB28
	.quad	.LBE28-.LBB28
	.long	0x1928
	.uleb128 0x25
	.long	.LASF228
	.byte	0x1
	.byte	0xb9
	.byte	0x11
	.long	0x2d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.byte	0
	.uleb128 0x1b
	.quad	.LBB29
	.quad	.LBE29-.LBB29
	.uleb128 0x25
	.long	.LASF229
	.byte	0x1
	.byte	0xbc
	.byte	0x11
	.long	0x2d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.byte	0
	.uleb128 0x27
	.long	.LASF230
	.byte	0x1
	.byte	0x98
	.byte	0x6
	.quad	.LFB13
	.quad	.LFE13-.LFB13
	.uleb128 0x1
	.byte	0x9c
	.long	0x1aa7
	.uleb128 0x24
	.long	.LASF168
	.byte	0x1
	.byte	0x98
	.byte	0x1e
	.long	0x7f5
	.uleb128 0x3
	.byte	0x91
	.sleb128 -104
	.uleb128 0x24
	.long	.LASF231
	.byte	0x1
	.byte	0x98
	.byte	0x2c
	.long	0x2d
	.uleb128 0x3
	.byte	0x91
	.sleb128 -112
	.uleb128 0x1e
	.quad	.LBB20
	.quad	.LBE20-.LBB20
	.long	0x1a43
	.uleb128 0x25
	.long	.LASF232
	.byte	0x1
	.byte	0x9a
	.byte	0x11
	.long	0x2d
	.uleb128 0x3
	.byte	0x91
	.sleb128 -88
	.uleb128 0x1b
	.quad	.LBB21
	.quad	.LBE21-.LBB21
	.uleb128 0x25
	.long	.LASF233
	.byte	0x1
	.byte	0x9b
	.byte	0x15
	.long	0x2d
	.uleb128 0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0x1b
	.quad	.LBB22
	.quad	.LBE22-.LBB22
	.uleb128 0x25
	.long	.LASF234
	.byte	0x1
	.byte	0x9c
	.byte	0x14
	.long	0x2d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x1b
	.quad	.LBB23
	.quad	.LBE23-.LBB23
	.uleb128 0x25
	.long	.LASF228
	.byte	0x1
	.byte	0xa0
	.byte	0x19
	.long	0x2d
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.uleb128 0x1b
	.quad	.LBB24
	.quad	.LBE24-.LBB24
	.uleb128 0x25
	.long	.LASF235
	.byte	0x1
	.byte	0xa1
	.byte	0x18
	.long	0x2d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x25
	.long	.LASF236
	.byte	0x1
	.byte	0xa2
	.byte	0x18
	.long	0x2d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x1b
	.quad	.LBB25
	.quad	.LBE25-.LBB25
	.uleb128 0x25
	.long	.LASF233
	.byte	0x1
	.byte	0xaa
	.byte	0x11
	.long	0x2d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x1b
	.quad	.LBB26
	.quad	.LBE26-.LBB26
	.uleb128 0x25
	.long	.LASF228
	.byte	0x1
	.byte	0xae
	.byte	0x15
	.long	0x2d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x1b
	.quad	.LBB27
	.quad	.LBE27-.LBB27
	.uleb128 0x25
	.long	.LASF235
	.byte	0x1
	.byte	0xaf
	.byte	0x14
	.long	0x2d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x27
	.long	.LASF237
	.byte	0x1
	.byte	0x8b
	.byte	0x6
	.quad	.LFB12
	.quad	.LFE12-.LFB12
	.uleb128 0x1
	.byte	0x9c
	.long	0x1b57
	.uleb128 0x24
	.long	.LASF168
	.byte	0x1
	.byte	0x8b
	.byte	0x1b
	.long	0x7f5
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x24
	.long	.LASF115
	.byte	0x1
	.byte	0x8b
	.byte	0x31
	.long	0x69b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x24
	.long	.LASF231
	.byte	0x1
	.byte	0x8b
	.byte	0x40
	.long	0x2d
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.uleb128 0x1b
	.quad	.LBB17
	.quad	.LBE17-.LBB17
	.uleb128 0x25
	.long	.LASF232
	.byte	0x1
	.byte	0x8d
	.byte	0x11
	.long	0x2d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x1b
	.quad	.LBB18
	.quad	.LBE18-.LBB18
	.uleb128 0x25
	.long	.LASF233
	.byte	0x1
	.byte	0x8e
	.byte	0x15
	.long	0x2d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x1b
	.quad	.LBB19
	.quad	.LBE19-.LBB19
	.uleb128 0x25
	.long	.LASF238
	.byte	0x1
	.byte	0x8f
	.byte	0x14
	.long	0x2d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x27
	.long	.LASF239
	.byte	0x1
	.byte	0x80
	.byte	0x6
	.quad	.LFB11
	.quad	.LFE11-.LFB11
	.uleb128 0x1
	.byte	0x9c
	.long	0x1c16
	.uleb128 0x24
	.long	.LASF168
	.byte	0x1
	.byte	0x80
	.byte	0x23
	.long	0x7f5
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x24
	.long	.LASF115
	.byte	0x1
	.byte	0x80
	.byte	0x39
	.long	0x69b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x24
	.long	.LASF231
	.byte	0x1
	.byte	0x80
	.byte	0x48
	.long	0x2d
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.uleb128 0x1b
	.quad	.LBB14
	.quad	.LBE14-.LBB14
	.uleb128 0x25
	.long	.LASF176
	.byte	0x1
	.byte	0x82
	.byte	0x11
	.long	0x2d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x1b
	.quad	.LBB15
	.quad	.LBE15-.LBB15
	.uleb128 0x25
	.long	.LASF240
	.byte	0x1
	.byte	0x83
	.byte	0x15
	.long	0x2d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x1b
	.quad	.LBB16
	.quad	.LBE16-.LBB16
	.uleb128 0x25
	.long	.LASF177
	.byte	0x1
	.byte	0x84
	.byte	0x13
	.long	0x3ac
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x25
	.long	.LASF241
	.byte	0x1
	.byte	0x85
	.byte	0x14
	.long	0x2d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x23
	.long	.LASF242
	.byte	0x1
	.byte	0x76
	.byte	0x6
	.quad	.LFB10
	.quad	.LFE10-.LFB10
	.uleb128 0x1
	.byte	0x9c
	.long	0x1ca4
	.uleb128 0x24
	.long	.LASF152
	.byte	0x1
	.byte	0x76
	.byte	0x1b
	.long	0x9ba
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x24
	.long	.LASF138
	.byte	0x1
	.byte	0x76
	.byte	0x2f
	.long	0xbc9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x24
	.long	.LASF167
	.byte	0x1
	.byte	0x76
	.byte	0x47
	.long	0xa44
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x1b
	.quad	.LBB12
	.quad	.LBE12-.LBB12
	.uleb128 0x25
	.long	.LASF157
	.byte	0x1
	.byte	0x78
	.byte	0x11
	.long	0x2d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x1b
	.quad	.LBB13
	.quad	.LBE13-.LBB13
	.uleb128 0x25
	.long	.LASF168
	.byte	0x1
	.byte	0x79
	.byte	0x10
	.long	0x7f5
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x23
	.long	.LASF243
	.byte	0x1
	.byte	0x60
	.byte	0x6
	.quad	.LFB9
	.quad	.LFE9-.LFB9
	.uleb128 0x1
	.byte	0x9c
	.long	0x1da1
	.uleb128 0x24
	.long	.LASF168
	.byte	0x1
	.byte	0x60
	.byte	0x1d
	.long	0x7f5
	.uleb128 0x3
	.byte	0x91
	.sleb128 -88
	.uleb128 0x24
	.long	.LASF231
	.byte	0x1
	.byte	0x60
	.byte	0x2b
	.long	0x2d
	.uleb128 0x3
	.byte	0x91
	.sleb128 -96
	.uleb128 0x1b
	.quad	.LBB7
	.quad	.LBE7-.LBB7
	.uleb128 0x25
	.long	.LASF176
	.byte	0x1
	.byte	0x62
	.byte	0x11
	.long	0x2d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x1b
	.quad	.LBB8
	.quad	.LBE8-.LBB8
	.uleb128 0x25
	.long	.LASF244
	.byte	0x1
	.byte	0x63
	.byte	0xf
	.long	0x3ac
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.uleb128 0x25
	.long	.LASF245
	.byte	0x1
	.byte	0x6a
	.byte	0xf
	.long	0x3ac
	.uleb128 0x3
	.byte	0x91
	.sleb128 -68
	.uleb128 0x1e
	.quad	.LBB9
	.quad	.LBE9-.LBB9
	.long	0x1d58
	.uleb128 0x25
	.long	.LASF233
	.byte	0x1
	.byte	0x64
	.byte	0x15
	.long	0x2d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.byte	0
	.uleb128 0x1e
	.quad	.LBB10
	.quad	.LBE10-.LBB10
	.long	0x1d7d
	.uleb128 0x25
	.long	.LASF233
	.byte	0x1
	.byte	0x6b
	.byte	0x15
	.long	0x2d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.byte	0
	.uleb128 0x1b
	.quad	.LBB11
	.quad	.LBE11-.LBB11
	.uleb128 0x25
	.long	.LASF233
	.byte	0x1
	.byte	0x70
	.byte	0x15
	.long	0x2d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x23
	.long	.LASF246
	.byte	0x1
	.byte	0x57
	.byte	0x6
	.quad	.LFB8
	.quad	.LFE8-.LFB8
	.uleb128 0x1
	.byte	0x9c
	.long	0x1e20
	.uleb128 0x24
	.long	.LASF168
	.byte	0x1
	.byte	0x57
	.byte	0x1a
	.long	0x7f5
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x24
	.long	.LASF231
	.byte	0x1
	.byte	0x57
	.byte	0x28
	.long	0x2d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x1b
	.quad	.LBB5
	.quad	.LBE5-.LBB5
	.uleb128 0x25
	.long	.LASF176
	.byte	0x1
	.byte	0x59
	.byte	0x11
	.long	0x2d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x1b
	.quad	.LBB6
	.quad	.LBE6-.LBB6
	.uleb128 0x25
	.long	.LASF233
	.byte	0x1
	.byte	0x5a
	.byte	0x15
	.long	0x2d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x27
	.long	.LASF247
	.byte	0x1
	.byte	0x49
	.byte	0x6
	.quad	.LFB7
	.quad	.LFE7-.LFB7
	.uleb128 0x1
	.byte	0x9c
	.long	0x1ee0
	.uleb128 0x24
	.long	.LASF168
	.byte	0x1
	.byte	0x49
	.byte	0x1c
	.long	0x7f5
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x24
	.long	.LASF248
	.byte	0x1
	.byte	0x49
	.byte	0x2a
	.long	0x764
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x24
	.long	.LASF249
	.byte	0x1
	.byte	0x49
	.byte	0x38
	.long	0x764
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.uleb128 0x24
	.long	.LASF231
	.byte	0x1
	.byte	0x49
	.byte	0x47
	.long	0x2d
	.uleb128 0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0x1b
	.quad	.LBB2
	.quad	.LBE2-.LBB2
	.uleb128 0x25
	.long	.LASF176
	.byte	0x1
	.byte	0x4b
	.byte	0x11
	.long	0x2d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x1b
	.quad	.LBB3
	.quad	.LBE3-.LBB3
	.uleb128 0x25
	.long	.LASF233
	.byte	0x1
	.byte	0x4c
	.byte	0x15
	.long	0x2d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x1b
	.quad	.LBB4
	.quad	.LBE4-.LBB4
	.uleb128 0x25
	.long	.LASF250
	.byte	0x1
	.byte	0x4e
	.byte	0x19
	.long	0x2d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x28
	.long	.LASF251
	.byte	0x1
	.byte	0x36
	.byte	0x7
	.long	0x103
	.quad	.LFB6
	.quad	.LFE6-.LFB6
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x24
	.long	.LASF252
	.byte	0x1
	.byte	0x36
	.byte	0x21
	.long	0x343
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x24
	.long	.LASF253
	.byte	0x1
	.byte	0x36
	.byte	0x33
	.long	0x343
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x25
	.long	.LASF254
	.byte	0x1
	.byte	0x38
	.byte	0xb
	.long	0x103
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.byte	0
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x10
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x13
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x21
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0x5
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x13
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x15
	.byte	0x1
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0x15
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x1b
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.byte	0
	.byte	0
	.uleb128 0x1c
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1d
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x1e
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1f
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x20
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x21
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x22
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x23
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x24
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x25
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x26
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x27
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x28
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",@progbits
	.long	0x2c
	.value	0x2
	.long	.Ldebug_info0
	.byte	0x8
	.byte	0
	.value	0
	.value	0
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.quad	0
	.quad	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF108:
	.string	"__glibc_reserved"
.LASF107:
	.string	"st_ctim"
.LASF7:
	.string	"size_t"
.LASF71:
	.string	"tm_hour"
.LASF131:
	.string	"activation_forward"
.LASF103:
	.string	"st_blksize"
.LASF104:
	.string	"st_blocks"
.LASF52:
	.string	"_IO_codecvt"
.LASF138:
	.string	"activations"
.LASF118:
	.string	"cols"
.LASF32:
	.string	"_IO_save_end"
.LASF10:
	.string	"__gid_t"
.LASF186:
	.string	"loss"
.LASF106:
	.string	"st_mtim"
.LASF160:
	.string	"mini_batch_data"
.LASF60:
	.string	"time_t"
.LASF227:
	.string	"learning_rate"
.LASF214:
	.string	"file_timestamp"
.LASF25:
	.string	"_IO_write_base"
.LASF41:
	.string	"_lock"
.LASF200:
	.string	"xavier_initialize_layer"
.LASF141:
	.string	"grads"
.LASF230:
	.string	"matmul_backward"
.LASF173:
	.string	"idx_pixel"
.LASF93:
	.string	"stat"
.LASF121:
	.string	"weights"
.LASF80:
	.string	"__tzname"
.LASF30:
	.string	"_IO_save_base"
.LASF244:
	.string	"max_logit"
.LASF169:
	.string	"free_activations"
.LASF34:
	.string	"_chain"
.LASF38:
	.string	"_cur_column"
.LASF57:
	.string	"sys_nerr"
.LASF8:
	.string	"__dev_t"
.LASF147:
	.string	"data_path"
.LASF116:
	.string	"nImages"
.LASF109:
	.string	"__environ"
.LASF6:
	.string	"long int"
.LASF77:
	.string	"tm_isdst"
.LASF136:
	.string	"size_parameters"
.LASF201:
	.string	"kaiming_initialize_layer"
.LASF239:
	.string	"loss_softmax_backward"
.LASF154:
	.string	"epoch"
.LASF51:
	.string	"_IO_marker"
.LASF185:
	.string	"get_loss"
.LASF155:
	.string	"main"
.LASF196:
	.string	"allocate_parameters_memory"
.LASF170:
	.string	"initialise_activations"
.LASF204:
	.string	"stddev"
.LASF4:
	.string	"signed char"
.LASF17:
	.string	"__blksize_t"
.LASF61:
	.string	"_IO_FILE"
.LASF82:
	.string	"__timezone"
.LASF53:
	.string	"_IO_wide_data"
.LASF98:
	.string	"st_uid"
.LASF156:
	.string	"free_model"
.LASF219:
	.string	"timestamp"
.LASF195:
	.string	"initialize_model"
.LASF245:
	.string	"sum_exp"
.LASF243:
	.string	"softmax_forward"
.LASF2:
	.string	"unsigned char"
.LASF45:
	.string	"_freeres_list"
.LASF137:
	.string	"Model"
.LASF101:
	.string	"st_rdev"
.LASF114:
	.string	"images"
.LASF126:
	.string	"gradients_output"
.LASF203:
	.string	"generate_kaiming_number"
.LASF218:
	.string	"save_model"
.LASF19:
	.string	"__syscall_slong_t"
.LASF90:
	.string	"d_type"
.LASF20:
	.string	"char"
.LASF152:
	.string	"model"
.LASF166:
	.string	"initialise_gradients"
.LASF249:
	.string	"output"
.LASF128:
	.string	"gradients_biases"
.LASF258:
	.string	"_IO_lock_t"
.LASF91:
	.string	"d_name"
.LASF216:
	.string	"filename"
.LASF85:
	.string	"timezone"
.LASF117:
	.string	"rows"
.LASF12:
	.string	"__mode_t"
.LASF70:
	.string	"tm_min"
.LASF22:
	.string	"_IO_read_ptr"
.LASF184:
	.string	"max_val"
.LASF122:
	.string	"biases"
.LASF144:
	.string	"data_training"
.LASF54:
	.string	"stdin"
.LASF179:
	.string	"predicted_label"
.LASF58:
	.string	"sys_errlist"
.LASF119:
	.string	"InputData"
.LASF248:
	.string	"input"
.LASF33:
	.string	"_markers"
.LASF217:
	.string	"file"
.LASF72:
	.string	"tm_mday"
.LASF161:
	.string	"idx_mini_batch_image"
.LASF231:
	.string	"size_batch"
.LASF142:
	.string	"size_grads"
.LASF69:
	.string	"tm_sec"
.LASF42:
	.string	"_offset"
.LASF99:
	.string	"st_gid"
.LASF178:
	.string	"offset_probs_dist"
.LASF111:
	.string	"optind"
.LASF92:
	.string	"__dirstream"
.LASF134:
	.string	"layers"
.LASF0:
	.string	"long unsigned int"
.LASF220:
	.string	"filename_time"
.LASF212:
	.string	"full_filename"
.LASF36:
	.string	"_flags2"
.LASF102:
	.string	"st_size"
.LASF226:
	.string	"update_layer"
.LASF24:
	.string	"_IO_read_base"
.LASF49:
	.string	"_unused2"
.LASF175:
	.string	"probs"
.LASF139:
	.string	"size_activations"
.LASF240:
	.string	"idx_logit"
.LASF158:
	.string	"initialise_mini_batch"
.LASF199:
	.string	"add_layer"
.LASF163:
	.string	"free_mini_batch_memory"
.LASF37:
	.string	"_old_offset"
.LASF241:
	.string	"offset_logit"
.LASF18:
	.string	"__blkcnt_t"
.LASF11:
	.string	"__ino_t"
.LASF256:
	.string	"src/deep.c"
.LASF59:
	.string	"long long int"
.LASF193:
	.string	"print_layer_biases"
.LASF73:
	.string	"tm_mon"
.LASF129:
	.string	"size_inputs"
.LASF222:
	.string	"nLabels"
.LASF235:
	.string	"offset_weight"
.LASF67:
	.string	"double"
.LASF27:
	.string	"_IO_write_end"
.LASF238:
	.string	"offset_grad"
.LASF133:
	.string	"generate_number"
.LASF191:
	.string	"free_layer"
.LASF202:
	.string	"initialize_layer"
.LASF66:
	.string	"float"
.LASF211:
	.string	"latest_timestamp"
.LASF120:
	.string	"Layer"
.LASF207:
	.string	"load_model"
.LASF28:
	.string	"_IO_buf_base"
.LASF165:
	.string	"free_gradients"
.LASF1:
	.string	"unsigned int"
.LASF187:
	.string	"start_sample"
.LASF100:
	.string	"__pad0"
.LASF83:
	.string	"tzname"
.LASF47:
	.string	"__pad5"
.LASF168:
	.string	"layer"
.LASF115:
	.string	"labels"
.LASF143:
	.string	"Gradients"
.LASF21:
	.string	"_flags"
.LASF146:
	.string	"data_mini_batch"
.LASF198:
	.string	"offset"
.LASF86:
	.string	"dirent"
.LASF48:
	.string	"_mode"
.LASF250:
	.string	"idx_input"
.LASF252:
	.string	"str1"
.LASF253:
	.string	"str2"
.LASF127:
	.string	"gradients_weights"
.LASF176:
	.string	"idx_image"
.LASF43:
	.string	"_codecvt"
.LASF257:
	.string	"/home/rickojn/coding/deep"
.LASF172:
	.string	"outputs"
.LASF181:
	.string	"arg_max"
.LASF189:
	.string	"prob_sum"
.LASF96:
	.string	"st_nlink"
.LASF236:
	.string	"offset_input"
.LASF246:
	.string	"relu_forward"
.LASF242:
	.string	"model_forward"
.LASF229:
	.string	"idx_bias"
.LASF50:
	.string	"FILE"
.LASF251:
	.string	"concatStrings"
.LASF247:
	.string	"matmul_forward"
.LASF94:
	.string	"st_dev"
.LASF209:
	.string	"entry"
.LASF62:
	.string	"timespec"
.LASF153:
	.string	"gradients"
.LASF210:
	.string	"file_info"
.LASF113:
	.string	"optopt"
.LASF182:
	.string	"size"
.LASF65:
	.string	"long long unsigned int"
.LASF162:
	.string	"idx_training_image"
.LASF68:
	.string	"signgam"
.LASF14:
	.string	"__off_t"
.LASF46:
	.string	"_freeres_buf"
.LASF75:
	.string	"tm_wday"
.LASF188:
	.string	"print_probs"
.LASF76:
	.string	"tm_yday"
.LASF112:
	.string	"opterr"
.LASF16:
	.string	"__time_t"
.LASF31:
	.string	"_IO_backup_base"
.LASF40:
	.string	"_shortbuf"
.LASF145:
	.string	"data_test"
.LASF15:
	.string	"__off64_t"
.LASF164:
	.string	"allocate_mini_batch_memory"
.LASF254:
	.string	"newStr"
.LASF29:
	.string	"_IO_buf_end"
.LASF183:
	.string	"max_idx"
.LASF123:
	.string	"activations_input"
.LASF148:
	.string	"training_images_path"
.LASF78:
	.string	"tm_gmtoff"
.LASF150:
	.string	"test_images_path"
.LASF56:
	.string	"stderr"
.LASF5:
	.string	"short int"
.LASF64:
	.string	"tv_nsec"
.LASF88:
	.string	"d_off"
.LASF225:
	.string	"model_backward"
.LASF39:
	.string	"_vtable_offset"
.LASF205:
	.string	"generate_xavier_number"
.LASF149:
	.string	"training_labels_path"
.LASF255:
	.string	"GNU C17 9.4.0 -mtune=generic -march=x86-64 -g -fasynchronous-unwind-tables -fstack-protector-strong -fstack-clash-protection -fcf-protection"
.LASF151:
	.string	"test_labels_path"
.LASF89:
	.string	"d_reclen"
.LASF81:
	.string	"__daylight"
.LASF79:
	.string	"tm_zone"
.LASF157:
	.string	"idx_layer"
.LASF180:
	.string	"get_accuracy"
.LASF124:
	.string	"activations_output"
.LASF213:
	.string	"latest_fullname"
.LASF192:
	.string	"print_layer"
.LASF194:
	.string	"print_layer_weights"
.LASF97:
	.string	"st_mode"
.LASF9:
	.string	"__uid_t"
.LASF23:
	.string	"_IO_read_end"
.LASF87:
	.string	"d_ino"
.LASF159:
	.string	"training_data"
.LASF232:
	.string	"idx_sample"
.LASF174:
	.string	"correct"
.LASF208:
	.string	"dirname"
.LASF130:
	.string	"size_neurons"
.LASF35:
	.string	"_fileno"
.LASF44:
	.string	"_wide_data"
.LASF224:
	.string	"read_mnist_images"
.LASF110:
	.string	"optarg"
.LASF234:
	.string	"offset_grad_pre_act"
.LASF132:
	.string	"activation_backward"
.LASF74:
	.string	"tm_year"
.LASF3:
	.string	"short unsigned int"
.LASF55:
	.string	"stdout"
.LASF206:
	.string	"generate_normal_random_number"
.LASF215:
	.string	"load_model_from_file"
.LASF26:
	.string	"_IO_write_ptr"
.LASF135:
	.string	"size_layers"
.LASF177:
	.string	"label"
.LASF84:
	.string	"daylight"
.LASF197:
	.string	"parameters"
.LASF221:
	.string	"read_mnist_labels"
.LASF95:
	.string	"st_ino"
.LASF223:
	.string	"temp"
.LASF125:
	.string	"gradients_input"
.LASF13:
	.string	"__nlink_t"
.LASF233:
	.string	"idx_neuron"
.LASF171:
	.string	"inputs"
.LASF228:
	.string	"idx_weight"
.LASF167:
	.string	"data"
.LASF63:
	.string	"tv_sec"
.LASF237:
	.string	"relu_backward"
.LASF190:
	.string	"idx_prob"
.LASF140:
	.string	"Activations"
.LASF105:
	.string	"st_atim"
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04.2) 9.4.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	 1f - 0f
	.long	 4f - 1f
	.long	 5
0:
	.string	 "GNU"
1:
	.align 8
	.long	 0xc0000002
	.long	 3f - 2f
2:
	.long	 0x3
3:
	.align 8
4:
