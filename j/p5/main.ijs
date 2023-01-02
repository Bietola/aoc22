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

cstk =: 3{.inp
cstk=:3 3$;(1+4*i.3)&{each cstk

stk=:deb each<"1|."1|:cstk
n =. 1
s =. 1
d =. 2
i =. _1-i.n
mv =. i{>s{stk
stk;cstk
(<,&mv>d{stk) d} (<(-n)}.>s{stk) s} stk
