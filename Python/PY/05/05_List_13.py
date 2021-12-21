a = []
c = 0

n = int(input())
for i in range(n):
    x = int(input())
    if c % 2 == 0:
        a.append(x)
    else:
        a.insert(0, x)
    c += 1

for i in [int(x) for x in input().split()]:
    if c % 2 == 0:
        a.append(i)
    else:
        a.insert(0, i)
    c += 1

x = int(input())
while(x != -1):
    if c % 2 == 0:
        a.append(x)
    else:
        a.insert(0, x)
    c += 1
    x = int(input())

print(a)
