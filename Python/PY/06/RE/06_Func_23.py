def make_int_list(x):
    return [int(i) for i in x.split()]


def is_odd(e):
    return e % 2 == 1


def odd_list(alist):
    return [i for i in alist if is_odd(i)]


def sum_square(alist):
    return sum(i*i for i in alist)


exec(input().strip())
