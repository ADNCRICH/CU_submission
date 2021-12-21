a = [float(i) for i in input()[1:-1].split(',')]
b = [float(i) for i in input()[1:-1].split(',')]

v = [a[i]+b[i] for i in range(len(a))]

print("{} + {} = {}".format(a, b, v))
