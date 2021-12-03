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
    l = len(x)
    c = 0
    for i in range(l):
        for j in range(i+1, l):
            if x[i] > x[j]:
                c += 1
    return c


def solvable(t):  # return True if tiling t (list of lists of ints) is solvable
    n_row = len(t)
    row_0 = row_number(t, 0)
    inv = inversions(flatten(t))
    ch = False
    if n_row % 2 == 1 and inv % 2 == 0:
        ch = True
    elif n_row % 2 == 0 and (inv + row_0) % 2 == 1:
        ch = True
    return ch

 # otherwise return False


exec(input().strip())
