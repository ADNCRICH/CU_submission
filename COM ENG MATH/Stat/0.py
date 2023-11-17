from scipy.stats import binom, norm, t
import numpy as np

p, n= 1/6, 200

reg = 0.01
fp = 20
sig = 10**-fp
ma = 0
for k in range(1, n + 1):
  l, r = 0, 1
  i = -1
  s = 0
  while s <= 0.01:
    i = i + 1
    s = s + binom.pmf(i, k, p)
  i = i - 1
  while(l != r):
    mid = round(np.floor((l+r)/sig/2)*sig, fp)
    if(binom.cdf(i, k, mid) >= reg):
      l = round(mid + sig, fp)
    else:
      r = mid
  ma = max(ma, l)
print("use winning prob to be",round(ma, 5))