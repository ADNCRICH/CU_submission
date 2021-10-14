n = int(input())
mp = {}
cou = 0.0

for i in range(n):
    p, q = input().strip().split()
    mp[p] = [float(q), 0]

n = int(input())
for i in range(n):
    p, q = input().strip().split()
    if p in mp:
        mp[p][1] += float(q)*mp[p][0]
        cou += float(q)*mp[p][0]

mp = sorted(mp.items(), key=lambda x: (-x[1][1], x[0]))

ans = []
if len(mp) != 0:
    mx = mp[0][1][1]
if mp[0][1][1] == 0:
    print("No ice cream sales")
    exit(0)
for i in mp:
    if i[1][1] == mx:
        ans.append(i[0])

print("Total ice cream sales: " + str(cou))
print("Top sales: " + ", ".join(ans))
