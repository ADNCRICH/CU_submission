import math

a = [0, 31, [28, 29], 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

bd, bm, by, d, m, y = [int(e) for e in input().split()]


def fi(dd, mm, yy):
    ss = sum((a[i] if i != 2 else a[i][1 if (yy-543) % 400 == 0 or ((yy-543) % 4 == 0 and (yy-543) % 100 != 0) else 0]) for i in range(1, mm))+dd
    return ss


s = sum(365 for i in range(by+1, y))+fi(d, m, y)-1+fi(31, 12, by)-fi(bd-1, bm, by)


def si(t):
    return math.sin(2*math.pi*s/t)


print(s, "{:.2f} {:.2f} {:.2f}".format(si(23), si(28), si(33)))
