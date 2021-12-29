def read_matrix():
    m = []
    nrows = int(input())
    for k in range(nrows):
        m.append([float(i) for i in input().split()])
    return m


def mult_c(c, A):
    for i in range(len(A)):
        for j in range(len(A[i])):
            A[i][j] *= c
    return A


def mult(A, B):
    a = [[0 for i in range(len(B[0]))] for j in range(len(A))]
    for i in range(len(A)):
        for j in range(len(B[0])):
            for k in range(len(A[0])):
                a[i][j] += A[i][k] * B[k][j]
    return a


exec(input().strip())
