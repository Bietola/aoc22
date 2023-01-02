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

load 'regex'
cstk =: 3{.inp
cstk =: 3 3$;(1+4*i.3)&{each cstk
prg =: 4 }.inp
NB. prg =: 4 3$0".;,&' ' each ;'\d+'&rxall each prg
NB. prg =: ({~ (~:&0)) each 0&". each prg
prg =: (0 _1 _1)&+ each ({~ [:I. ~:&0) each 0&". each prg
prg

stk=:deb each<"1|."1|:cstk
n =: 0{>0{prg
s =: 1{>0{prg
d =: 2{>0{prg
i =: _1-i.n
mv =: i{>s{stk
stk;cstk
(<,&mv>d{stk) d} (<(-n)}.>s{stk) s} stk
