import numpy as np
k = int(input())
ans = 0
for ii in range(k):
    n = int(input())
    x, y = [], []
    for i in range(n):
        xx, yy = [int(i) for i in input().split()]
        x.append(xx)
        y.append(yy)
    if (n == 1):
        continue
    x = np.array(x)
    y = np.array(y)
    xb = np.mean(x)
    yb = np.mean(y)
    x = x-xb
    y = y-yb
    v = (x*x+y*y)
    ans = ans + (np.sum(v)/(v.shape[0]-1))
print(ans)

"""
3
1
-7 -7
2
-3 -3
-2 -4
6
1 2
2 2
3 3
6 6
7 7
8 8
"""
