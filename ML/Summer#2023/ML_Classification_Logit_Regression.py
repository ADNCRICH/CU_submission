import os
import numpy as np
import csv
from sklearn.model_selection import train_test_split
from sklearn.linear_model import LogisticRegression
from sklearn.metrics import confusion_matrix, ConfusionMatrixDisplay
from matplotlib import pyplot as plt

d = []
dir = r"D:\AD\CU_submission\ML\Summer#2023\output\trainSet_out"

dir = dir.replace("\\", "\\\\")
for i in os.listdir(dir):
    d.append(np.load(os.path.join(dir, i)))

print("Preparing data...")
lens = np.array([i['embedding'].shape[0] for i in d])
ma = np.max(lens)
mi = np.min(lens)
mean = int(np.mean(lens))

print("Resizing data to mean...")
x = []
for i in d:
    if i['embedding'].shape[0] < mean:
        x.append(np.pad(i['embedding'], ((0, mean-i['embedding'].shape[0]), (0, 0)), 'constant', constant_values=0))
    else:
        x.append(i['embedding'][:mean])
X = np.array(x)

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
model = LogisticRegression(random_state=0, max_iter=50000)
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

    y_pred = clf.predict(X_test)
    CM = confusion_matrix(y_test, y_pred, labels=clf.classes_)
    disp = ConfusionMatrixDisplay(CM, display_labels=clf.classes_)
    disp.plot()
    disp.ax_.set_title("round %d" % (i+1))
plt.show()
