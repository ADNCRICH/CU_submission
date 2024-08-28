import argparse
import os
import time

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

st = time.time_ns()
for i in range(N):
    with open(F, 'r') as f:
        lines = f.readlines()
        with open(os.path.join(write_path, 'out_'+str(i)+'.txt'), 'w') as w:
            for line in lines:
                w.write(line)
ed = time.time_ns()

print("Time taken: ", (ed-st)/1e9, "s")