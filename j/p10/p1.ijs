inp =: fread <'test'
NB. inp =: ,/0".>LF cut[inp rplc'noop';'noop 0' NB. Parse
[ (,/>LF cut[inp) ,. (,/0".>LF cut[inp)

1{i._

1 2 3 ,. 0 1

inp =: ,/0".>LF cut[inp NB. Parse
is =: 20+40*i.6
is*[is{+/\inp
