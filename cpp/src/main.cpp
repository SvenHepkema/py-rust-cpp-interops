#include <cstddef>
#include <iostream>
#include <string>

#include "cuda_functions.cuh"

const int DEFAULT_ARRAY_SIZE = 1000 * 1000;
const int PRINT_LIMIT = 5;

const int DEFAULT_ARRAY_DIMENSION = 20 * 1000;

int main(int argc, char *argv[]) {
  int *A, *B, *C;
  size_t bytes;
  int N = DEFAULT_ARRAY_SIZE;

  // Overridable size by passing a number to the executable
  if (argc > 1) {
    N = std::stoi(argv[1]);
  }

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
  std::cout << "Initialized: A[0] = " << A[0] 
		<< " A[N-1] = " << A[N-1] << std::endl;

  // Calculate
  add_vectors(N, A, B, C);

  // Print post calculation
  std::cout << std::endl << "Added them together: C[0] = " << C[0] 
		<< " C[N-1] = " << C[N-1] << std::endl;

  // Free the arrays
  free(A);
  free(B);
  free(C);

  return 0;
}
