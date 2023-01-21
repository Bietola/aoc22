use std::iter;
use std::fs;
use ndarray as nd;
use ndarray::s;

fn main() {
    let inp = fs::read_to_string("assets/input").unwrap();

    let str_stk = inp.split("\n").take(8).collect::<Vec<_>>();

    println!("{:#?}",
        str_stk
            // .iter()
            // .map(|s| s.trim())
            // .map(|line| line.chars().enumerate().collect::<Vec<(usize, _)>>())
            // .collect::<Vec<_>>()
    );

    // println!("{:?}", 
    //     str_stk
    //         .iter()
    //         .map(|line| line.chars()
    //             .enumerate()
    //             .filter_map(|(i, c)|
    //                 i.checked_sub(1).filter(|x| x % 4 == 0).map(|_| c)
    //             )
    //             .collect::<Vec<_>>()
    //         )
    //         .collect::<Vec<_>>()
    // );

    println!("{:#?}", nd::Array2::from_shape_vec(
        (8, 9),
        str_stk
            .iter()
            .map(|line| line.chars()
                .enumerate()
                .filter_map(|(i, c)|
                    i.checked_sub(1).filter(|x| x % 4 == 0).map(|_| c)
                )
            )
            .flatten()
            .collect::<Vec<_>>()
    ).unwrap().t().slice(s![.., ..;-1]));

    // let mut stk = vec![
    //     vec!['A', 'B', 'C'],
    //     vec!['D'],
    //     vec!['E', 'F'],
    // ];

    // let prog = vec![
    //     (1, 1, 2),
    //     (1, 2, 1),
    // ];

    // for (n, s, d) in prog {
    //     let mv: Vec<_> = iter::repeat_with(|| stk[s].pop().unwrap())
    //         .take(n)
    //         .collect();
    //     stk[d].extend(mv);
    // }

    // println!("{:?}", stk);
}
