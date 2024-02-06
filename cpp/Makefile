SRC_DIR=src
OBJ_DIR=obj

CUDA_CC=nvcc
CUDA_FLAGS = -I $(CUDA_LIBRARY_PATH)/include -I. -L $(CUDA_LIBRARY_PATH)/lib64 -lcudart -lcurand 

CUDA_HEADER_FILES = $(wildcard $(SRC_DIR)/*.cuh)
CUDA_SOURCE_FILES := $(wildcard $(SRC_DIR)/*.cu)
CUDA_OBJECTS := $(patsubst $(SRC_DIR)/%.cu, $(OBJ_DIR)/%.o, $(CUDA_SOURCE_FILES))

CUDA_OBJ := $(patsubst $(SRC_DIR)/%.cu, $(OBJ_DIR)/%-cuda.o, $(CUDA_SOURCE_FILES))

$(OBJ_DIR)/%-cuda.o: $(SRC_DIR)/%.cu $(CUDA_HEADER_FILES)
	$(CUDA_CC) -c -o $@ $< $(CUDA_FLAGS) --compiler-options -fPIC

program: $(CUDA_OBJ)
	g++ src/main.cpp $(CUDA_OBJ) -o $@ $(CUDA_FLAGS)

library: $(CUDA_OBJ)
	g++ -shared -o $@.so $(CUDA_OBJ) $(CUDA_FLAGS) 

clean:
	rm obj/*
	rm program
	rm library.so
