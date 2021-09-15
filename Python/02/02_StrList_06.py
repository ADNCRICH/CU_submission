a = input()
b = input()
a = a[1:-1]
b = b[1:-1]
c = [float(i.strip()) for i in a.split(',')]
d = [float(i.strip()) for i in b.split(',')]
print(c, "+", d, "=", [c[i]+d[i]for i in range(0, len(c))])
