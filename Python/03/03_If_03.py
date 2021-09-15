a = list(input().split())
ma = mi = float(a[0])
s = sum(float(i) for i in a)
for i in range(1, len(a)):
    if float(a[i]) > ma:
        ma = float(a[i])
    if float(a[i]) < mi:
        mi = float(a[i])
print(round((s-ma-mi)/2, 2))
