a = float(input())

b = a
r = 0
while b > 0:
    b //= 10
    r += 1

l, mid = 0, r/2

while(abs(a-10**mid) > 10**-10 * max(a, 10**mid)):
    if 10**mid > a:
        r = mid
    else:
        l = mid
    mid = (l+r)/2

print(round(mid, 6))
