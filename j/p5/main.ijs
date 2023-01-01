inp=: noun define
        [D]    
    [N] [C]    
    [Z] [M] [P]
     1   2   3 

    move 1 from 2 to 1
    move 3 from 1 to 3
    move 2 from 2 to 1
    move 1 from 1 to 2
)

inp=:LF cut inp
stk=:3{.inp
stk=:3 3$;(1+4*i.3)&{each stk

n=:1
s=:1
d=:0

]ri=:+/' '=(<a:;s){stk
]re=:n{.deb(<a:;s){stk
]di=:_1++/' '=(<a:;d){stk
NB. re(,<(2-di+i.#re);d)}' '(<(ri+i.n);s)}stk
re(,<di;d)}' '(<(ri+i.n);s)}stk
