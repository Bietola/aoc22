from fileinput import input
from itertools import chain, count, accumulate
from more_itertools import take

print(list(take(6, (
    # i * x[i]
    (i, x[i])
    for x in [list(accumulate(
        chain([1], *map(
            lambda x: next(
                [0, int(x[1])] if x[0] == 'addx' else [0]
                for x in [x.strip().split()]
            ),
            list(input())
        )),
        lambda s, x: s + x
    ))]
    # for i in count(20, 40)
    for i in count(20, 40)
))))

# accumulate(
#     chain([1], map(
#         lambda x: next(
#             [0, int(x[1])] if x[0] == 'addx' else [0]
#             for x in [x.strip().split()]
#         ),
#         list(input())
#     )),
#     lambda s, x: s + x
# )