from fileinput import input
from collections import defaultdict
from itertools import accumulate, groupby, chain, count
from more_itertools import take
import math

# d = defaultdict(lambda: None, {0: 5})
# f = lambda k: d[k] if d[k] else f(k - 1)
# print(f(10))

# print(list(take(20, count(20, 40))))

print(list(
    f(x)
    for x in count(20, 40) if f(x) < 1024
    for f in [
        lambda k: d[k] if d[k] else f(k - 1)
        for d in [defaultdict(lambda: None,
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
            ))
        ]
    ]
))

# print(sum(list(map(
#     lambda x: next(
#         (math.ceil((x[0]-20)/40)+0.5)*40 * x[1]
#         for x in [list(x[1])[-1]]
#     ),
#     groupby(
#         accumulate(
#             chain([(1, 1)], map(
#                 lambda x: next(
#                     (2, int(x[1])) if x[0] == 'addx' else (1, 0)
#                     for x in [x.strip().split()]
#                 ),
#                 list(input())
#             )),
#             lambda s, x: (s[0] + x[0], s[1] + x[1])
#         ),
#         lambda x: (x[0] - 21) // 40
#     )
# ))[:-1]))
