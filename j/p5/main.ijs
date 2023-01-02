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
NB. stk=:(1+4*i.3)&{each stk
stk

solve =: {{
    stk =. 0{y
    n =. >1{y
    s =. >2{y
    d =. >3{y
    i =. _1-i.n
    stk
    NB. mv =. i{s{stk
    NB. mv
}}
solve ('ZN';'MCD';'P');1;0;2

stk
('ZN';'MCD'; 'P')

M =: {{
    sel =. x@.0
    mod =. x@.1
    (mod (sel y){y) (sel y)} y
}}
1 0 2"_`(1&+) M 1 7 3

i =: _1-i.n

