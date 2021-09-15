def is_prime(n):
    if n <= 1:
        return False
    for k in range(2, int(n**0.5)+1):
        if n % k == 0:
            return False
    return True


def next_prime(N):
    N += 1
    while(is_prime(N) is False):
        N += (1 if N % 2 == 0 or N == 1 else 2)
    return N


def next_twin_prime(N):
    a = next_prime(N)
    b = next_prime(a)
    while(abs(a-b) != 2):
        a, b = b, next_prime(b)
    return (a, b)


exec(input().strip())
