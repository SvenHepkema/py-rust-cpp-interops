See the [PyO3]() documentation for instructions on how to run and build the bindings/crate. It then automatically loads the package into CLI python, but you need to install it with pip to use it in actual python files/projects.

So to use the actual package in files, you can run 

`pip install -e .`

To locally test it in your own files instead of only being able to import it from the console.
