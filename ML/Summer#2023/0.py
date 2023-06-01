import matplotlib.pyplot as plt
import numpy as np
from sklearn.metrics import ConfusionMatrixDisplay


# x = np.linspace(0, 10)

# for n in range(3):
#     y = np.sin(x+n)
#     plt.figure()
#     plt.plot(x, y)

# plt.show()

a = np.array([[1, 2], [3, 4]])
for i in range(5):
    disp = ConfusionMatrixDisplay(a)
    disp.plot()
    disp.ax_.set_title("this is %d %d" % (i, i+1))
    plt.show()
