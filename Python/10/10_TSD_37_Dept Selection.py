n = int(input())
mp = {}

for i in range(n):
    k, v = [i for i in input().split()]
    v = int(v)
    mp[k] = v

s = []
for i in range(int(input())):
    g = input().split()
    s.append([g[0], g[1], g[2:]])

ans = []
s = sorted(s, key=lambda x: float(x[1])*-1)
for i in s:
    for j in i[2]:
        if mp[j] > 0:
            ans.append([i[0], j])
            mp[j] -= 1
            break

ans.sort()
for i in ans:
    print(" ".join(i))
