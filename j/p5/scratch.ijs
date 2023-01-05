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

solve =: dyad define
    stk =. x
    n =. 0{y
    s =. 1{y
    d =. 2{y
    mv=.|.(-n){.>s{stk
    d"_`(,&mv) Mb s"_`((-n)&}.) Mb stk
)

(+ 0&".)~&> /|. 1;'3';'2'

1&,&*: 1 2 3

stk=:'ABC';'GF'
prg=:1 0 1;2 1 0
stk;prg

('ABC';'GF') solve 1 0 1

|.stk;prg
{{
    stk =. y
    a =. 0{>x
    s =. 1{>x
    d =. 2{>x
    NB. echo 'DB:';(<x);(<y)
    mv=.|.(-a){.>s{stk
    < d"_`(,&mv) Mb s"_`((-a)&}.) Mb stk
}}&> / |.stk;prg

|.stk;prg
{{
    s =. 1
    echo 'DB:';(<x);(<y)
    <y solve x
}}&> / |.stk;prg
NB. {:every solve (stk;<prg)

]F.:{{ x }} 1 2 3

{{n =. 1}} / 1 2 3
