def gcd(a, b):
    while b != 0:
        a, b = b, a % b
    return a


def is_coprime(a, b, c):
    return (gcd(gcd(a, b), c) == 1)


def primitive_Pythagorean_triples(max_len):
    triple = []
    for i in range(1, max_len+1):
        for j in range(1, round(i/2**0.5)):
            k = round((i**2-j**2)**0.5)
            if k == (i**2-j**2)**0.5 and is_coprime(i, j, k):
                triple.append([j, k, i])
    return triple


exec(input().strip())
