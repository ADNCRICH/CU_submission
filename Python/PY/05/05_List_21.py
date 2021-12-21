id, g = [], []

x = input()
while(x != 'q'):
    a, b = [i.strip() for i in x.split()]
    id.append(a)
    g.append(b)
    x = input()

for i in input().split():
    for j in range(len(id)):
        if id[j] == i:
            if len(g[j]) == 1 and g[j] != 'A':
                if g[j] != 'F':
                    g[j] += '+'
                else:
                    g[j] = 'D'
            else:
                g[j] = chr(ord(g[j][0])-1)

for i in range(len(id)):
    print(id[i], g[i])
