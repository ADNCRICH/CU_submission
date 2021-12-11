import math

a = input().split(',')
n = a[0]+'.' + a[1]
l1 = len(a[1])
l2 = 0 if(a[2] == '0') else len(a[2])

t = int(float(n)*10**l1)
if l2 == 0:
    x, y = t, 10**l1
else:
    x = (t*10**l2 + int(a[2])) - t
    y = (10**l2 - 1)*10**l1

x, y = x//math.gcd(x, y), y//math.gcd(x, y)

print(x, '/', y)
