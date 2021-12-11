u = [float(x) for x in input()[1:-1].split(',')]
v = [float(x) for x in input()[1:-1].split(',')]

a = [u[i]+v[i] for i in range(3)]
print("{} + {} = {}".format(u, v, a))
