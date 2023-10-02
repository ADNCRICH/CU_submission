import numpy as np
import math
import matplotlib.pyplot as plt

# plot sin(2 pi x) x in [0,1] 10 samples dot
N = 8
I = 2
F = 1

x = np.linspace(0, 1, N, endpoint=False)
y = np.sin(2 * np.pi * F * x)
plt.plot(x, y, 'o')
plt.show()
plt.plot(np.fft.ifft(y).real, 'o')
plt.plot(np.fft.ifft(y).imag, 'o')
plt.legend(['real', 'imag'])
plt.show()

xx = []
for i in range(N*I):
    if i % I == 0:
        xx.append(y[i // I])
    else:
        xx.append(0)
lp_filter = np.zeros(N*I)
lp_filter.fill(1)
lp_filter[math.ceil(1+F):N*I-math.floor(F)] = 0
xx = np.array(xx)
xx = np.fft.fft(xx)
xx = xx * lp_filter
plt.plot(xx.real, 'o')
plt.plot(xx.imag, 'o')
plt.show()
xx = np.fft.ifft(xx) 
plt.plot(xx, 'o')
plt.show()
