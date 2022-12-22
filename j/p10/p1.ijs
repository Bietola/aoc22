NB. Includes
load 'regex'

NB. Read input file
1!:44 '/home/dincio/code/aoc22/j/p10'
inp =: fread <'test'

strsplit=: #@[ }.each [ (E. <;.1 ]) ,

'hello' = 'hello'

parse =: monad define
for_i. >LF strsplit y do.
    if. i -: 'noop' do.
        echo 0
    else.
        echo 1
    end.
end.
)

0 ". 'addx 10'

NB. 'addx \d+' rxmatch 'addx 1 noop noop addx 2 addx 3'
