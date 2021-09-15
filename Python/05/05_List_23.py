n = int(input())
a = []
for i in range(0, n):
    x, y = input().split()
    a.append([(float(x), float(y)), (float(x)**2+float(y)**2)**0.5, i+1])
a.sort(key=lambda y: y[1])
print("#{}: {}".format(a[2][2], a[2][0]))
