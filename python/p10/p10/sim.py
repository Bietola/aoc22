import operator as op
from fileinput import input
from itertools import chain, count, accumulate, takewhile

sim = list(accumulate(
    chain([1], *map(
        lambda x: next(
            [0, int(x[1])] if x[0] == 'addx' else [0]
            for x in [x.strip().split()]
        ),
        list(input())
    )),
    op.add
))

print(sum(map(
    lambda i: i * sim[i - 1],
    takewhile(
        lambda i: i < len(sim),
        count(20, 40)
    )
)))