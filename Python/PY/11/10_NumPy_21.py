import numpy as np


def sum_2_rows(M):
    return M[::2] + M[1::2]


def sum_left_right(M):
    return M[:, :len(M[0])//2] + M[:, len(M[0])//2:]


def sum_upper_lower(M):
    pass


def sum_4_quadrants(M):
    pass


def sum_4_cells(M):
    pass


def count_leap_years(years):
    pass


exec(input().strip())
