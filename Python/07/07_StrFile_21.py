a = input()
while a != 'end':
    for i in a:
        if i.isalpha() == False:
            print(i, end="")
        elif i.islower():
            print(chr(ord(i) + (13 if ord(i) <= ord('m') else -13)), end="")
        else:
            print(chr(ord(i) + (13 if ord(i) <= ord('M') else -13)), end="")
    a = input()
    print('\n')
