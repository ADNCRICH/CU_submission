def tim(t):
    m, s = t.split(":")
    return int(m)*60 + int(s)


def rev(t):
    return str(t//60) + ":" + ('0' if t % 60 < 10 else "") + str(t % 60)


a = {}
for i in range(int(input())):
    na, si, g, t = [x.strip() for x in input().split(',')]
    if not g in a:
        a[g] = 0
    a[g] += tim(t)

a = sorted(a.items(), key=lambda x: -x[1])

for i in a[:3]:
    print(i[0], "-->", rev(i[1]))
