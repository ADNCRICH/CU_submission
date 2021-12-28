l = {}
s = {}

n = int(input())
for i in range(n):
    a, b = input().split()
    l[a] = int(b)

m = int(input())
for i in range(m):
    a, b = input().split()
    if a in l:
        if a not in s:
            s[a] = 0.0
        s[a] += l[a]*int(b)

s = sorted(s.items(), key=lambda x: (-x[1], x[0]))

if len(s) == 0:
    print("No ice cream sales")
    exit(0)

print("Total ice cream sales:", sum(i[1] for i in s))
p = s[0][1]
print("Top sales:", ", ".join([i[0] for i in s if i[1] == p]))
"""

5
Magnum 50
Cornetto 25
PaddlePop 15
AsianDelight 20
Calippo 15
6
Magnum 5
Magnum 5
Cookie 20
MamaTomYum 3
Cornetto 20
AsianDelight 1


"""
