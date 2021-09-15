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

for i in range(0, len(id)):
    print(id[i], g[i])
