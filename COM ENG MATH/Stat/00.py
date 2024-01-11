import numpy as np

a = np.array([3,5,1,2,4,5,3,3,1,4])
print(np.mean(a))
print(np.sum((np.mean(a)-a)**2))
print(np.var(a,ddof=1))