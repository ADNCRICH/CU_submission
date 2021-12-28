n = int(input())
d = {}

for i in range(n):
    a, b = input().split()
    d[a] = b
    d[b] = a

m = int(input())
for i in range(m):
    aa = input()
    if aa in d:
        print(d[aa])
    else:
        print("Not found")
