n = int(input())
ma1, ma2, mi1, mi2 = -1e9, -1e9, 1e9, 1e9

for i in range(n):
    a, b = [int(i) for i in input().split()]
    if(i % 2 == 0):
        mi1 = min(mi1, a)
        ma1 = max(ma1, b)
        ma2 = max(ma2, a)
        mi2 = min(mi2, b)
    else:
        mi1 = min(mi1, b)
        ma1 = max(ma1, a)
        ma2 = max(ma2, b)
        mi2 = min(mi2, a)

m = input()
if m == "Zig-Zag":
    print(mi1, ma1)
else:
    print(ma2, mi2)
