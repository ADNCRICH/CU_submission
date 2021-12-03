def first_fit(L, e):  # น ำ e ใสรำยกำรย่อยใ ่ น L ด ้วยวิธี first fit
    a = L
    for i in range(len(L)):
        if sum(L[i]) + e <= 100:
            a[i].append(e)
            return a
    a.append([e])
    return a


def best_fit(L, e):  # น ำ e ใสรำยกำรย่อยใ ่ น L ด ้วยวิธี best fit
    a = L
    mx = idx = -1
    for i in range(len(L)):
        if sum(L[i]) + e > 100:
            continue
        if mx < sum(L[i])+e:
            mx = sum(L[i])+e
            idx = i
    if idx != -1:
        a[idx].append(e)
    else:
        a.append([e])
    return a


def partition_FF(D):  # คืนลิสต์ของลิสต์ที่ได ้จำกกำรแบ่งข ้อมูลใน D ด ้วย first fit
    a = []
    for i in D:
        a = first_fit(a, i)
    return a


def partition_BF(D):  # คืนลิสต์ของลิสต์ที่ได ้จำกกำรแบ่งข ้อมูลใน D ด ้วย best fit
    a = []
    for i in D:
        a = best_fit(a, i)
    return a


exec(input().strip())
