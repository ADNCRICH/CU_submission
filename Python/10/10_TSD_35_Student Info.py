a = {}

for i in range(int(input())):
    k = input().split()
    a[k[0]] = k[1:]

key = set(input().split())
ans = [[x]+a[x] for x in a if key.issubset(a[x])]

ans = sorted(ans)

if len(ans) == 0:
    print("Not Found")
else:
    for i in ans:
        print(" ".join(i))
