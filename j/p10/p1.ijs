1!:44 '/home/dincio/code/aoc22/j/p10'
inp =: fread <'test'
inp1 =: LF cut inp
inp =: (0&".)each[LF cut inp NB. Parse
n =: 20
n{.inp1
n{.inp

inp1 =: 1,,/0".>LF cut[inp NB. Parse
NB. inp =: LF cut[inp NB. Parse
inp

is =: 20+40*i.6
inp
+/\inp
is,:[is{+/\inp NB. TODO: Use hook?
is*[is{+/\inp NB. TODO: Use hook?

NB. inp =: ,/0".>LF cut[inp rplc'noop';'noop 0' NB. Parse
NB. [ (,/>LF cut[inp) ,: (,/0".>LF cut[inp)
