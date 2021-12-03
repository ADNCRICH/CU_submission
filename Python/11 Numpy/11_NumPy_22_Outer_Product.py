import numpy as np


def mult_table(nrows, ncols):
    return np.outer(np.arange(1, nrows+1), np.arange(1, ncols+1))

 # คืนอาเรย์ที่มี shape เป็น (nrow, ncols) ภายในเก็บตารางสูตรคูณ (ดูตัวอย่างข ้างล่าง)
exec(input().strip())
