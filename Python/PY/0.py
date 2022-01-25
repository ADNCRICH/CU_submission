import math


def term_k(x, k):
    return ((-1)**(k % 2)*x**(2*k+1)/math.factorial(2*k+1))


def app_sin(x):
    k = 0
    MySin = term_k(x, 0)
    while(err(MySin, math.sin(x)) >= 10**-6):
        k += 1
        MySin += term_k(x, k)

    return MySin, k


def err(a, b):
    return ((a-b)**2)**0.5


print(app_sin(-10))
