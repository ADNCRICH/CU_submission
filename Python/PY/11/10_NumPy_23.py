import numpy as np


def read_data():
    w = [float(e) for e in input().split()]
    weight = np.array(w)
    n = int(input())
    data = np.ndarray((n, 4), int)
    for i in range(n):
        data[i] = [int(e) for e in input().split()]
    return weight, data


def report_lower_than_mean(weight, data):
    s = np.sum(weight*data[:, 1:], axis=1)
    a = data[s < np.mean(s)][:, 0]
    # a = [str(i) for i in (data[:, 0][s < sum(s)/len(s)])]
    if len(a) == 0:
        print(None)
    else:
        print(", ".join(map(str, a)))


exec(input().strip())
