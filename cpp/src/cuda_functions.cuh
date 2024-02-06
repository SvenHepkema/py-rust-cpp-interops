#ifndef CUDA_FUNCTIONS_CUH
#define CUDA_FUNCTIONS_CUH

#ifdef __cplusplus
extern "C" {
#endif

void add_vectors(const int size, const int *A, const int *B, int *C);

#ifdef __cplusplus
}
#endif

#endif
