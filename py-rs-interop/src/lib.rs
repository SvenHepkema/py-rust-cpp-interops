use pyo3::prelude::*;

extern "C" {
    fn add_vectors(size: i32, A: *const i32, B: *const i32, C: *mut i32);
}

#[pyfunction]
fn rs_add_vectors(n: i32, a: Vec<i32>, b: Vec<i32>, mut c: Vec<i32>) -> PyResult<Vec<i32>> {
    unsafe {
        add_vectors(n, a.as_ptr(), b.as_ptr(), c.as_mut_ptr());
    }

    Ok(c)
}

/// A Python module implemented in Rust.
#[pymodule]
fn py_rs_interop(_py: Python, m: &PyModule) -> PyResult<()> {
    m.add_function(wrap_pyfunction!(rs_add_vectors, m)?)?;
    Ok(())
}
