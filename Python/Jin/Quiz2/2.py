a = input()
b = input()
i, j = 0, 0
ch = True
while (i < len(a) and j < len(b)):
    if (b[j] == "["):
        ii = b.find("]", j+1)
        key = b[j+1: ii]
        if (a[i] not in key):
            ch = False
        i += 1
        j = ii+1
    elif (b[j] == "("):
        ii = b.find(")", j+1)
        key = b[j+1: ii]
        if (a[i] in key):
            ch = False
        i += 1
        j = ii+1
    else:
        if (a[i] != b[j] and b[j] != '?'):
            ch = False
        i += 1
        j += 1
print(ch)
