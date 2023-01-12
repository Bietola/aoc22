use std::iter;

fn main() {
    let mut stk = vec![
        vec!['A', 'B', 'C'],
        vec!['D'],
        vec!['E', 'F'],
    ];

    let prog = vec![
        (1, 1, 2),
        (1, 2, 1),
    ];

    for (n, s, d) in prog {
        let mv: Vec<_> = iter::repeat_with(|| stk[s].pop().unwrap())
            .take(n)
            .collect();
        stk[d].extend(mv);
    }

    println!("{:?}", stk);
}
