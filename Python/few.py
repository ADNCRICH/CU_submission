import matplotlib.pyplot as plt

mT = 81
h = 12
L = 14
g = 9.8
d_values = [15, 17, 19]
k_list = []
f_list = []

for d in d_values:
    k = (mT * g + 2*mT*g*h/d) / (d - L)
    f = k * (d - L)
    f_list.append(f)
    equation = f"at d = {d} , k = {k} , f ={f}"
    print(equation)

plt.plot(d_values, f_list, 'ro-')
plt.xlabel('d')
plt.ylabel('f')
plt.title('Graph of d vs f')
plt.show()
