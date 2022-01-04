import numpy as np


def sum_2_rows(M):
    return M[::2] + M[1::2]


def sum_left_right(M):
    return M[:, :len(M[0])//2] + M[:, len(M[0])//2:]


def sum_upper_lower(M):
    return M[:len(M[0])//2] + M[len(M)//2:]


def sum_4_quadrants(M):
    m1 = len(M)//2
    m2 = len(M[0])//2
    # return sum(M[m1*(i):m1*(i+1), m2*(j):m2*(j+1)] for i in range(2) for j in range(2))
    return M[:m1, :m2] + M[:m1, m2:] + M[m1:, :m2] + M[m1:, m2:]


def sum_4_cells(M):
    return sum(M[i::2, j::2] for i in range(2) for j in range(2))


def count_leap_years(years):
    years -= 543
    return len([y for y in years if (y % 4 == 0 and y % 100 != 0) or (y % 400 == 0)])


exec(input().strip())
