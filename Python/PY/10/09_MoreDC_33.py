def add_poly(p1, p2):
    a = {}
    for i, j in p1:
        a[j] = i
    for i, j in p2:
        if j in a:
            a[j] += i
        else:
            a[j] = i
    a = sorted(a.items(), key=lambda x: -x[0])
    return [(j, i) for i, j in a if j != 0]


def mult_poly(p1, p2):
    a = {}
    for i, j in p1:
        for x, y in p2:
            if j+y in a:
                a[j+y] += i*x
            else:
                a[j+y] = i*x
    return [(j, i) for i, j in sorted(a.items(), key=lambda x:-x[0]) if j != 0]


for i in range(3):
    exec(input().strip())

"""

p2 = [(3,6),(2,4),(1,1),(-1,0)]
p1 = [(3,4),(-1,1)]
print(add_poly(p1, p2))

"""
