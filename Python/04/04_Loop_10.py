a = float(input())
l = 0
t = a
while t > 0:
    t //= 10
    l += 1
r = l
l = 0
mid = (l+r)/2
while abs(a-10**mid) > (10**-10*max(a, 10**mid)):
    if 10**mid > a:
        r = mid
    else:
        l = mid
    mid = (l+r)/2
print(round(mid, 6))
