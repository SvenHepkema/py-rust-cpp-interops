# py-rust-cpp-interops

This project demonstrates the interoperability between C, C++, Rust and Python via shared library files. A very simple CUDA function to add two vectors together is written in C++ and compiled to a shared library with a C interface. This library can then be used by programs written in C, Rust and Python, also demonstrating how these languages can make use of the GPU via C++.

Functionality:

- C++ code to sum two vectors together and store the result into a third vector using CUDA to make use of the GPU.
- C code that interoperates with the C++ add vectors function.
- Rust code that interoperates with the C++ add vectors function.
- Python code that interoperates with the C++ add vectors function.
- Python code that interoperates via Rust (using [PyO3](https://github.com/PyO3/pyo3)) with the C++ add vectors function. (Double interoperation).
