a = {}
for i in range(int(input())):
    x, y = input().split()
    a[x] = int(y)

st = []
for i in range(int(input())):
    x = input().split()
    st.append([x[0], x[1], x[2:]])

ans = []
st = sorted(st, key=lambda x: -float(x[1]))
for i in st:
    for j in i[2]:
        if a[j] > 0:
            ans.append([i[0], j])
            a[j] -= 1
            break

ans = sorted(ans)
for i, j in ans:
    print(i, j)
