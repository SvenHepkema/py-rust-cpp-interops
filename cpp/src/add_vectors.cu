#include <cmath>
#include <cstdio>
#include <cstddef>

#include "cuda_utils.cuh"

// Kernel definition
__global__ void device_add_vectors(const int size, const int *A, const int *B,
                                 int *C) {
  // Calculate id of thread, based on which block it is in and which thread
  // within the block
  int i = blockIdx.x * blockDim.x + threadIdx.x;

  if (i < size) {
    C[i] = A[i] + B[i];
  }
}

int* alloc_vector_host(const int size) {
	int* vector;
	check_status(
			cudaMallocHost((void **)&vector, size * sizeof(int)), 
			"alloc vector");
	return vector;
}

void free_vector_host(int* vector) {
	cudaFreeHost(vector);
}

void add_vectors(const int size, const int *A, const int *B, int *C) {
  // Initialize device (GPU memory) pointers
	GPUArray<int> gpu_A(size), gpu_B(size), gpu_C(size);

	gpu_A.copy_from(A);
	gpu_B.copy_from(B);

  // Number of threads per block
  int blockSize = 1024;
  // Size of grid, number of blocks needed
  int gridSize = (int)std::ceil((float)size / blockSize);

  // Execute calculation
  // NOTICE: You pass the device pointers, not the host pointers
  device_add_vectors<<<gridSize, blockSize>>>(size, gpu_A.get_pointer(), gpu_B.get_pointer(), gpu_C.get_pointer());

	gpu_C.copy_to(C);
}
