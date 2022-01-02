import numpy as np


def toCelsius(f):
    return np.array([(i-32)*5/9 for i in f])


def BMI(wh):
    return np.array([w / (h/100)**2 for w, h in wh])


def distanceTo(p, Points):
    return np.array([((p[0]-i[0])**2 + (p[1]-i[1])**2)**0.5 for i in Points])


exec(input().strip())
