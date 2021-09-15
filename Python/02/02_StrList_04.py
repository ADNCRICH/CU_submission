a = str(input())
b = int(input())
for i in range(0, b-len(a)):
    print("0", end="")
print(a)
