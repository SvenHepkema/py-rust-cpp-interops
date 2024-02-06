#!/usr/bin/python3

import py_rs_interop 

n = 5
a = [1, 2, 3, 4, 5]
b = [1, 2, 3, 4, 5]
c = [0, 0, 0, 0, 0]

print(a, b, c)

print("Adding vectors")
c = py_rs_interop.rs_add_vectors(n, a, b, c)

print(a, b, c)
