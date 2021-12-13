key = input()
a = input()

a = "".join([i if i.isalpha() else " " for i in a])

# aa = ""
# for i in a:
#     if i.isalpha():
#         aa += i
#     else:
#         aa += " "
# print(aa)

c = 0
for i in a.split():
    if i == key:
        c += 1

print(c)
