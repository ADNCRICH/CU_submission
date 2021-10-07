F, Y = [i for i in input().strip().split()]

a = []
with open(F, 'r') as file:
    l = file.readlines()
    for i in l:
        id, sco = [x for x in i.split()]
        if id[:2] == Y[2:]:
            a.append(float(sco))

if len(a) == 0:
    print('No data')
    exit(0)

a.sort()

print(a[0], a[len(a)-1], sum(a)/len(a))
"""
for i in l:
        id, sco = [x for x in i.split()]
        if id[:2] == Y[2:]:
            a.append(float(sco))
"""
