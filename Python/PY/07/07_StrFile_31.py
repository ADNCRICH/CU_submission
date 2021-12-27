d = input().strip().upper()
o = input().strip()

x = {'A': 'T', 'T': 'A', 'C': 'G', 'G': 'C'}


def fi(x):
    return d.count(x)


if d.strip('ATCG') != "":
    print("Invalid DNA")
    exit(0)

if o == 'R':
    for i in d[::-1]:
        print(x[i], end="")

if o == 'F':
    print("A={}, T={}, G={}, C={}".format(fi('A'), fi('T'), fi('G'), fi('C')))

if o == 'D':
    key = input().strip()
    cou = 0
    for i in range(len(d)-len(key)+1):
        if key == d[i:i+len(key)]:
            cou += 1
    print(cou)
