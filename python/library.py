import ctypes
from typing import List

lib = ctypes.cdll.LoadLibrary('../cpp/library.so')
lib.add_vectors.argtypes = [
    ctypes.c_int32,
    ctypes.POINTER(ctypes.c_int32),
    ctypes.POINTER(ctypes.c_int32),
    ctypes.POINTER(ctypes.c_int32),
]
lib.add_vectors.restype = None

def add_vectors(size: int, a: List[int], b: List[int], c: List[int]) -> None:
    c_vector = ctypes.c_int32 * size
    a_c_vector = c_vector(*a)
    b_c_vector = c_vector(*b)
    c_c_vector = c_vector(*c)

    lib.add_vectors(size, a_c_vector, b_c_vector, c_c_vector)

    # Using slice assignment to pass the result back by reference
    c[:] = list(c_c_vector)



