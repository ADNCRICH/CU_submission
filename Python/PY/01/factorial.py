import math
n = int(input())

a = (2*math.pi)**0.5 * n**(n+0.5) * math.e**(-n+1/(12*n+1))
b = (2*math.pi)**0.5 * n**(n+0.5) * math.e**(-n+1/(12*n))

print(a)
print(b)
