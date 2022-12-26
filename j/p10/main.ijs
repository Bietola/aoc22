NB. Part 1
1!:44 '/home/dincio/code/aoc22/j/p10'
inp =: fread <'input'
inp =: 1,;0&".each[LF cut inp NB. Parse
+/ (* {&(+/\inp) @ +&_1) 20+40*i.6

NB. Part 2
1!:44 '/home/dincio/code/aoc22/j/p10'
inp =: 1,;0".each 'b'fread<'input' NB. Parse
6 40 $ <&2 | (40&|@i.@# - +/\) inp

