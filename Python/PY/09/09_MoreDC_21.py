def factor(N):
    ans = []
    for i in range(2, N+1):
        c = 0
        while N % i == 0:
            c += 1
            N /= i
        if c > 0:
            ans.append([i, c])
    return ans


exec(input().strip())
