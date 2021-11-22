"""
a = int(3)
b = int(5)
print("%d%d" % (a, b))

for i in range(0, 10):
   print(i, end="")

a = 66565
c = 3
print("%.d" % a)

c = [5, 6, 7, 8]
a = sum(c[i] for i in range(0, 4))
print(a)


a = "abcddcab"
b = "abc"
print(a.strip(b))
print(a.split("ab"))




print("%d" % ord('a'))
print("%c" % chr(97))

print("%d" % (9 | 12))


a = "08326456"
print(a[0:2])


a = [3, 4, 5, [6, 7]]

print(a[1][0])


print("{:06.2f}".format(3.1561321654653123))

a = [str(i) for i in range(0, 5)]
print(",".join(a))

a = list()
b = list()
while True:
    c = input()
    if c == "-1":
        print(a, b)
        exit(0)
    aa, bb = (i for i in c.split())
    a.append(aa)
    b.append(bb)

a = [4, 9, 6, 7, 5]
a.sort()
print(a.index(5))

a = [[12, 18, 6, 3],
     [4,  3, 1, 2],
     [15,  8, 9, 6]]
print(*zip(*a))

a = (15, 6)
print(a[0])

a = [i for i in range(0, 20)]
print(a[0:3]+a[4:])

PC Files: virus.exe antivirus.exe dog.exe spotify.virus


a = input()
a = a[10:].split()
ans = []
for i in a:
    name = i.split('.')[0]
    if "antivirus" in name or "notvirus" in name:
        pass
    elif "virus" in name:
        continue
    ans.append(i)

print("PC Files: "+", ".join(ans))

a = "asGG.gjenLJHljLJH"
print(a.upper())

a = "abcde"
print(a[-2:])

a = [3, 5, 6]
a += [8, 6, 9]
print(a+b)

la = lb = 0
lb += 3
print(la)

if 'j'.isupper():
    print("Yeahhhh yeehaaa")
else:
    print("nooooooo:")

key = "0123456789012"
for i in range(0, len(key)-3):
    print(key[i:i+4], key[i:i+4][::-1])

a = "e r"
aa = a.strip().split()
print('0') if len(aa) == 0 else print(" ".join(aa))



def p(a, b):
    return a+b, a < b, [a, b]


a, b, c = p(2, 3)
print(a, b, c)

a = [i.strip() for i in input().split(',')]
print('\n'.join(a))

a = [5, 6, 5, 462, 3321, 5, 6523, 32321, 3542, 13, 32132, 3]
aa = [[i, j] for i, j in enumerate(a)]
aa = sorted(aa, key=lambda x: x[1])
for i in aa:
    print(i[0], i[1])

a = input()
n = int(input())
print(a[(n-1)*5:(n*5)])
print(a[0:(n-1)*5]+a[(n*5):])

a = input().split()
s = b = p = 0
for i in a:
    if i == 'shirt':
        s += 1
    elif i == 'pants':
        p += 1
    elif i == 'bag':
        b += 1
if s >= 2:
    p = max(0, p-1)
if s >= 3:
    b = max(0, b-1)
print(200*(s+b+p))

a = [float(i) for i in input().split()]
n = min(int(a[0]), len(a)-1)
a = a[1:]
for i in range(len(a)):
    print(max(a[i:min(i+n, len(a))]), end=" ")

a = [['A102', 30], ['A103', 40], ['B014', 50], ['B109', 50]]
x, y = [int(i) for i in input().split(',')]
ans = []
for i in a:
    if i[1] < x or i[1] > y:
        ans.append(i)
print(ans)

a = [85, 80, 75, 70, 65, 60, 55, 50, 45, 40]


import pandas as pd
import matplotlib.pyplot as plt
df = pd.DataFrame({"A": ["foo", "foo", "foo", "foo", "foo",
                         "bar", "bar", "bar", "bar"],
                   "B": ["one", "one", "one", "two", "two",
                         "one", "one", "two", "two"],
                   "C": ["small", "large", "large", "small",
                         "small", "large", "small", "small",
                         "large"],
                   "D": [1, 2, 2, 3, 3, 4, 5, 6, 7],
                   "E": [2, 4, 5, 5, 6, 6, 8, 9, 9]})
df

real = "efFF"
fake = "zsrgzsrg"
a = [[0 for i in range(len(real)+1)] for i in range(len(fake)+1)]
for i in range(len(fake)+1):
    a[i][0] = i
for j in range(len(real)+1):
    a[0][j] = j
for i in a:
    print(i, end="\n")

a = [2, 3, 5]
b = ['a=', 'b=', 'c=']
print(b.join(a))

mp = {'A': 'T', 'T': 'A', 'G': 'C', 'C': 'G'}
for i in mp.items():
    print(i)

pre = input()
cnt = 0
mode = 1
if pre == 'stop':
    print(0)
else:
    while True:
        i = input()
#        print('m ' + str(mode) + ' p ' + str(pre) + ' ch ' + str(float(i) - float(pre) <= 3 and mode != 2))
        if i == 'stop':
            break
        if float(i) - float(pre) <= 3 and mode != 2:
            if mode == 0:
                mode = 1
            elif mode == 1:
                cnt += 1
                mode = 0
        elif float(i) - float(pre) > 3 and mode != 2:
            mode = 2
        else:
            mode = 1
        pre = float(i)
#        print('m '+str(mode)+'\n')
    print(cnt)

a = {1: 100, 2: 90, 3: 70, 4: 60}
print(sorted(a, key=lambda x: -x))



def uppercase_decorator(function, function2):
    def wrapper():
        func = function()
        func2 = function2()
        make_uppercase = func.upper()
        make_uppercase2 = func2.upper()
        return make_uppercase + make_uppercase2

    return wrapper


@uppercase_decorator
def say_hi():
    return 'hello there'


@uppercase_decorator
def say_hi2():
    return 'kkk'


print(say_hi())


"""


