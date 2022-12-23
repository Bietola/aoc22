NB. Includes
load 'regex'

NB. Read input file
1!:44 '/home/dincio/code/aoc22/j/p10'
inp =: fread <'test'

strsplit=: #@[ }.each [ (E. <;.1 ]) ,

'hello' -: 'hello'

parse =: monad define
    res =. 1
    for_i. >LF cut y do.
        i =. deb i
        if. i -: 'noop' do.
            res =. res , 0
        else. 
            res =. res , 0 , 0".>1{cut i
        end.
    end.
    res
)

+/\parse inp

d2c =: monad define
    acc =. y
    i =. 5
    res =. ''
    while. (acc > 0) do.
        res =. res , (48 + 10|acc){a.
        acc =. <. acc % 10
    end.
    |. res
)

echo 'hello: ', d2c 1034

1 2 3; 'hello'

parse inp
