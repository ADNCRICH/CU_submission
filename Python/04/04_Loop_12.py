mi1 = mi2 = 1e9
ma1 = ma2 = -1e9
n = input()
i = 0
n = input()

while n != "Zig-Zag" and n != "Zag-Zig":
    a, b = (int(i) for i in n.split())
    if(i % 2 == 1):
        a, b = b, a
    mi1 = min(mi1, a)
    ma1 = max(ma1, a)
    mi2 = min(mi2, b)
    ma2 = max(ma2, b)
    n = input()
    i += 1
print(mi1, ma2) if(n == "Zig-Zag") else print(mi2, ma1)
