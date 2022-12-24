1!:44 '/home/dincio/code/aoc22/j/p10'
inp =: fread <'test'
NB. inp =: 1,,/(0".)each[LF cut inp NB. Parse
inp =: (0&".)each[LF cut inp NB. Parse
10{.inp

>1 2; 3

is =: 20+40*i.6
NB. is,:[is{+/\inp NB. TODO: Use hook?
is*[is{+/\inp NB. TODO: Use hook?

NB. inp =: ,/0".>LF cut[inp rplc'noop';'noop 0' NB. Parse
NB. [ (,/>LF cut[inp) ,: (,/0".>LF cut[inp)
