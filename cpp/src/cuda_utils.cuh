#include <stdexcept>
#include <string>
#include <vector>
#include <cstdio>

#ifndef CUDA_UTILS_H
#define CUDA_UTILS_H


void check_status(const cudaError status, const std::string action);

template<typename T>
class GPUArray {
private:
	T* pointer;
	int size;
	int byte_size;

public: 
	GPUArray(const int size) : size(size), byte_size(size * sizeof(T)) {
		check_status(
			cudaMalloc(&pointer, byte_size),
			"constructor malloc");
	}

	~GPUArray() {
  	check_status(
  		cudaFree(pointer),
			"destructor free");
	}

	T* get_pointer() const {
		return pointer;
	}

	T* get_pointer_at_offset(const int offset) const {
		return &pointer[offset];
	}

	void set_all_values_to(const T value) {
  	check_status(
				cudaMemset(pointer, value, byte_size),
				"set all values to");
	}

	void copy_from(const T* cpu_array) {
  	check_status(
				cudaMemcpy(pointer, cpu_array, byte_size, cudaMemcpyHostToDevice),
				"copy from");
	}

	void copy_to(T* cpu_array) {
  	check_status(
				cudaMemcpy(cpu_array, pointer, byte_size, cudaMemcpyDeviceToHost),
				"copy to");
	}

	void copy_from_async(const T* cpu_array, const int offset, const int n_elements, 
			cudaStream_t &stream) {
  	check_status(
				cudaMemcpyAsync(&pointer[offset], &cpu_array[offset], n_elements * sizeof(T), 
					cudaMemcpyHostToDevice, stream),
				"copy from async");
	}

	void copy_to_async(T* cpu_array, const int offset, const int n_elements, 
			cudaStream_t &stream) {
  	check_status(
				cudaMemcpyAsync(&cpu_array[offset], &pointer[offset], n_elements * sizeof(T), 
					cudaMemcpyDeviceToHost, stream),
				"copy to async");
	}
};

#endif // CUDA_UTILS_H
