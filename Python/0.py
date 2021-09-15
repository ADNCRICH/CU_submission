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
"""
la = lb = 0
lb += 3
print(la)
