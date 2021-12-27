a = input()
aa = ""

for i in a:
    if i.isalnum():
        aa += i
    else:
        aa += " "

aa = aa.split()

print(aa[0].lower(), end="")
for i in aa[1:]:
    print(i.capitalize(), end="")
