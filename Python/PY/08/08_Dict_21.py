a = input().lower()
d = {}

for i in a:
    if i not in d:
        d[i] = 0
    d[i] += 1

d = sorted(d.items(), key=lambda x: (-x[1], x[0]))

print(d)
