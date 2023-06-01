import numpy as np
from sklearn.linear_model import LogisticRegression
from sklearn.model_selection import train_test_split

d = []
for i in [2, 9, 46, 47, 54, 81, 87, 97]:
    d.append(np.load("D:\AD\CU_submission\ML\Summer#2023\output\sample-gr_out\madrs"+str(i).zfill(3)+"_out.npz"))

# ma = 0
# for i in data:
#     ma = max(ma, i['embedding'].shape[0])

# # pad data
# for i in data:
#     d = i['embedding']
#     d = np.pad(d, ((0, ma-d.shape[0]), (0, 0)), 'constant', constant_values=0)
#     print(d.shape)

ma = 0
lens = np.array([i['embedding'].shape[0] for i in d])
ma = np.max(len)
print(ma)