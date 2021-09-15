def is_odd(n):
    return n % 2 == 1


def has_odds(x):
    ch = False
    for i in x:
        ch = ch | is_odd(i)
    return ch


def all_odds(x):
    ch = True
    for i in x:
        ch = ch & is_odd(i)
    return ch


def no_odds(x):
    return not has_odds(x)


def get_odds(x):
    return [i for i in x if is_odd(i)]


def zip_odds(a, b):
    t = []
    aa = get_odds(a)
    bb = get_odds(b)
    ma = max(len(aa), len(bb))
    for i in range(0, ma):
        if i < len(aa):
            t.append(aa[i])
        if i < len(bb):
            t.append(bb[i])
    return t


exec(input().strip())
