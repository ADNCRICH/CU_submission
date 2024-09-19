import numpy as np

gr = (1 + np.sqrt(5)) / 2
ll = 0.5 - 0.5 / np.sqrt(3)
rr = 0.5 + 0.5 / np.sqrt(3)

point = np.zeros((60, 3))
tex_uv = np.zeros((60, 2))

def map_num(x):
    if x == 'gr':
        return gr
    elif x == '-gr':
        return -gr
    elif x == 'll':
        return ll
    elif x == 'rr':
        return rr
    else:
        return float(x)

inpp = []

N = 20

for i in range(N*3):
    inp = input()
    while len(inp.split(',')) < 6:
        inp = input()
    inpp.append(inp)
    x, y, z, u, v = [map_num(i.strip()) for i in inp.split(',')[:-1]]
    point[i] = [x, y, z]
    tex_uv[i] = [u, v]
    # print(x, y, z, u, v)
print("\n-----------------------\n")
for i in range(N):
    cross = np.cross(point[3 * i + 1] - point[3 * i], point[3 * i + 2] - point[3 * i])
    cross = cross / np.linalg.norm(cross)
    cross = np.round(cross, 4)

    for j in range(3):
        l1 = [i.strip() for i in inpp[3 * i + j].split(',')[:3]]
        l2  = list(map(str, cross))
        l3 = [i.strip() for i in inpp[3 * i + j].split(',')[3:]]
        print("\t", ", ".join(l1 + l2 + l3))
    print()

'''
        0, 1, gr, rr, 0.5,
        0, -1, gr, ll, 0.5,
        gr, 0, 1, 0.5, 0,

        0, 1, gr, rr, 0.5,
        -gr, 0, 1, 0.5, 1,
        0, -1, gr, ll, 0.5,

        0, 1, gr, 0.5, 1,
        gr, 0, 1, ll, 0.5,
        1, gr, 0, rr, 0.5,

        0, 1, gr, ll, 0.5,
        -1, gr, 0, rr, 0.5,
        -gr, 0, 1, 0.5, 0,

        0, 1, gr, ll, 0.5,
        1, gr, 0, 0.5, 1,
        -1, gr, 0, rr, 0.5,

        0, -1, gr, 0.5, 0,
        1, -gr, 0, rr, 0.5,
        gr, 0, 1, ll, 0.5,

        0, -1, gr, 0.5, 1,
        -gr, 0, 1, rr, 0.5,
        -1, -gr, 0, ll, 0.5,

        1, -gr, 0, ll, 0.5,
        0, -1, gr, 0.5, 0,
        -1, -gr, 0, rr, 0.5,

        1, gr, 0, ll, 0.5,
        0, 1, -gr, rr, 0.5,
        -1, gr, 0, 0.5, 0,

        gr, 0, 1, ll, 0.5,
        gr, 0, -1, 0.5, 0,
        1, gr, 0, rr, 0.5,

        gr, 0, 1, ll, 0.5,
        1, -gr, 0, rr, 0.5,
        gr, 0, -1, 0.5, 1,

        -gr, 0, 1, 0.5, 1,
        -1, gr, 0, ll, 0.5,
        -gr, 0, -1, rr, 0.5,

        -gr, 0, 1, rr, 0.5,
        -gr, 0, -1, 0.5, 0,
        -1, -gr, 0, ll, 0.5,

        1, gr, 0, ll, 0.5,
        gr, 0, -1, 0.5, 1,
        0, 1, -gr, rr, 0.5,

        1, -gr, 0, 0.5, 1,
        0, -1, -gr, ll, 0.5,
        gr, 0, -1, rr, 0.5,

        -1, gr, 0, ll, 0.5,
        0, 1, -gr, 0.5, 0,
        -gr, 0, -1, rr, 0.5,

        -1, -gr, 0, 0.5, 0,
        -gr, 0, -1, rr, 0.5,
        0, -1, -gr, ll, 0.5,

        0, 1, -gr, 0.5, 0,
        gr, 0, -1, rr, 0.5,
        0, -1, -gr, ll, 0.5,

        0, 1, -gr, 0.5, 1,
        0, -1, -gr, ll, 0.5,
        -gr, 0, -1, rr, 0.5,

        1, -gr, 0, ll, 0.5,
        -1, -gr, 0, rr, 0.5,
        0, -1, -gr, 0.5, 1,
'''