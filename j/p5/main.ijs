1!:44 '/home/dincio/code/aoc22/j/p5'
inp=:LF cut fread'input'
3 3$inp

load'regex'
prg =: 9}.inp
NB. prg =: 4 3$0".;,&' ' each ;'\d+'&rxall each prg
NB. prg =: ({~ (~:&0)) each 0&". each prg
prg =: (0 _1 _1)&+ each ({~ [:I. ~:&0) each 0&". each prg
prg

cstk =: 8{.inp
NB. x =: 9 %~ #>{.cstk
xb =: >. 4 %~ #>{.cstk
yb =: #cstk
cstk =: (yb,xb)$;(1+4*i.xb)&{each cstk
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
        mv =. (_1-i.n){>s{stk
        stk =. (<,&mv>d{stk) d} (<(-n)}.>s{stk) s} stk
    end.
    stk
)
;,{:each solve (stk;<prg)
