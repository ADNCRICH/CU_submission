import numpy as np
from sklearn.linear_model import LogisticRegression
from sklearn import tree
from sklearn.model_selection import train_test_split
from sklearn.metrics import confusion_matrix, ConfusionMatrixDisplay
from matplotlib import pyplot as plt

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
ma = np.max(lens)
print(ma)

print("padding data...")
X = np.array([np.pad(i['embedding'], ((0, ma-i['embedding'].shape[0]), (0, 0)), 'constant', constant_values=0) for i in d])
print(X.shape)
y = np.array([1, 0, 1, 0, 1, 0, 0, 1])

# flatten X last 2 dimensions
print("Flattening data...")
X = X.reshape(X.shape[0], -1)

print(X.shape, y.shape)
# split data
N = 5
# model = LogisticRegression(random_state=0, max_iter=50000)
model = tree.DecisionTreeClassifier()
for i in range(N):
    print("round", i+1)

    # split data
    print("Splitting data...")
    X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.3)

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
