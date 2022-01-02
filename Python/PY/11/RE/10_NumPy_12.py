import numpy as np


def toCelsius(f):
    return (f-32)*5/9
    # return np.array([(i-32)*5/9 for i in f])


def BMI(wh):
    return wh[::, 0] / (wh[::, 1]/100)**2
    # return np.array([w/(h/100)**2 for w, h in wh])


def distanceTo(p, Points):
    return ((Points[::, 0] - p[0])**2 + (Points[::, 1] - p[1])**2)**0.5
    # return np.array([((p[0]-x)**2 + (p[1]-y)**2)**0.5 for x, y in Points])


exec(input().strip())
