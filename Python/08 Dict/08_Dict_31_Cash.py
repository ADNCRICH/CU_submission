def total(pocket):
    c = 0
    for i in pocket:
        c += i*pocket[i]
    return c
    # --- or use return sum([i*pocket[i] for i in pocket]) --- #


def take(pocket, money_in):
    for i in money_in:
        if i in pocket:
            pocket[i] += money_in[i]
        else:
            pocket[i] = money_in[i]


def pay(pocket, amt):
    use = {}
    for i in sorted(pocket, key=lambda x: -x):
        if amt >= i:
            use[i] = min(pocket[i], amt//i)
            amt -= use[i]*i
    if amt != 0:
        return {}
    for i in use:
        pocket[i] -= use[i]
    return use


# p = {100: 3, 10: 5, 5: 10, 1: 7}
# print(pay(p, 52))
# print(p)

exec(input().strip())
