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
|.stk

solve =: {{
    stk =. 0{x
    n =. 1{x
    s =. 2{x
    d =. 3{x

    i =. _1-i.n
    mv =. i{s{stk
    ,&mv d} n&}: s} stk
}}

i. 4 5
(<1 3) C. i. 4 5

t =: 0{] + 1{] + 2{]
t 1 2 3

v0=:1+[{]
v1=:[
v2=:]
1 v0`v1`v2} 1 7 3

t =: 0:`1:`2:
(t@.1) 0

M =: {{ ((x@.0)y) ((x@.1)(x@.0){y)`x"_`y"_} y }}
(1:`(1&+)) M 1 7 3

2 0 (1+[{])`[`]} 1 7 3 1

((1&+)`1:) (([@.0)(([@.1)]){])`(([@.1)])`]} 1 7 3 1
