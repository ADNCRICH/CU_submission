n = int(input())
c = 0
ans = []
for i in range(0, n):
    a = int(input())
    ans.append(a) if c % 2 == 0 else ans.insert(0, a)
    c += 1
for i in input().split():
    ans.append(int(i)) if c % 2 == 0 else ans.insert(0, int(i))
    c += 1
n = int(input())
while n != -1:
    ans.append(n) if c % 2 == 0 else ans.insert(0, n)
    c += 1
    n = int(input())
print(ans)
