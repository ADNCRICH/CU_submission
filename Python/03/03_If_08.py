a = [0, 31, [28, 29], 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

d, m, y = int(input()), int(input()), int(input())

s = sum((a[i] if i != 2 else a[i][1 if (y-543) % 400 == 0 or ((y-543) % 4 == 0 and (y-543) % 100 != 0) else 0]) for i in range(1, m))+d

print(s)
