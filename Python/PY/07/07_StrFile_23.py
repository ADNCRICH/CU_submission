file, y = input().split()

aa = []
with open(file, 'r') as f:
    a = f.readlines()
    for i in a:
        id, sc = i.split()
        sc = float(sc)
        if id[:2] == y[2:]:
            aa.append(sc)

if len(aa) == 0:
    print("No data")
    exit(0)

print(min(aa), max(aa), sum(aa)/len(aa))
