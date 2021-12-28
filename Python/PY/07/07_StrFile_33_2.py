a, b = input().split()

st = []


def read_next(f):
    t = f.readline().strip().split()
    if len(t) == 0:
        return t, False
    return t, True


with open(a, "r") as f1, open(b, "r") as f2:
    aa, ch1 = read_next(f1)
    bb, ch2 = read_next(f2)
    while ch1:
        st.append(aa)
        aa, ch1 = read_next(f1)
    while ch2:
        st.append(bb)
        bb, ch2 = read_next(f2)

st = sorted(st, key=lambda x: (x[0][-2:], x[0]))

for i in st:
    print(i)
