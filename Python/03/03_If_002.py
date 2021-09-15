a = [0, 31, [28, 29], 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
d, m, y = [int(e) for e in input().split()]

y -= 543
n = (a[m] if m != 2 else a[m][1 if y % 400 == 0 or (y % 4 == 0 and y % 100 != 0) else 0])

d += 15
if d > n:
    d -= n
    m += 1
if m > 12:
    m -= 12
    y += 1
print(str(("{}/"*3).format(d, m, y+543))[0:-1])
