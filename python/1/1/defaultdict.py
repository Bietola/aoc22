from fileinput import input
from collections import defaultdict
from itertools import accumulate, groupby, chain, count, takewhile
from more_itertools import take
import math

d = defaultdict(lambda: None,
    accumulate(
        chain(
            [(1, 1)],
            map(
                lambda x: next(
                    (2, int(x[1])) if x[0] == 'addx' else (1, 0)
                    for x in [x.strip().split()]
                ),
                list(input())
            ),
            [(1, 1024)]
        ),
        lambda s, x: (s[0] + x[0], s[1] + x[1])
    )
)
f = lambda k: (k, d[k]) if d[k] else f(k - 1)
print(sum(map(
    lambda x: (math.ceil((x[0]-20)/40)+0.5)*40 * x[1],
    takewhile(lambda x: x[1] < 1024, (f(x) for x in count(20, 40)))
)))