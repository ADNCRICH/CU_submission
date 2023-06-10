import numpy as np
import csv


def init(d):
    lens = np.array([i['embedding'].shape[0] for i in d])
    ma = np.max(lens)
    mi = np.min(lens)
    mean = int(np.mean(lens))
    return {"max": ma, "min": mi, "mean": mean}


def resize_Data(d):
    mean = init(d)['mean']
    x = []
    for i in d:
        if i['embedding'].shape[0] < mean:
            x.append(np.pad(i['embedding'], ((0, mean-i['embedding'].shape[0]), (0, 0)), 'constant', constant_values=0))
        else:
            x.append(i['embedding'][:mean])
    return np.array(x)


def pad_Data(d):
    ma = init(d)['max']
    x = [np.pad(i['embedding'], ((0, ma-i['embedding'].shape[0]), (0, 0)), 'constant', constant_values=0) for i in d]
    return np.array(x)


def clip_Data(d):
    mi = init(d)['min']
    return np.array([i['embedding'][:mi] for i in d])


def my_Split(X, name):
    X_train, X_test, y_train, y_test = [], [], [], []
    with open("source//"+name, "r") as f:
        next(f)
        for n, i in enumerate(f):
            d = [k.strip() for k in i.split(",")]
            (X_test if d[6] == "test" else X_train).append(X[n])
            (y_test if d[6] == "test" else y_train).append(1 if d[4] == "Control" else 0)
    return np.array(X_train), np.array(X_test), np.array(y_train), np.array(y_test)
