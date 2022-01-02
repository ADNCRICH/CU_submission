def gcd(a, b):
    while b != 0:
        a, b = b, a % b
    return a


def is_coprime(a, b, c):
    return True if gcd(gcd(a, b), c) == 1 else False

    # if gcd(gcd(a, b), c) ==1:
    #     return True
    # return False


def primitive_Pythagorean_triples(max_len):
    triple = []
    for k in range(1, max_len+1):
        for i in range(1, round(k/2**0.5)):
            j = round((k*k - i*i)**0.5)
            if j == (k*k - i*i)**0.5 and is_coprime(i, j, k):
                triple.append([i, j, k])
    return triple


exec(input().strip())
