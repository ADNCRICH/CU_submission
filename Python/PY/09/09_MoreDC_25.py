def row_number(t, e):  # return row number of t containing e (top row is row #0)
    for i in range(len(t)):
        if e in t[i]:
            return i


def flatten(t):  # return a list of ints converted from list of lists of ints t
    a = []
    for i in t:
        for j in i:
            if j != 0:
                a.append(j)
    return a


def inversions(x):  # return the number of inversions of list x
    c = 0
    for i in range(len(x)):
        for j in range(i+1, len(x)):
            if x[i] > x[j]:
                c += 1
    return c


def solvable(t):  # return True if tiling t (list of lists of ints) is solvable # otherwise return False
    ch = False
    r = len(t)
    inv = inversions(flatten(t))
    r0 = row_number(t, 0)

    if r % 2 == 1 and inv % 2 == 0:
        ch = True
    if r % 2 == 0 and (inv + r0) == 1:
        ch = True
    return ch


exec(input().strip())
