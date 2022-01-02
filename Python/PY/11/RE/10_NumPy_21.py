import numpy as np


def sum_2_rows(M):
    return M[::2] + M[1::2]


def sum_left_right(M):
    return M[::, :len(M[0])//2] + M[::, len(M[0])//2:]


def sum_upper_lower(M):
    return M[:len(M)//2] + M[len(M)//2:]


def sum_4_quadrants(M):
    return sum(M[len(M)//2*i:len(M)//2*(i+1), len(M)//2*j:len(M)//2*(j+1)] for i in range(2) for j in range(2))
    # return M[:len(M)//2, :len(M)//2] + M[:len(M)//2, len(M)//2:] + M[len(M)//2:, :len(M)//2] + M[len(M)//2:, len(M)//2:]


exec(input().strip())
