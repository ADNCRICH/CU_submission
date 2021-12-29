def total(pocket):
    return sum(i*pocket[i] for i in pocket)


def take(pocket, money_in):
    for i in money_in:
        if i not in pocket:
            pocket[i] = 0
        pocket[i] += money_in[i]
    return pocket


def pay(pocket, amt):
    u = {}
    for i in pocket:
        if amt >= i:
            u[i] = min(amt//i, pocket[i])
            amt -= min(amt//i, pocket[i]) * i

    if amt != 0:
        return {}
    for i in u:
        pocket[i] -= u[i]
    return u


exec(input().strip())
