LIB_DIR=/home/heppie/projects/py-rust-cpp-interops/cpp 

program: main.c
	gcc main.c -L$(LIB_DIR) -Wl,-rpath $(LIB_DIR) -lrary -o $@ 

clean:
	rm program
