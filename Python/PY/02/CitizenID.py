a = input()

c = 0
for i in range(12):
    c += int(a[i]) * (13-i)

n = (11 - c % 11) % 10

print(a[0], a[1:5], a[5:10], a[10:12], n)
