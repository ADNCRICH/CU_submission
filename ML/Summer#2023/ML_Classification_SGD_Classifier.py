import os
import numpy as np
from sklearn.linear_model import SGDClassifier
from sklearn.metrics import confusion_matrix, ConfusionMatrixDisplay
from matplotlib import pyplot as plt
import multiprocessing as mp
import Data_Formatter

d = []
dir = r"D:\AD\CU_submission\ML\Summer#2023\output\trainSet_out"

dir = dir.replace("\\", "\\\\")
for i in os.listdir(dir):
    d.append(np.load(os.path.join(dir, i)))

print("padding data...")
X = Data_Formatter.pad_Data(d)

print("Splitting data...")
X_train, X_test, y_train, y_test = Data_Formatter.my_Split(X, "training-groundtruth2.csv")
print(X_train.shape, X_test.shape, y_train.shape, y_test.shape)

print("Flattening data...")
X_train = X_train.reshape(X_train.shape[0], -1)
X_test = X_test.reshape(X_test.shape[0], -1)

N = 1
model = SGDClassifier(n_jobs=mp.cpu_count(), random_state=0, max_iter=10000, loss='hinge', verbose=1, alpha=0.0001, class_weight='balanced')
for i in range(N):
    print("round", i+1)

    # train model
    print("Training...")
    clf = model.partial_fit(X_train, y_train, classes=np.unique(y_train))

    # test model
    print("Testing...")
    print(clf.score(X_test, y_test))

    y_pred = clf.predict(X_test)
    CM = confusion_matrix(y_test, y_pred, labels=clf.classes_)
    disp = ConfusionMatrixDisplay(CM, display_labels=clf.classes_)
    disp.plot()
    disp.ax_.set_title("round %d" % (i+1))
    dir = r"D:\AD\CU_submission\ML\Summer#2023\output\Confusion_Matrix\SGD"
    dir = dir.replace("\\", "\\\\")
    plt.savefig(os.path.join(dir, "SGD_Figure_%d_2.png" % (i+1)))
plt.show()
