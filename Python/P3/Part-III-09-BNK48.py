idol = {}
ota = {}
kami = {}
bnk = set()

s = input().split()
while(len(s) != 1):
    bnk.add(s[1])
    if(s[1] not in idol):
        idol[s[1]] = (int(s[2]), 1)
    else:
        idol[s[1]] = (idol[s[1]][0]+int(s[2]), idol[s[1]][1])
        if (s[0] not in ota):
            idol[s[1]] = (idol[s[1]][0], idol[s[1]][1]+1)
        elif (s[1] not in ota[s[0]]):
            idol[s[1]] = (idol[s[1]][0], idol[s[1]][1]+1)
    if(s[0] not in ota):
        ota[s[0]] = {}
        ota[s[0]][s[1]] = int(s[2])
    else:
        if(s[1] not in ota[s[0]]):
            ota[s[0]][s[1]] = int(s[2])
        else:
            ota[s[0]][s[1]] += int(s[2])
    s = input().split()

# print(idol)
# print(ota)
if int(s[0]) == 1:
    idol = sorted(idol.items(), key=lambda x: (-x[1][0], x[0]))
    ans = []
    for i in idol[0:3]:
        ans.append(i[0])
    # print(idol)
    print(", ".join(ans))
elif int(s[0]) == 2:
    idol = sorted(idol.items(), key=lambda x: (-x[1][1], x[0]))
    ans = []
    for i in idol[0:3]:
        ans.append(i[0])
    # print(idol)
    print(", ".join(ans))
elif int(s[0]) == 3:
    for i in bnk:
        kami[i] = 0
    for i, j in ota.items():
        v = sorted(j.items(), key=lambda x: (-x[1], x[0]))
        kami[v[0][0]] += 1
    kami = sorted(kami.items(), key=lambda x: (-x[1], x[0]))
    ans = []
    for i in kami[0:3]:
        ans.append(i[0])
    # print(idol)
    print(", ".join(ans))

"""

SOMCHAI CHERPRANG 10
SOMCHAI NATHERINE 5
PRABHAS JENNIS 3
SOMCHAI CHERPRANG 4
DUANGDAO TURTLE 1
EKAPOL TURTLE 1
SETHA TURTLE 1
CHAIRAT TURTLE 1
JENNIS JENNIS 10
PRABHAS JANE 8
MANA CHERPRANG 2
MANEE CHERPRANG 1
CHUJAI TURTLE 1
PITI JENNIS 1
PITI JANE 1
VEERA CHERPRANG 1

"""
