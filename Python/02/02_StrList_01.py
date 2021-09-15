a = str(input())
c = int()
for i in range(0, 12):
    c += (13-i)*int(a[i])
print(a[0], a[1:5], a[5: 10], a[10: 12], (11-(c % 11)) % 10)
