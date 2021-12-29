for i in range(int(input())):
    a = input().strip()
    c = 0
    for j in a:
        if j == '.' and c != -1:
            c += 1
        elif c != -1:
            print("."*(c//2)+j, end="")
            c = -1
        else:
            print(j, end="")
    print()
