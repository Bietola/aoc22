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

load'regex'
prg =: 4 }.inp
NB. prg =: 4 3$0".;,&' ' each ;'\d+'&rxall each prg
NB. prg =: ({~ (~:&0)) each 0&". each prg
prg =: (0 _1 _1)&+ each ({~ [:I. ~:&0) each 0&". each prg
prg

cstk =: 3{.inp
cstk =: 3 3$;(1+4*i.3)&{each cstk
stk =: deb each<"1|."1|:cstk
stk

solve =: monad define
    stk =. >0{y
    prg =. >1{y
    for_cmd. prg do.
        cmd =. >cmd
        n =. 0{cmd
        s =. 1{cmd
        d =. 2{cmd
        i =. _1-i.n
        mv =. i{>s{stk
        stk =. (<,&mv>d{stk) d} (<(-n)}.>s{stk) s} stk
    end.
    stk
)
solve (stk;<prg)
