f1, f2 = [i.strip() for i in input().split()]


def cmpp(a, b):  # a < b -> false
    if a[0][8:] < b[0][8:]:
        return False
    if a[0][8:] > b[0][8:]:
        return True
    if a[0] < b[0]:
        return False
    if a[0] > b[0]:
        return True


def read_next(f):
    tt = f.readline().strip().split()
    if len(tt) == 0:
        return tt, False
    return tt, True


with open(f1, "r") as a, open(f2, "r") as b:
    ch1 = ch2 = True
    aa, ch1 = read_next(a)
    bb, ch2 = read_next(b)
    while ch1 & ch2:
        if cmpp(aa, bb):  # b < a
            print(' '.join(bb))
            bb, ch2 = read_next(b)
        elif not cmpp(aa, bb):  # a < b
            print(' '.join(aa))
            aa, ch1 = read_next(a)
    while ch1:
        print(' '.join(aa))
        aa, ch1 = read_next(a)
    while ch2:
        print(' '.join(bb))
        bb, ch2 = read_next(b)
