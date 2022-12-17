from fileinput import input
from itertools import accumulate, chain, count, takewhile, starmap
from functools import partial
import operator as op

class backdict(dict):
    def __missing__(self, k):
        return self[k - 1]

class Stop:
    _stop = None

    def __eq__(self, other):
        return type(other) is Stop
    def __add__(self, other):
        return self
    def __mul__(self, other):
        return self
    def __show__(self):
        return 'Stop'
    def loop(itr):
        return takewhile(partial(op.ne, Stop.inst()), itr)
    def inst():
        if not Stop._stop:
            Stop._stop = Stop()
        return  Stop._stop

inp = map(
    lambda x: next(
        (2, int(x[1])) if x[0] == 'addx' else (1, 0)
        for x in [x.strip().split()]
    ),
    list(input())
)

print(sum(
    Stop.loop(
        d[k] * k
        for d in [backdict(accumulate(
            chain([(1, 1)], inp, [(1, Stop.inst())]),
            lambda s, x: list(map(op.add, x, s))
        ))]
        for k in count(20, 40)
    )
))