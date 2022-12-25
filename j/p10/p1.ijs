1!:44 '/home/dincio/code/aoc22/j/p10'
inp =: fread <'input'
inp =: 1,;0&".each[LF cut inp NB. Parse
NB. LF (40*i.6) } [(": <&2 | (40|i.#inp) - (+/\inp)) rplc '1';'#';'0';'.';' ';''
LF (40*i.6) (^:) [(": <&2 | (40|i.#inp) - (+/\inp)) rplc '1';'#';'0';'.';' ';''

i =: 1 2 3
(+&1)^:(1<i)[ i
