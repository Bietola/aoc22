use std::fs;
use ndarray::{Array2, s};
use regex::Regex;
use std::iter;

fn main() {
    let inp = fs::read_to_string("assets/input").unwrap();
    let inp: Vec<_> = inp.split("\n").collect();
    let str_stk: Vec<_> = inp.iter().take(8).collect();
    let str_prg: Vec<_> = inp.iter().skip(10).collect();
    let str_prg = str_prg.split_last().unwrap().1.to_owned();
    let re = Regex::new(r"move (\d+) from (\d+) to (\d+)").unwrap();

    println!("{:#?}", str_stk);

    let stk = Array2::from_shape_vec(
        (8, 9),
        str_stk
            .iter()
            .map(|line| line.chars().skip(1).step_by(4))
            .flatten()
            .collect::<Vec<_>>()
    ).unwrap().reversed_axes().slice_move(s![.., ..;-1]);

    println!("{:?}", stk);

    let mut stk: Vec<_> = stk.outer_iter()
        .map(|a| a.into_iter().collect::<String>().trim_end().to_owned())
        .collect();

    println!("{:?}", stk);

    let prg = str_prg.iter().map(|s| re.captures(s));

    for cmd in prg {
        let get_caps = |n| cmd.as_ref().unwrap().get(n).unwrap()
            .as_str().parse::<usize>().unwrap();
        let n = get_caps(1);
        let s = get_caps(2) - 1;
        let d = get_caps(3) - 1;

        let mv: Vec<_> = iter::repeat_with(|| stk[s].pop().unwrap())
            .take(n)
            .collect();

        stk[d].extend(mv);
    }

    println!("{}", stk.iter().map(|s| &s[s.len()-1..]).collect::<String>());
}
