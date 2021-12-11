a = input()
b = [6, 8, 9]

if len(a) == 10 and int(a[0:2]) in b:
    print("Mobile number")
else:
    print("Not a mobile number")
