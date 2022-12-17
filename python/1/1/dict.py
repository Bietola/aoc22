from fileinput import input
from itertools import accumulate, chain, count, takewhile, starmap
from functools import partial
import operator as op

class backdict(dict):
    def __missing__(self, k):
        return self[k - 1]

class Stop:
    def __eq__(self, other):
        return type(other) is Stop
    def __add__(self, other):
        return self
    def __mul__(self, other):
        return self
    def __show__(self):
        return 'Stop'

inp = map(
    lambda x: next(
        (2, int(x[1])) if x[0] == 'addx' else (1, 0)
        for x in [x.strip().split()]
    ),
    list(input())
)

print(sum(
    takewhile(partial(op.ne, Stop()), (
        d[k] * k
        for d in [backdict(accumulate(
            chain([(1, 1)], inp, [(1, Stop())]),
            lambda s, x: list(map(op.add, x, s))
        ))]
        for k in count(20, 40)
    ))
))