a = input().strip().lower()
d = {}
for i in a:
    if not i.isalpha():
        continue
    if i not in d:
        d[i] = 0
    d[i] += 1

ans = sorted(d.items(), key=lambda x: (-x[1], x[0]))
for i in ans:
    print(i[0], '->', i[1])

# CAaBbbbbbbcDddd
