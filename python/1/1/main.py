from fileinput import input
from itertools import accumulate, groupby, chain
import math

print(sum(list(map(
    lambda x: next(
        (math.ceil((x[0]-20)/40)+0.5)*40 * x[1]
        for x in [list(x[1])[-1]]
    ),
    groupby(
        accumulate(
            chain([(1, 1)], map(
                lambda x: next(
                    (2, int(x[1])) if x[0] == 'addx' else (1, 0)
                    for x in [x.strip().split()]
                ),
                list(input())
            )),
            lambda s, x: (s[0] + x[0], s[1] + x[1])
        ),
        lambda x: (x[0] - 21) // 40
    )
))[:-1]))
