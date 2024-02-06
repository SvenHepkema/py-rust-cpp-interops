# py-rust-cpp-interops

This project is a prototype for testing how interoperability between python and Rust, and between Rust and C++ works. Goal of this project is to use the GPU with a C++ CUDA implementation via Rust in Python.

The project will allow the user to write in python code to subtract or add vectors. The vector object is interoperated with Rust, which will call the CUDA C++ code. The C++ code only implements two functions, one to add two vectors, and the other to subtract two vectors. 

Obviously it is also possible to do this directly by calling C++ code from python, but this project serves as a prototype to learn how both Python interoperates with Rust and how Rust interoperates with C++.
