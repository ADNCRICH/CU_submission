a = float(input())

b = a
r = 0
while b > 0:
    b //= 10
    r += 1
print(r)