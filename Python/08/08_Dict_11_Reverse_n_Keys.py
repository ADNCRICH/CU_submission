def reverse(d):
    return {j: i for i, j in d.items()}


def keys(d, v):
    return [i for i, j in d.items() if j == v]


exec(input().strip())
