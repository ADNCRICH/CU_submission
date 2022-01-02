import numpy as np


def p(X):
    return np.array([1 / (1 + np.e**(3.98 - 0.1*x - 0.5*y)) for x, y in X])


exec(input().strip())
