import numpy as np
import matplotlib.pyplot as plt

x = [0,1,0,0,0,0,0,1]
x = np.fft.ifft(x)
plt.plot(x, 'o')
plt.show()

x = [0,1,0,0,0,0,0,1,0,1,0,0,0,0,0,1,0,1,0,0,0,0,0,1]
x = np.fft.ifft(x)
plt.plot(x, 'o')
plt.show()