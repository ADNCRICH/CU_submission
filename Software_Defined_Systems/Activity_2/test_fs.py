import argparse
import os
import time
import numpy as np
import pandas as pd

    # path to file and N
parser = argparse.ArgumentParser()
parser.add_argument('F', type=str)
parser.add_argument('N', type=int)
args = parser.parse_args()
F = args.F
N = args.N
# print(F, N)
if not os.path.exists(F):
    print("File does not exist")
    exit(1)

write_path = './out'
if not os.path.exists(write_path):
    os.makedirs(write_path)

with open(F, 'r') as f:
    data = f.read()

a = []

f_name = F.replace('/', ' ').replace('.', ' ').split()[-2]

a.append(time.time_ns())
for i in range(N):
    with open(os.path.join(write_path, f'out_{f_name}_{i}.txt'), 'w') as w:
        w.write(data)
    a.append(time.time_ns())

a = np.array(a) / 1e9
a = a - a[0]

df = pd.DataFrame({'iters': np.arange(N+1), 'time': a})
df.to_csv(f'./data_{f_name}.csv', index=False)

print("Time taken: ", a[-1], "s")