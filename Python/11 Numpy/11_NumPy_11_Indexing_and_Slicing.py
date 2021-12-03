import numpy as np
from numpy.lib.twodim_base import fliplr
# A is a 2-d array


def get_column_from_bottom_to_top(A, c):
    return A[::-1, c]


def get_odd_rows(A):
    return A[1::2]


def get_even_column_last_row(A):
    return A[-1, ::2]


def get_diagonal1(A):  # A is a square matrix
    # return np.array([A[i][i] for i in range(len(A))])
    return A.diagonal()
 # from top-left corner down to bottom-right corner


def get_diagonal2(A):  # A is a square matrix
    # return np.array([A[i][len(A)-i-1] for i in range(len(A))])
    return np.fliplr(A).diagonal()


 # from top-right corner down to bottom-left corner
exec(input().strip())
