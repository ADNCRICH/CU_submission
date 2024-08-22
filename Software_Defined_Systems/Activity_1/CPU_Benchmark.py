import time
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

n = 50000
a = []

for i in range(n):
    a.append(time.time_ns())

a = np.array(a) * 1e-9
a = a - a[0]
# a = np.round(a, 9)
x = np.arange(n)

df = pd.DataFrame({'iters': x, 'time': a})
df.to_csv('data.csv', index=False)

plt.plot(x, a)
plt.xlim(0, n)
plt.ylim(0, 0.005)
plt.xlabel('Iterations')
plt.ylabel('Time (s)')
plt.title('Time vs Iterations')
plt.savefig('plot.png')