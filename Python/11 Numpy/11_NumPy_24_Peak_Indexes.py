import numpy as np


def peak_indexes(x):  # 1 -> -1 : peak
    a = np.diff(np.sign(np.diff(x)))
    return np.arange(1, len(a)+1)[a == -2]
 # x เป็นอาเรย์เก็บจ านวนต่าง ๆ
 # คืนอาเรย์ที่เก็บต าแหน่งใน x ที่เป็น "ยอด"


def main():
    d = np.array([float(e) for e in input().split()])
    pos = peak_indexes(np.array(d))
    if len(pos) > 0:
        print(", ".join([str(e) for e in pos]))
    else:
        print("No peaks")


exec(input().strip())  # Don't remove this line
