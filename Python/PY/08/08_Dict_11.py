def reverse(d):
    # a={}
    # for i, j in d.items():
    #     a[j] = i
    # return a

    return {j: i for i, j in d.items()}


def keys(d, v):
    return [i for i, j in d.items() if j == v]


exec(input().strip())
