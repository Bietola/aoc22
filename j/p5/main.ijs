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

stk =: 1 2 3;3;(>a:);2 0
stk
put =: dyad define
    s =. (x@.0) 0
    l =. x@.1
    echo s,' =: l`(,&y) Mb ',s
)
('stk'"_`1:) put 1

{: every > {{
    stk =. y
    a =. 0{>x
    s =. 1{>x
    d =. 2{>x
    NB. echo 'DB:';(<x);(<y)
    mv=.|.(-a){.>s{stk
    < d"_`(,&mv) Mb s"_`((-a)&}.) Mb stk
}}&> / |.stk;prg

