def make_int_list(x):
    return [int(i) for i in x.split()]


def is_odd(e):
    return True if e % 2 == 1 else False


def odd_list(alist):
    return [x for x in alist if is_odd(x)]


def sum_square(alist):
    return sum(i*i for i in alist)


exec(input().strip())  # ต้องมีบรรทัดนี้เมื่อส่งไป grader
