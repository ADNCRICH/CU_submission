a = input()
l = a[0]
c = 1

##########################################
for i in range(1, len(a)):
    if l != a[i]:
        print(l, c, end=" ")
        l = a[i]
        c = 1
    else:
        c += 1
    if i == len(a)-1:
        print(l, c)
##########################################
while(a != ""):
    k = a[0]
    l = len(a)

    a = a.lstrip(k)
    print(k, l-len(a), end=" ")
##########################################
