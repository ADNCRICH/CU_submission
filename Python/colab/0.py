import numpy as np

x = [5,6,1,8,2]
h = [4,5,6,8]

# linear convolution in time
y = np.convolve(x, h)
print(y)

# linear convolution usind dft
xx = np.pad(x, (0, len(h)), 'constant')
X = np.fft.fft(xx)
hh = np.pad(h, (0, len(x)), 'constant')
H = np.fft.fft(hh)
Y = X * H
y = np.real(np.fft.ifft(Y)).astype(int)
y = y[:len(x)+len(h)-1]
print(y)

# circular convolution in time 1
h_c = []
for i in range(len(x)):
    sum = 0
    for j in range(len(h)):
        sum += h[j] * x[(i-j+len(x))%len(x)]
    h_c.append(sum)
print(h_c)

# circular convolution in time 2
y = np.convolve(x, h)
y_h = y[:len(x)]
y_t = np.pad(y[len(x):], (0, len(x)-len(h)+1), 'constant')
print(y_t + y_h)

# circular convolution using dft
X = np.fft.fft(x)
hh = np.pad(h, (0, 1), 'constant')
H = np.fft.fft(hh)
Y = X * H
y = np.real(np.fft.ifft(Y)).astype(int)
print(y)

