n = int(input())
a = [str(n)]

while(n != 1):
    n = (n//2 if n % 2 == 0 else 3*n+1)
    a.append(str(n))


print("->".join(a[max(0, len(a)-15):]))
