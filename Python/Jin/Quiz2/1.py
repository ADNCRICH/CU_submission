name = []
v = []
m = int(input())
s = input()
ans = [0]*m
while (s != 'Q'):
    s, a = s.split()
    name.append(s)
    v.append(int(a))
    s = input()
cou, i = 0, 0
while (cou < m):
    idx = i % len(v)
    if (ans[idx] < v[idx]):
        ans[idx] += 1
        cou += 1
    i += 1
for k in range(len(v)):
    print(name[k], ans[k])
