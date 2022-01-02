def first_fit(L, e):
    for i in range(len(L)):
        if sum(L[i])+e <= 100:
            L[i].append(e)
            return L
    L.append([e])
    return L


def best_fit(L, e):
    mx = idx = -1
    for i in range(len(L)):
        if sum(L[i]) + e > 100:
            continue
        if mx < sum(L[i]) + e:
            mx = sum(L[i]) + e
            idx = i
    if idx == -1:
        L.append([e])
    else:
        L[idx].append(e)
    return L


def partition_FF(D):
    a = []
    for i in D:
        a = first_fit(a, i)
    return a


def partition_BF(D):
    a = []
    for i in D:
        a = best_fit(a, i)
    return a


exec(input().strip())
