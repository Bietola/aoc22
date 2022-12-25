1!:44 '/home/dincio/code/aoc22/j/p10'
inp =: fread <'input'
inp =: 1,;0&".each[LF cut inp NB. Parse
LF (40*i.6) } [(": <&2 | (40|i.#inp) - (+/\inp)) rplc '1';'#';'0';'.';' ';''
