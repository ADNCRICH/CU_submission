import matplotlib.pyplot as plt
a = [1, 2, 3]
k = [i*i for i in a]
print("\n".join([f"a: {a[i]}, k: {k[i]}" for i in range(3)]))

plt.plot(a, k)
plt.show()
