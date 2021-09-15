a = input()
if a == "":
    exit(0)
l = a[0]
cou = 1
for i in range(1, len(a)):
    if a[i] == l:
        cou += 1
    else:
        print(l, cou, end=" ")
        cou = 1
        l = a[i]

print(l, cou)
