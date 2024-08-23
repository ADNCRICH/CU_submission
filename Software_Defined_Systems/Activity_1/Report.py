import numpy as np
import pandas as pd
import matplotlib.pyplot as plt

local = pd.read_csv('./data/data.csv')
ec2 = pd.read_csv('./data/data_ec2.csv')
ec2_wo = pd.read_csv('./data/data_ec2_wo.csv')

l = np.array(ec2_wo['time'])
l[np.where(l[1:] - l[:-1] > (l[-1] / 50000)*20)] = np.nan

plt.title('Time vs Iterations (Scaled)')
plt.plot(local['iters'], local['time'], label='Local : Intel i7-13700k')
plt.plot(ec2['iters'], ec2['time'], label='EC2 : Intel Xeon E5-2676')
plt.plot(ec2_wo['iters'], l, label='EC2 w/o Credit : Intel Xeon E5-2676')
plt.xlim(0, 50000)
# plt.ylim(0)
plt.ylim(0, 0.05)
plt.xlabel('Iterations')
plt.ylabel('Time (s)')
plt.legend()
plt.savefig('./out/plot_2.png')
