n = int(input())
song = {}
all = 0


def score(lv, s):
    return int(25 * (lv + 1) * s / 10000000)


for i in range(n):
    p = [k.strip() for k in input().split('|')]
    if p[0] == 'Play':
        rat = score(int(p[2]), int(p[3]))
        raw = int(p[3])
        if not p[1] in song:
            song[p[1]] = (int(p[2]), rat, raw)
        elif rat > song[p[1]][1]:
            song[p[1]] = (int(p[2]), rat, raw)
        elif rat == song[p[1]][1] and int(p[2]) > song[p[1]][0]:
            song[p[1]] = (int(p[2]), rat, raw)
        elif rat == song[p[1]][1] and int(p[2]) == song[p[1]][0] and raw > song[p[1]][2]:
            song[p[1]] = (int(p[2]), rat, raw)
    if p[0] == 'Rating':
        if len(p) == 1:
            so = sorted(song.items(), key=lambda x: -x[1][1])
            print(sum(so[j][1][1] for j in range(min(5, len(so)))))
        else:
            if p[1] in song:
                print(song[p[1]][1])
            else:
                print(0)
    if p[0] == 'Detail':
        if p[1] in song:
            print(" | ".join([p[1], str(song[p[1]][0]), str(song[p[1]][2]), str(song[p[1]][1])]))
        else:
            print(p[1]+": No play history")
