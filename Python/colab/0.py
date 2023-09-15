import numpy as np

# Number of data points (times) in your dataset (you have 243 data points)
n = 245

# Sampling frequency (number of data points per year, which is 365 for daily data)
sampling_frequency = 365

# Calculate the frequencies corresponding to the FFT result
frequencies = np.fft.fftfreq(n, d=1/sampling_frequency)

# Now 'frequencies' contains the frequencies corresponding to the FFT result
print(frequencies)