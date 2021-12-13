n = int(input())
mid = n-1

for i in range(n-1):
    for j in range(2*n-1):
        if(i == abs(mid-j)):
            print("*", end="")
        else:
            print(" ", end="")
    print()

for i in range(2*n-1):
    print("*", end="")
