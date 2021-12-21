a = []

n = int(input())
for i in range(n):
    a.append(int(input()))

a += [int(i) for i in input().split()]

x = int(input())
while(x != -1):
    a.append(x)
    x = int(input())

n = len(a)
print(a[(n//2)*2 - 1::-2]+a[::2])
