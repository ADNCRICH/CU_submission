a = {}

for i in range(int(input())):
    id, x = input().split(":")
    x = [k.strip() for k in x.split(',')]
    a[id] = set(x)

ch = False
x = input()
for i in a:
    if not a[i].isdisjoint(a[x]) and x != i:
        print(i)
        ch = True
if not ch:
    print("Not Found")
