l = []
r = []
n = int(input())

for i in range(n):
    a, b = [int(i) for i in input().split()]
    l.append(a)
    r.append(b)

m = input()
if m == "Zig-Zag":
    print(min(l[::2]+r[1::2]), end=" ")
    print(max(l[1::2]+r[::2]))

else:
    print(max(l[::2]+r[1::2]), end=" ")
    print(min(l[1::2]+r[::2]))
