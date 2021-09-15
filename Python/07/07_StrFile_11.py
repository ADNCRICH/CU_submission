ae = ['a', 'e', 'i', 'o', 'u']
s = ['s', 'x', 'ch']
a = input()
if a[-1] == 'y' and a[-2] not in ae:
    print(a[:-1]+"ies")
elif a[-1] in s or a[-2:] in s:
    print(a+"es")
else:
    print(a+"s")
