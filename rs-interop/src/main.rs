extern "C" {
    fn add_vectors(size: i32, A: *const i32, B: *const i32, C: *mut i32);
}

fn main() {
    unsafe {
        let n : i32 = 5;
        let a : Vec<i32> = vec![1, 2, 3, 4, 5];
        let b : Vec<i32> = vec![1, 2, 3, 4, 5];
        let mut c : Vec<i32> = vec![0, 0, 0, 0, 0];

        println!("A: {:?}", a);
        println!("B: {:?}", b);
        println!("C: {:?}", c);

        println!("Adding the vectors");
        add_vectors(n, a.as_ptr(), b.as_ptr(), c.as_mut_ptr());

        println!("A: {:?}", a);
        println!("B: {:?}", b);
        println!("C: {:?}", c);
    }
}
