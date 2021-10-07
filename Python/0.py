"""
a = int(3)
b = int(5)
print("%d%d" % (a, b))

for i in range(0, 10):
   print(i, end="")

a = 66565
c = 3
print("%.d" % a)

c = [5, 6, 7, 8]
a = sum(c[i] for i in range(0, 4))
print(a)


a = "abcddcab"
b = "abc"
print(a.strip(b))
print(a.split("ab"))




print("%d" % ord('a'))
print("%c" % chr(97))

print("%d" % (9 | 12))


a = "08326456"
print(a[0:2])


a = [3, 4, 5, [6, 7]]

print(a[1][0])


print("{:06.2f}".format(3.1561321654653123))

a = [str(i) for i in range(0, 5)]
print(",".join(a))

a = list()
b = list()
while True:
    c = input()
    if c == "-1":
        print(a, b)
        exit(0)
    aa, bb = (i for i in c.split())
    a.append(aa)
    b.append(bb)

a = [4, 9, 6, 7, 5]
a.sort()
print(a.index(5))

a = [[12, 18, 6, 3],
     [4,  3, 1, 2],
     [15,  8, 9, 6]]
print(*zip(*a))

a = (15, 6)
print(a[0])

a = [i for i in range(0, 20)]
print(a[0:3]+a[4:])

PC Files: virus.exe antivirus.exe dog.exe spotify.virus


a = input()
a = a[10:].split()
ans = []
for i in a:
    name = i.split('.')[0]
    if "antivirus" in name or "notvirus" in name:
        pass
    elif "virus" in name:
        continue
    ans.append(i)

print("PC Files: "+", ".join(ans))

a = "asGG.gjenLJHljLJH"
print(a.upper())

a = "abcde"
print(a[-2:])

a = [3, 5, 6]
a += [8, 6, 9]
print(a+b)

la = lb = 0
lb += 3
print(la)

if 'j'.isupper():
    print("Yeahhhh yeehaaa")
else:
    print("nooooooo:")

key = "0123456789012"
for i in range(0, len(key)-3):
    print(key[i:i+4], key[i:i+4][::-1])

a = "e r"
aa = a.strip().split()
print('0') if len(aa) == 0 else print(" ".join(aa))



def p(a, b):
    return a+b, a < b, [a, b]


a, b, c = p(2, 3)
print(a, b, c)

a = [i.strip() for i in input().split(',')]
print('\n'.join(a))

a = [5, 6, 5, 462, 3321, 5, 6523, 32321, 3542, 13, 32132, 3]
aa = [[i, j] for i, j in enumerate(a)]
aa = sorted(aa, key=lambda x: x[1])
for i in aa:
    print(i[0], i[1])

a = input()
n = int(input())
print(a[(n-1)*5:(n*5)])
print(a[0:(n-1)*5]+a[(n*5):])

a = input().split()
s = b = p = 0
for i in a:
    if i == 'shirt':
        s += 1
    elif i == 'pants':
        p += 1
    elif i == 'bag':
        b += 1
if s >= 2:
    p = max(0, p-1)
if s >= 3:
    b = max(0, b-1)
print(200*(s+b+p))

a = [float(i) for i in input().split()]
n = min(int(a[0]), len(a)-1)
a = a[1:]
for i in range(len(a)):
    print(max(a[i:min(i+n, len(a))]), end=" ")

a = [['A102', 30], ['A103', 40], ['B014', 50], ['B109', 50]]
x, y = [int(i) for i in input().split(',')]
ans = []
for i in a:
    if i[1] < x or i[1] > y:
        ans.append(i)
print(ans)

a = [85, 80, 75, 70, 65, 60, 55, 50, 45, 40]


import pandas as pd
import matplotlib.pyplot as plt
df = pd.DataFrame({"A": ["foo", "foo", "foo", "foo", "foo",
                         "bar", "bar", "bar", "bar"],
                   "B": ["one", "one", "one", "two", "two",
                         "one", "one", "two", "two"],
                   "C": ["small", "large", "large", "small",
                         "small", "large", "small", "small",
                         "large"],
                   "D": [1, 2, 2, 3, 3, 4, 5, 6, 7],
                   "E": [2, 4, 5, 5, 6, 6, 8, 9, 9]})
df
"""
real = "efFF"
fake = "zsrgzsrg"
a = [[0 for i in range(len(real)+1)] for i in range(len(fake)+1)]
for i in range(len(fake)+1):
    a[i][0] = i
for j in range(len(real)+1):
    a[0][j] = j
for i in a:
    print(i, end="\n")
