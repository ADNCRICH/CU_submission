a = {}

cnt = 0
x = input()
while x != 'q':
    val, key = [i.strip() for i in x.split(',')]
    if key not in a:
        a[key] = [cnt]
        cnt += 1
    a[key].append(val)
    x = input()

print(a.items())
a = sorted(a.items(), key=lambda x: x[1][0])

for i in a:
    print(i[0] + ": " + ", ".join(i[1][1:]))
