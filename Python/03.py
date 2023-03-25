''' "a, b, c"  '''
# s = [i.strip() for i in input().split(',')]
# print(s)

# str = "   .g..hgjk....p    "
# print(str.strip("gp. "))

# print([i for i in range(1, 31)][20:10:-1])

# s = '000090009900099'
# n = s.count('00')
# print(n)

# str = "a,b,c,d"  # -> "a, b, c, d"
# # print(str.replace(",", ", "))
# print(", ".join(str.split(',')))

# a = '.\"\"\%\"\..'
# b = "\\\\"
# print(b)

# import math
# a = 90
# r = math.radians(a)
# print(r)

# print("ahhhh"*5)

s = 'ABCb'
# print([i for i in s if i not in 'bB'])

idx = 0
# for i in s:
#     print(idx, i)
#     idx = idx+1

# for i, j in enumerate(s):
#     print(i+1, j)

# a = [1, 3, 5, 10, 262, -525]
# st = 2
# n = 3
# print(a[st:st+n])

# print(((-8 % 3)+3) % 3)

# x = [1, 4, 5, 763, 25, 6, 4, 22]
# print(sum([i for i in x if i >= 20]))

# x = 'ABCDEFGHIJK'
# for i, j in enumerate(x):
#     if i != 3:
#         print(j, end="")
#     else:
#         print("8", end="")

# print()
# print(x[0:3]+"8"+x[4:])

# str = "abc$%dawfdwf%srg$srgsr"  # split $ , % -> abc, dawfdwd, srg, srgsr
# str = " ".join(str.split("$"))
# str = " ".join(str.split("%"))
# print(str.split())

# str = "abc$%dawfdwf%srg$srgsr"  # s $ %
# key = "s$%"
# for i in key:
#     str = str.replace(i, " ")

# print(str.split())

# a, b = [int(i) for i in input().split()]
# print(a*b)

# x = 41
# print(0 <= x <= 10)

# x = [1, 2, 3]
# s = []
# for e in x+x:
#     s.append(e)
# print(s)

# idx = 0
# while idx <= 10:
#     print(idx, end=" ")
#     idx += 1

# print()

# idx = 0
# while idx <= 10:
#     idx += 1
#     print(idx, end=" ")

# x = []
# s = input()
# while s != 'q':
#     if s.isdecimal():
#         x += [float(s)]  # x.append(int(s))
#     s = input()
# print(x)


# def log2_int(x):
#     c = 0
#     while x > 0:
#         x //= 2
#         c += 1
#     return c


# print(log2_int(16))


# for i in range(1, 11):
#     if i % 3 == 0:
#         continue
#     print(i)

# idx = 1
# while True:
#     print(idx)
#     idx += 1
#     if (idx > 10):
#         break


# a = [33, 4, 4, 4, 3, 5, 6, 4]
# e = 4
# n = a.count(e)
# # while e in a:
# #     a.remove(e)
# for i in range(n):
#     a.remove(e)
# print(a)
# a.pop(50)

# a = [2, 5, 6, 78, 5, 65, -85, 5]
# e = 5


# def print_all_indices(a, e):
#     # for i in range(len(a)):
#     #     if a[i] == e:
#     #         print(i)
#     print("\n".join([str(i) for i in range(len(a)) if a[i] == e]))  # [1, 4, 7]


# print_all_indices(a, e)

# def tab(n, m):
#     # n,m = 2, 3
#     # 1 2 3
#     # 4 5 6
#     # [[1,2,3],[4,5,6]]
#     re = []
#     for i in range(n):
#         l = []
#         for j in range(1, m+1):
#             l.append(m*i + j)
#         re.append(l)
#     return re


# print(tab(2, 3))

a = []
with open("text.txt", "r") as file:
    for i in file.readlines():
        a.append(i.rstrip("\n"))

with open("text.txt", "w") as file:
    for i, j in enumerate(a):
        if i == 1:
            file.write("642085221")
        else:
            file.write(j)
        file.write("\n")
    file.write("Bye\n")

'''
efw wef 
srthj6666 55
wfsefse  esf
'''
