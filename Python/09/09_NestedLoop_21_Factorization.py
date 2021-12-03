def factor(N):
    n = int(N)
    ans = []
    for i in range(2, int(N)+1):
        c = 0
        while n % i == 0:
            c += 1
            n /= i
        if(c > 0):
            ans.append([i, c])
    return ans


exec(input().strip())
