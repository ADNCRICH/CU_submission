import numpy as np
from numpy.core.fromnumeric import diagonal
from numpy.lib import flip


def get_column_from_bottom_to_top(A, c):
    return A[::-1, c]


def get_odd_rows(A):
    return A[1::2]


def get_even_column_last_row(A):
    return A[-1, ::2]


def get_diagonal1(A):
    return A.diagonal()
    # return np.array([A[i][i] for i in range(len(A))])


def get_diagonal2(A):
    return np.fliplr(A).diagonal()
    # return np.array([A[i][len(A)-i-1] for i in range(len(A))])


exec(input().strip())
