a = [int(i) for i in input().split()]
b = set()

for i in a:
    b.add(i)

print(len(b))
print(sorted(b)[:10])
