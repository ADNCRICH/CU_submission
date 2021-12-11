n = input()
a = int(n[3::7]) + int(n[7::5]) + 10000
b = str(a)[-4:-1]

c = sum(int(i) for i in b) % 10 + 1

print(b + chr(ord('A')+c-1))
