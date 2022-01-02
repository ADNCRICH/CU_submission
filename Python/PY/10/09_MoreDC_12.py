union = set()
intersect = {}
n = int(input())

for k in range(n):
    a = set([int(i) for i in input().split()])
    for x in a:
        union.add(x)
        if x not in intersect:
            intersect[x] = 0
        intersect[x] += 1

print(len(union))

c = 0
for x in intersect:
    if intersect[x] == n:
        c += 1
print(c)
