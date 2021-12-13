a = float(input())

l, r, mid = 0, a, (a/2)

while(abs(a-10**mid) > 10**-10 * max(a, 10**mid)):
    if 10**mid > a:
        r = mid
    else:
        l = mid
    mid = (l+r)/2

print(round(mid, 6))
