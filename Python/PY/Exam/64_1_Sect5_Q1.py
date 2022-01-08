n = int(input())

dp1 = [0 for i in range(7*n+3)]  # fast
dp2 = [0 for i in range(7*n+3)]  # slow

a = []
mode = 0  # 1 prepare to buy, -1 to sell
ch = 0

for i in range(n):
    x = input().split(',')
    for j in x:
        a.append(float(j))

if n < 2:
    print("No results")
    exit(0)

dp1[6] = sum(a[0:7])/7
for i in range(7, n*7):
    dp1[i] = 0.25*a[i] + 0.75*dp1[i-1]

dp2[13] = sum(a[:14])/14
for i in range(14, n*7):
    dp2[i] = a[i]*2/15 + dp2[i-1]*13/15

if dp1[13] < dp2[13]:
    mode = 1
else:
    mode = -1

for i in range(13, 7*n):
    if mode == 1 and dp1[i] > dp2[i]:
        print("BUY at " + str(round(a[i], 2)) + "0"*(2-len(str(round(a[i], 2)).split('.')[1])))
        ch = 1
        mode = -1
    elif mode == -1 and dp1[i] < dp2[i]:
        print("SELL at " + str(round(a[i], 2)) + "0"*(2-len(str(round(a[i], 2)).split('.')[1])))
        ch = 1
        mode = 1

if ch == 0:
    print("No results")
