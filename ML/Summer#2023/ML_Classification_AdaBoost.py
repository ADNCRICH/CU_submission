import os
import numpy as np
import csv
from sklearn.model_selection import train_test_split
from sklearn.metrics import confusion_matrix, ConfusionMatrixDisplay
from sklearn.ensemble import AdaBoostClassifier
from matplotlib import pyplot as plt
import Data_Formatter

d = []
dir = r"D:\AD\CU_submission\ML\Summer#2023\output\trainSet_out"

dir = dir.replace("\\", "\\\\")
for i in os.listdir(dir):
    d.append(np.load(os.path.join(dir, i)))


print("padding data...")
X = Data_Formatter.pad_Data(d)

print("Loading labels...")
y = []
with open("training-groundtruth.csv", "r") as f:
    r = csv.reader(f)
    next(r)
    for i in r:
        y.append(1 if i[4] == "Control" else 0)
y = np.array(y)
print(X.shape, y.shape)
# flatten X last 2 dimensions
print("Flattening data...")
X = X.reshape(X.shape[0], -1)

N = 5
model = AdaBoostClassifier(n_estimators=13, random_state=0)
name = "AdaBoost"
for i in range(N):
    print("round", i+1)

    # split data
    print("Splitting data...")
    X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2)

    # train model
    print("Training...")
    clf = model.fit(X_train, y_train)
    # test model
    print("Testing...")
    print(clf.score(X_test, y_test))

    print("Exporting Score...")
    y_pred = clf.predict(X_test)
    CM = confusion_matrix(y_test, y_pred, labels=clf.classes_)
    disp = ConfusionMatrixDisplay(CM, display_labels=clf.classes_)
    disp.plot()
    disp.ax_.set_title("round %d" % (i+1))
    dir = r"D:\AD\CU_submission\ML\Summer#2023\output\Confusion_Matrix\Adaboost"
    dir = dir.replace("\\", "\\\\")
    plt.savefig(os.path.join(dir, "%s_Figure_%d.png" % (name, i+1)))
plt.show()
