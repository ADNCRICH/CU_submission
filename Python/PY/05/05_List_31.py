a = input().split()
o = input()

for i in o:
    if i == 'C':
        a = a[len(a)//2:] + a[:len(a)//2]
    if i == 'S':
        a = [a[i//2 + (0 if i % 2 == 0 else len(a)//2)] for i in range(len(a))]

print(" ".join(a))
