d = {}

for i in range(int(input())):
    k, v = input().split()
    d[k] = int(v)

s = []
for i in range(int(input())):
    k = input().split()
    s.append([k[0], k[1], k[2:]])

ans = []
s = sorted(s, key=lambda x: -float(x[1]))
for i in s:
    for j in i[2]:
        if d[j] > 0:
            ans.append([i[0], j])
            d[j] -= 1
            break

ans = sorted(ans)
for i in ans:
    print(" ".join(i))
