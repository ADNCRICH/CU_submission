from scipy.stats import norm
import numpy as np
import matplotlib.pyplot as plt

sample_size = 1000000
a = np.zeros(sample_size)
degree = 2
mu = 3

for i in range(degree):
  s = norm.rvs(loc=mu,scale=1,size=sample_size)**2
  a = a + s
count, bins, ignored = plt.hist(a, 2000, density=False)
plt.show()
