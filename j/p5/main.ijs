1!:44 '/home/dincio/code/aoc22/j/p5'
inp=:LF cut fread'input'
3 3$inp

prg =: 9}.inp
prg =: (0 _1 _1)&+ each ({~ [:I. ~:&0) each 0&". each prg
prg

cstk =: 8{.inp
xb =: >. 4 %~ #>{.cstk
yb =: #cstk
cstk =: (yb,xb)$;(1+4*i.xb)&{each cstk
stk =: deb each<"1|."1|:cstk
stk

{{ {~ 0= 2&| y }} i. 3 3

mod =: monad define
    y =. 0
)
y =: 1
y
mod y
y

stk=:1 2 3
pop=:{{
    ret=.". '|.(-y){.',x
    ". x,'=:(-y)}.',x
    ret
}}

put=:{{
    ". x,'=:',x,',y'
}}

tst=:'ABC';'EFHL'

solve =: monad define
    stk =. >0{y
    prg =. >1{y
    for_cmd. prg do.
        cmd =. >cmd
        n =. 0{cmd
        s =: 1{cmd
        d =: 2{cmd
        NB. mv =. (_1-i.n){>s{stk
        NB. stk =. (<,&mv>d{stk) d} (<(-n)}.>s{stk) s} stk
        echo (s{stk)
        echo n
        '(d{stk)'put'(s{stk)'pop n
    end.
    stk
)
NB. ;,{:each solve (stk;<prg)
solve (stk;<prg)
