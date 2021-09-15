import math

s = input()
s = s.split(',')
# print(s[0])
la = len(s[0])
lb = len(s[1])
lc = len(s[2])
#print(la, lb, lc)
a = sum(int(s[0][i])*10**(la-i-1) for i in range(0, la))
b = sum(int(s[1][i])*10**(lb-i-1) for i in range(0, lb))
c = sum(int(s[2][i])*10**(lc-i-1) for i in range(0, lc))
#print(a, b, c)

n = a*10**(lb+lc) + b*10**lc + c - (a*10**lb + b)
m = 10**lb * (10**lc-1)

d = math.gcd(int(n), int(m))

n //= d
m //= d

print(int(n), "/", int(m))
