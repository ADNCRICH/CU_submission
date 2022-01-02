a = {}

for i in range(int(input())):
    x = input().split()
    a[x[0]] = x[1:]

key = set(input().split())
ans = [[i]+a[i] for i in a if key.issubset(a[i])]

ans = sorted(ans)

if len(ans) == 0:
    print("Not Found")
else:
    for i in ans:
        print(" ".join(i))

"""

8
Krit A 97 CP
Oat A 98 CE
Pim C 99 CP
Pun C 97 CH
Jame Dog 100 CE
Art C 97 CP
Benz Dog 99 CP
Mark C 100 CP
C CP


"""
