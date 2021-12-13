a = input()
b = ["", "K", "M", "B"]

# if (len(a)-1)//3 <= 3:
#     k = (len(a)-1)//3
# else:
#     k = 3

k = (len(a)-1)//3 if (len(a)-1)//3 <= 3 else 3

if len(a) % 3 == 1 and len(a) <= 10:
    print(round(int(a)/10**(3*k), 1), end="")
else:
    print(int(round(int(a)/10**(3*k), 0)), end="")

print(b[k])
