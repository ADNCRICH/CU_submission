n = int(input())
a = []  # (x,y) , index

for i in range(1, n+1):
    x, y = [float(i) for i in input().split()]
    a.append(((x, y), i))

a = sorted(a, key=lambda x: (x[0][0]**2 + x[0][1]**2))

ans = a[2]
print("#{}: {}".format(ans[1], ans[0]))
