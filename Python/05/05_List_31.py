a = input().split()
o = input().replace(" ", "")
t = []
for i in o:
    if i == 'C':
        a[:len(a)//2], a[len(a)//2:] = a[len(a)//2:], a[:len(a)//2]
    if i == 'S':
        t = a[:]
        for x in range(0, len(a), 2):
            a[x], a[x+1] = t[x//2], t[len(a)//2+x//2]
for i in a:
    print(i, end=" ")
