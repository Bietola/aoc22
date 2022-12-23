inp =: fread <'test'
NB. inp =: ,/0".>LF cut[inp rplc'noop';'noop 0' NB. Parse
[ (,/>LF cut[inp) ,. (,/0".>LF cut[inp)

1{i._

1 2 3 4 5 ,. 5{.0 1 2

zip =: {{
    mx =. x(>.&#)y
    x(,.&(mx&{.))y
}}
1 2 3 4 5 zip 1 2 3 4 5 6 7 8

1 2 3 ,: 4 3 2 5 4 3

inp =: ,/0".>LF cut[inp NB. Parse
is =: 20+40*i.6
is*[is{+/\inp NB. TODO: Use hook?
