import matplotlib.pyplot as plt
import numpy as np
from sklearn.metrics import ConfusionMatrixDisplay
import os


# x = np.linspace(0, 10)

# for n in range(3):
#     y = np.sin(x+n)
#     plt.figure()
#     plt.plot(x, y)

# plt.show()

# a = np.array([[1, 5], [3, 4]])
# for i in range(5):
#     disp = ConfusionMatrixDisplay(a)
#     disp.plot()
#     disp.ax_.set_title("this is %d %d" % (i, i+1))
#     dir = r"D:\AD\CU_submission\ML\Summer#2023\output\Confusion_Matrix\test"
#     dir = dir.replace("\\", "\\\\")
#     plt.savefig(os.path.join(dir, "%s_round %d.png" % ("55", i+1)))
# plt.show()

d = np.load("D:\AD\CU_submission\ML\Summer#2023\output\sample-gr_out\madrs002_out.npz")

for i in d['embedding']:
    print(i)
