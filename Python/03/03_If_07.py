s = ["", "K", "M", "B"]
a = input()

r = (len(a)-1) % 3+1
k = 3 if (len(a)-1)//3 > 3 else (len(a)-1)//3

if r == 1 and 1 < len(a) <= 10:
    print(round((int(a)/10**(3*k)), 1), end="")
else:
    print(int(round((int(a)/10**(3*k)), 0)), end="")

print(s[k])
