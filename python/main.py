#!/usr/bin/python3

import library

n = 5
a = [1, 2, 3, 4, 5]
b = [1, 2, 3, 4, 5]
c = [0, 0, 0, 0, 0]

print(a, b, c)

print("Adding vectors")
library.add_vectors(n, a, b, c)

print(a, b, c)
