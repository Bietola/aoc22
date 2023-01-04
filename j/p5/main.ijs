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

M =: {{
    sel =. x@.0
    mod =. x@.1
    (mod (sel y){y) (sel y)} y
}}
0 2"_`(3&+) M 4 2 3

Mb =: {{
    sel =. x@.0
    mod =. x@.1
    NB. (sel`(<@:mod@:>)) M x
    (mod each (sel y){y) (sel y)} y
}}
(1:`*:) Mb (1;2;3)

n=:2
s=:1
d=:3
mv=:|.(-n){.>s{stk
stk
d"_`(,&mv) Mb s"_`((-n)&}.) Mb stk

solve =: monad define
    stk =. >0{y
    prg =. >1{y
    for_cmd. prg do.
        cmd =. >cmd
        n =. 0{cmd
        s =. 1{cmd
        d =. 2{cmd
        mv=.|.(-n){.>s{stk
        stk =. d"_`(,&mv) Mb s"_`((-n)&}.) Mb stk
    end.
    stk
)
{:every solve (stk;<prg)
