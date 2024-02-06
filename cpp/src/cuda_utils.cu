#include "cuda_utils.cuh"

void check_status(const cudaError status, const std::string action) {
	if (status != cudaSuccess) {
		throw std::runtime_error("CUDA error during \"" + action + "\": " 
				+ std::to_string(status) + " " + cudaGetErrorString(status));
	}
}
