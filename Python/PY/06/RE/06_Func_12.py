def is_prime(n):
 # ทดสอบว่า n เป็นจ านวนเฉพาะหรือไม่
    if n <= 1:
        return False
    for k in range(2, int(n**0.5)+1):
        if n % k == 0:
            return False
    return True


def next_prime(N):
 # คืนจ านวนเฉพาะตัวที่มีค่าน้อยสุดที่มากกว่า N
    N += 1
    while not is_prime(N):
        N += 1
    return N


def next_twin_prime(N):
    # N += 1
    N += (1 if N % 2 == 0 else 2)
    while not (is_prime(N) and is_prime(N+2)):
        # N += 1
        N += 2
    return (N, N+2)

 # คืนจ านวนเฉพาะสองค่าที่เป็น twin prime ที่มีค่าน้อยสุดที่มากกว่า N
 # twin prime คือจ านวนเฉพาะที่มีค่าต่างกัน 2 เชน่ 11 กับ 13 หรือ 41 กับ 43
print(next_twin_prime(30))
