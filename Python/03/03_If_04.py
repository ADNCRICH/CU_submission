a = str(input())
if len(a) != 10:
    print("Not a mobile number")
    exit(0)
if int(a[0:2]) == 6 or int(a[0:2]) == 8 or int(a[0:2]) == 9:
    print("Mobile number")
    exit(0)
print("Not a mobile number")
exit(0)
