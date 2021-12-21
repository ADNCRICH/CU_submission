m = [0 for i in range(10)]

for i in input():
    if i.isnumeric():
        m[int(i)] = 1

ans = []
for i in range(10):
    if m[i] == 0:
        ans.append(str(i))

ans2 = [str(i) for i in range(10) if m[i] == 0]

if len(ans2) != 0:
    print(','.join(ans2))
else:
    print("None")
