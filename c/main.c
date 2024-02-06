#include <stdio.h> 
#include <stdlib.h> 

#include "../cpp/src/cuda_functions.cuh"

const int DEFAULT_ARRAY_SIZE = 1000 * 1000;

int main(int argc, char *argv[]) {
  int *A, *B, *C;
  int bytes;
  int N = DEFAULT_ARRAY_SIZE;


  // Calculate array size
  bytes = N * sizeof(int);

  // Allocate memory for arrays
  A = (int *)malloc(bytes);
  B = (int *)malloc(bytes);
  C = (int *)malloc(bytes);

  // Initialize the calculation
  for (int i = 0; i < N; i++) {
    A[i] = i + 1;
    B[i] = i + 1;
  }

  // Print pre calculation
  printf("C Implementation, calling the CUDA code via C++\n");
  printf("Initialized: A[0] = %d  A[N-1] = %d\n", A[0], A[N-1]);

  // Calculate
  add_vectors(N, A, B, C);

  // Print post calculation
  printf("Added them together: C[0] = %d C[N-1] = %d\n", C[0], C[N-1]);

  // Free the arrays
  free(A);
  free(B);
  free(C);

  return 0;
}
