a = input()
for i in a:
    if i != ' ' and i.isalnum() == False:
        a = a.replace(i, " ")
s = a.lower().split()
print(s[0], end="")
for i in s[1:]:
    print(i.capitalize(), end="")
