a = {}
for i in range(int(input())):
    x = input().split()
    a[x[0]] = x[1:]

key = set(input().split())
ans = []
for i in a:
    if key.issubset(a[i]):
        ans.append([i]+a[i])

for i in sorted(ans):
    print(" ".join(i))
