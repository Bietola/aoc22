from fileinput import input
from itertools import accumulate, groupby, chain
from functools import reduce
import math

# .      -> 0 st
# noop   -> 1 0
# addx 7 -> 2 7 -> 3 st+7
# noop   -> 1 0 -> 4 st+
# addx 14
# noop
# noop
# addx -3
# addx 7

def m(x):
    vals = x.strip().split()
    if vals[0] == 'addx':
        return 2, int(vals[1])
    else:
        return 1, 0

def a(s, x):
    return (s[0] + x[0], s[1] + x[1])

# print(
#     sum(map(
#         lambda x: x[0] * x[1],
#         list(map(lambda x: list(x[1])[-1], groupby(
#             accumulate(map(m, list(input())), a),
#             lambda x: (x[0] - 1) // 20
#         )))
#     ))
# )

# print(
#     list(map(lambda x: list(x[1])[-1], groupby(
#         accumulate(map(m, list(input())), a),
#         lambda x: (x[0] - 1) // 20
#     )))
# )

tmp = list(map(
    lambda x: list(x[1]),
    groupby(
        accumulate(
            chain([(1, 1)],
            map(m, list(input())))
        , a),
        lambda x: (x[0] - 21) // 40
    )
))
print('\n'.join(map(str, tmp)))
print(list(map(
    lambda x: (math.ceil((x[0]-20)/40)+0.5)*40 * x[1],
    map(lambda x: x[-1], tmp[:-1])
)))
print(sum(map(
    lambda x: (math.ceil((x[0]-20)/40)+0.5)*40 * x[1],
    map(lambda x: x[-1], tmp[:-1])
)))

# print(
#     sum(list(map(
#         lambda x: (x[0] // 20 * 20) * x[1],
#         list(map(lambda x: list(x[1])[-1], groupby(
#             accumulate(chain([(1, 1)], map(m, list(input()))), a),
#             lambda x: (x[0] - 21) // 40
#         )))
#     )))
# )