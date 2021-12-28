d = {}

for i in range(int(input())):
    a, b, c = input().split()
    n = a+" "+b
    d[n] = c
    d[c] = n

for i in range(int(input())):
    key = input()
    if key not in d:
        print(key, "--> Not found")
    else:
        print(key, "-->", d[key])

"""

5
Anthony Stark 086-111-1111
Henry Pym 087-222-2222
Robert Banner 088-333-3333
Steven Rogers 089-444-4444
Natasha Romanoff 091-555-5555
4
087-222-2222
Steven Rogers
Monica Rambeau
911


"""
