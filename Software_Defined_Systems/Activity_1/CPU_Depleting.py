import time
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

n = 50000
a = []

for i in range(n):
    a.append(time.time_ns())
    b = np.random.rand(1000000)
    b = np.sort(b)
    