# def decorator_maker_with_arguments(decorator_arg1, decorator_arg2, decorator_arg3):
#     def decorator(func):
#         def wrapper(function_arg1, function_arg2, function_arg3):
#             "This is the wrapper function"
#             print("The wrapper can access all the variables\n"
#                   "\t- from the decorator maker: {0} {1} {2}\n"
#                   "\t- from the function call: {3} {4} {5}\n"
#                   "and pass them to the decorated function"
#                   .format(decorator_arg1, decorator_arg2, decorator_arg3,
#                           function_arg1, function_arg2, function_arg3))
#             return func(function_arg1, function_arg2, function_arg3)

#         return wrapper

#     return decorator


# pandas = "Pandas"


# @decorator_maker_with_arguments(pandas, "Numpy", "Scikit-learn")
# def decorated_function_with_arguments(function_arg1, function_arg2, function_arg3):
#     print("This is the decorated function and it only knows about its arguments: {0}"
#           " {1}" " {2}".format(function_arg1, function_arg2, function_arg3))


# decorated_function_with_arguments(pandas, "Science", "Tools")

#################


# def decorator_with_arguments(a1, a2):
#     def hh(func):
#         def wrapper_accepting_arguments(arg1, arg2):
#             print("My arguments are: {0}, {1}".format(arg1, a2))
#             return func(a1, arg2)
#         return wrapper_accepting_arguments

#     def gg(fffff):
#         def wrapp(aa1, aa2):
#             print(a1, a2, aa1, aa2)
#         return wrapp

#     return gg


# @decorator_with_arguments("aa", "bb")
# def cities(city_one, city_two):
#     print("Cities I love are {0} anddddddd {1}".format(city_one, city_two))


# cities("Nairobi", "Accra")

###########


# def decorator_with_arguments(function):
#     def wrapper_accepting_arguments(arg1, arg2):
#         print("My arguments are: {0}, {1}".format(arg1, arg2))
#         function(arg1, arg2)
#     return wrapper_accepting_arguments


# @decorator_with_arguments
# def cities(city_one, city_two):
#     print("Cities I love are {0} and {1}".format(city_one, city_two))


# cities("Nairobi", "Accra")

# mp = {}
# mp["aa"] = (1, 1)
# mp["zz"] = (0, 20)
# mp["aa"] = (mp['aa'][0], mp['aa'][1]+3)
# mp = sorted(mp.items(), key=lambda x: x[1][0])
# print(mp)

mp = {}
mp[3] = {}
mp[3]["ll"] = 9
print(mp)
