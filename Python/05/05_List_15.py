a = [int(i) for i in input().split()]
n = []
cou = i = 0
a.sort()

for i in range(0, len(a)):
    if i == len(a)-1 or a[i] != a[i+1]:
        n.append(a[i])
        cou += 1

print("{}\n{}".format(cou, n[0:10]))
