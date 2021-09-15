i = input()
i = int(float(i))
if i >= 90:
    i = 80
if i < 50:
    i = 30
print(chr(ord('F')-(i-30)//10))
