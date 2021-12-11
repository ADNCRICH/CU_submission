a = float(input())
b = float(input())
c = float(input())

x1 = (-b - (b*b - 4*a*c)**0.5)/(2*a)
x2 = (-b + (b*b - 4*a*c)**0.5)/(2*a)

print(round(x1, 3), round(x2, 3))
