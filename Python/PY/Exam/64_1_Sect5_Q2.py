n = int(input())
song = {}  # k:song name, v:[lv, rat, sco]


def rat(lv, s):
    return int(25*(lv+1)*s/10**7)


for i in range(n):
    x = [e.strip() for e in input().split('|')]

    if x[0] == "Play":
        ra = rat(int(x[2]), int(x[3]))
        sco = int(x[3])
        lv = int(x[2])
        if x[1] not in song:
            song[x[1]] = [lv, ra, sco]
        elif ra > song[x[1]][1]:
            song[x[1]] = [lv, ra, sco]
        elif ra == song[x[1]][1] and x[2] > song[x[1]][0]:
            song[x[1]] = [lv, ra, sco]
        elif ra == song[x[1]][1] and x[2] == song[x[1]][0] and sco > song[x[1]][2]:
            song[x[1]] = [lv, ra, sco]

    if x[0] == "Rating":
        if len(x) == 1:
            s = sorted(song.items(), key=lambda x: (-x[1][1]))
            print(sum(s[k][1][1] for k in range(min(5, len(s)))))
        else:
            if x[1] in song:
                print(song[x[1]][1])
            else:
                print(0)

    if x[0] == "Detail":
        if x[1] in song:
            print(' | '.join([x[1], str(song[x[1]][0]), str(song[x[1]][2]), str(song[x[1]][1])]))
        else:
            print(x[1] + ": No play history")

"""

5
Play | Hello | 10 | 9000000
Play | Hello | 10 | 10000000
Play | Despacito | 15 | 9500000
Rating
Rating | Hello

"""
