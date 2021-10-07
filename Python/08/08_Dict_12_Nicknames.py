a = {}
n = int(input())
for i in range(n):
    p, q = input().strip().split()
    a[p] = q
    a[q] = p

n = int(input())
for i in range(n):
    key = input()
    if key not in a:
        print('Not found')
    else:
        print(a[key])
