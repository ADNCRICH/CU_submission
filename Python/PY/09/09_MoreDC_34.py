def pattern1(nrows, ncols):
    return [[i * ncols + j + 1 for j in range(ncols)] for i in range(nrows)]


def pattern2(nrows, ncols):
    return [[j * nrows + i + 1 for j in range(ncols)] for i in range(nrows)]


def pattern3(N):
    a = [[0 for i in range(N)] for j in range(N)]
    cnt = 1
    for i in range(N):
        for j in range(i, N):
            a[i][j] = cnt
            cnt += 1
    return a


def pattern4(N):
    a = [[0 for i in range(N)] for j in range(N)]
    cnt = 1
    for j in range(N):
        for i in range(j, -1, -1):
            a[i][j] = cnt
            cnt += 1
    return a


def pattern5(N):
    a = [[0 for i in range(N)] for j in range(N)]
    cnt = 1
    for x in range(N):
        i = 0
        j = x
        while j < N:
            a[i][j] = cnt
            cnt += 1
            i += 1
            j += 1
    return a


def pattern6(N):
    a = [[0 for i in range(N)] for j in range(N)]
    cnt = 1
    for x in range(N):
        if x % 2 == 0:
            i = 0
            j = x
        else:
            i = N-1-x
            j = N-1
        while j < N and i >= 0:
            a[i][j] = cnt
            cnt += 1
            i += 1 if x % 2 == 0 else -1
            j += 1 if x % 2 == 0 else -1
    return a


exec(input().strip())
