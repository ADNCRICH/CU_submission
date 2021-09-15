i, sum = 0, 0
a = input()

while a != "q":
    sum += float(a)
    i += 1
    a = input()

print("No Data" if i == 0 else round(sum/i, 2))
