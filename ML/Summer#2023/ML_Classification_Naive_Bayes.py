import os
import numpy as np
import csv
from sklearn.model_selection import train_test_split
from sklearn.naive_bayes import GaussianNB, MultinomialNB, BernoulliNB
from sklearn.metrics import confusion_matrix, ConfusionMatrixDisplay
from matplotlib import pyplot as plt
import Data_Formatter

d = []
dir = r"D:\AD\CU_submission\ML\Summer#2023\output\trainSet_out"

dir = dir.replace("\\", "\\\\")
for i in os.listdir(dir):
    d.append(np.load(os.path.join(dir, i)))


# print("padding data...")
# X = Data_Formatter.pad_Data(d)

print("clipping data...")
X = Data_Formatter.clip_Data(d)

# print("resizing data...")
# X = Data_Formatter.resize_Data(d)

print("Splitting data...")
X_train, X_test, y_train, y_test = Data_Formatter.my_Split(X, "training-groundtruth2.csv")
print(X_train.shape, X_test.shape, y_train.shape, y_test.shape)

print("Flattening data...")
X_train = X_train.reshape(X_train.shape[0], -1)
X_test = X_test.reshape(X_test.shape[0], -1)

N = 1
model = [GaussianNB(), BernoulliNB()]
name = ["GaussianNB", "BernoulliNB"]
for k in range(len(model)):
    for i in range(N):
        print("round", i+1)

        # train model
        print("Training...")
        clf = model[k].fit(X_train, y_train)
        # test model
        print("Testing...")
        print(clf.score(X_test, y_test))

        print("Exporting Score...")
        y_pred = clf.predict(X_test)
        CM = confusion_matrix(y_test, y_pred, labels=clf.classes_)
        disp = ConfusionMatrixDisplay(CM, display_labels=clf.classes_)
        disp.plot()
        disp.ax_.set_title("%s round %d" % (name[k], i+1))
        dir = r"D:\AD\CU_submission\ML\Summer#2023\output\Confusion_Matrix\Naive_Bayes"
        dir = dir.replace("\\", "\\\\")
        plt.savefig(os.path.join(dir, "%s_Figure_%d_new.png" % (name[k], i+1)))
plt.show()
