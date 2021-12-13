a = input()
b = []

if a == 'q':
    print("No Data")
    exit(0)

while(a != 'q'):
    b.append(float(a))
    a = input()

print(round(sum(b)/len(b), 2))
