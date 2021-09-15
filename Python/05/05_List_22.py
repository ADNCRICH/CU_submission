x = input()
id = []
g = []
while x != "q":
    i1, i2 = x.split()
    id.append(i1)
    g.append(i2)
    x = input()
a = [i for i in input().split()]
for i in a:
    t = id.index(i)
    if g[t] == "A":
        continue
    if g[t] == "F":
        g[t] = "D"
    elif len(g[t]) == 1:
        g[t] += "+"
    else:
        g[t] = chr(ord(g[t][0])-1)

a = [[id[i], g[i]] for i in range(len(id))]
for x in sorted(a, key=lambda y: y[0]):
    print(x[0], x[1])
