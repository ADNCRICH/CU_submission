a = input()
b = [1, 2, 51, 53, 55, 58]

if not a.isnumeric() or len(a) != 2:
    print("Error")
    exit(0)
a = int(a)
if 20 <= a <= 40 or a in b:
    print("OK")
else:
    print("Error")
