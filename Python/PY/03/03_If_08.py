a = [0, 31, [28, 29], 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

d, m, y = int(input()), int(input()), int(input())
y -= 543

c = 0
for i in range(1, m):
    if i != 2:
        c += a[i]
    else:
        if (y % 4 == 0 and y % 100 != 0) or y % 400 == 0:
            c += a[i][1]
        else:
            c += a[i][0]
c += d

s = sum(a[i] if i != 2 else a[i][1 if (y % 4 == 0 and y % 100 != 0) or y % 400 == 0 else 0] for i in range(1, m)) + d

print(s)
