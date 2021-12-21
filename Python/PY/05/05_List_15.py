a = [int(i) for i in input().split()]
a = sorted(a)
l = a[0]
ans = []

for i in range(len(a)):
    if a[i] != l:
        ans.append(l)
        l = a[i]
    if i == len(a)-1:
        ans.append(a[i])

print(len(ans))
print(ans[:10])
