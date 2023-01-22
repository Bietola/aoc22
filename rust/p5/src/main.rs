use std::iter;
use std::fs;
use ndarray::{Array1, Array2, s};
use regex::Regex;
use single::Single;
use itertools::Itertools;

fn main() {
    let inp = fs::read_to_string("assets/input").unwrap();
    let inp: Vec<_> = inp.split("\n").collect();
    let str_stk: Vec<_> = inp.iter().take(8).collect();
    let str_prg: Vec<_> = inp.iter().skip(10).collect();
    let str_prg = str_prg.split_last().unwrap().1;
    let re = Regex::new(r"move (\d+) from (\d+) to (\d+)").unwrap();
    // println!("{:#?}", re.captures_iter(str_prg[0]).single().unwrap());

    println!("{:#?}",
        str_stk
            // .iter()
            // .map(|s| s.trim())
            // .map(|line| line.chars().enumerate().collect::<Vec<(usize, _)>>())
            // .collect::<Vec<_>>()
    );

    // println!("{:#?}", str_prg);

    let stk = Array2::from_shape_vec(
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
    ).unwrap().reversed_axes().slice_move(s![.., ..;-1]);

    println!("{:?}", stk);

    let mut stk: Vec<_> = stk.outer_iter()
        .map(|a| a.into_iter().collect::<String>().trim_end().to_owned())
        .collect();

    println!("{:?}", stk);

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
