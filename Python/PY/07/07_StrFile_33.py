a, b = input().split()


def read_next(f):
    t = f.readline().strip().split()
    if len(t) == 0:
        return t, False
    return t, True


def cmp(a, b):  # lt -> false
    if a[0][-2:] < b[0][-2:]:
        return False
    if a[0][-2:] > b[0][-2:]:
        return True
    if a[0] < b[0]:
        return False
    if a[0] > b[0]:
        return True


with open(a, "r") as f1, open(b, "r") as f2:
    ch1 = ch2 = True
    aa, ch1 = read_next(f1)
    bb, ch2 = read_next(f2)
    while ch1 & ch2:
        if not cmp(aa, bb):
            print(" ".join(aa))
            aa, ch1 = read_next(f1)
        elif cmp(aa, bb):
            print(" ".join(bb))
            bb, ch2 = read_next(f2)

    while ch1:
        print(" ".join(aa))
        aa, ch1 = read_next(f1)

    while ch2:
        print(" ".join(bb))
        bb, ch2 = read_next(f2)
