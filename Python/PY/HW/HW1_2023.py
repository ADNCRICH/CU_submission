def center(r):
    x = r[0] + r[2]/2
    y = r[1] - r[3]/2
    return [x, y]


# ======================================
def distance(r1, r2):
    x = center(r1)[0] - center(r2)[0]
    y = center(r1)[1] - center(r2)[1]
    return (x**2 + y**2)**0.5


# ======================================
def intersection(r1, r2):
    x = min(r1[0] + r1[2], r2[0] + r2[2]) - max(r1[0], r2[0])
    y = min(r1[1], r2[1]) - max(r1[1] - r1[3], r2[1] - r2[3])
    return max(x, 0)*max(y, 0)


# ======================================
def union(r1, r2):
    return r1[2]*r1[3] + r2[2]*r2[3] - intersection(r1, r2)


# ======================================
def iou(r1, r2):
    return intersection(r1, r2)/union(r1, r2)


# ======================================

r1 = [1.0, 4.0, 1.5, 2.0]
r2 = [2.0, 5.0, 2.5, 2.0]
r3 = [4.0, 5.5, 1.5, 3.5]
r4 = [6.0, 4.5, 1.5, 2.0]
r5 = [5.75, 7.0, 2.0, 5.0]
print(center(r1))
print(center(r2))
print(round(distance(r1, r2), 2))
print(round(distance(r3, r4), 2))
print(intersection(r1, r2))
print(intersection(r2, r3))
print(intersection(r4, r5))
print(intersection(r1, r5))  # กรณีโบนัส
print(union(r1, r2))
print(union(r2, r3))
print(union(r4, r5))
print(round(iou(r1, r2), 2))
print(round(iou(r2, r3), 2))
print(round(iou(r4, r5), 2))
