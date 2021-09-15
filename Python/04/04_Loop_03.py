a = input()
b = input()
la = len(a)
lb = len(b)
cou = 0
if(la != lb):
    print("Incomplete answer")
    exit(0)
for i in range(0, la):
    if(a[i] == b[i]):
        cou += 1
print(cou)
