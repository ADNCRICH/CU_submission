from typing import DefaultDict


a = {}

x = input()
while x != 'q':
    id, g = x.split()
    a[id] = g
    x = input()

for i in input().split():
    if len(a[i]) == 1 and a[i] != 'A':
        if a[i] == 'F':
            a[i] = 'D'
        else:
            a[i] += '+'
    elif len(a[i]) == 2:
        a[i] = chr(ord(a[i][0])-1)

a = sorted(a.items(), key=lambda x: int(x[0]))

for i in a:
    print(" ".join(i))
