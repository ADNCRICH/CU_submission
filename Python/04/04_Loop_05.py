key = input()
k = ['"', "'", '(', ')', ',', '.']
a = input()
for i in k:
    a = a.replace(i, ' ')
cou = 0
for i in a.split():
    if i == key:
        cou += 1
print(cou)
