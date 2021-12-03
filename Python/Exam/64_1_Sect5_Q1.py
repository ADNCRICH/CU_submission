n = int(input())
dp1 = [0 for i in range(n*7+5)]
dp2 = [0 for i in range(n*7+5)]
a = []
mode = 0
ch = 0

for i in range(n):
    k = input().split(',')
    for j in k:
        a.append(float(j))
if n == 1:
    print("No results")
    exit(0)
dp1[6] = sum(a[0:7]) / 7
for i in range(7, n*7):
    dp1[i] = 0.25*a[i] + dp1[i-1]*0.75

dp2[13] = sum(a[0:14]) / 14
for i in range(14, n*7):
    dp2[i] = 2/15*a[i] + dp2[i-1]*13/15

if(dp1[13] < dp2[13]):
    mode = 1
else:
    mode = -1

for i in range(13, 7*n):
    if(mode == 1 and dp1[i] > dp2[i]):
        print("BUY at " + str(round(a[i], 2)) + "0"*(2-len(str(round(a[i], 2)).split('.')[1])))
        ch = 1
        mode = -1
    if(mode == -1 and dp1[i] < dp2[i]):
        print("SELL at " + str(round(a[i], 2)) + "0"*(2-len(str(round(a[i], 2)).split('.')[1])))
        ch = 1
        mode = 1
if(ch == 0):
    print("No results")
"""

4
6.59,7.34,7.15,7.18,7.14,7.41,7.29
7.24,7.21,7.19,7.24,7.32,7.39,7.27
7.2,7.19,7,7.3,7.35,7.35,7.72
8.06,8.07,7.8,8.08,8.07,8.16,8.12

"""
