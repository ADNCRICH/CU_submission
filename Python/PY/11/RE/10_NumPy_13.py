import numpy as np
from numpy.core.records import array


def p(X):
    return 1/(1+np.e**(3.98-0.1*X[::, 0]-0.5*X[::, 1]))
    # return np.array([1/(1+np.e**(3.98 - 0.1*x - 0.5*y)) for x, y in X])


exec(input().strip())
