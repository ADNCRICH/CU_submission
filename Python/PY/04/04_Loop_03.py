a, b = input(), input()


if len(a) != len(b):
    print("Incomplete answer")
    exit(0)

#######

# c = 0
# for i in range(len(a)):
#     if a[i] == b[i]:
#         c += 1

# print(c)

#######

print(len([i for i in range(len(a)) if a[i] == b[i]]))
