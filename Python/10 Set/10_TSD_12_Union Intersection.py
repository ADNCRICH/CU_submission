union = set()
intersect = {}
n = int(input())

for i in range(n):
    a = set([int(x) for x in input().split()])
    for j in a:
        union.add(j)
        if j in intersect:
            intersect[j] += 1
        else:
            intersect[j] = 1

print(len(union))
cou = 0
for i in intersect:
    if intersect[i] == n:
        cou += 1
print(cou)
