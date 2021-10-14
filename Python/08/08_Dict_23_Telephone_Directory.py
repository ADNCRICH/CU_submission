n = int(input())
dic = {}

for i in range(n):
    a, b, c = input().split()
    name = a+' '+b
    dic[name] = c
    dic[c] = name

n = int(input())
for i in range(n):
    x = input()
    print(x, end="")
    if x in dic:
        print(" --> ", dic[x])
    else:
        print(' --> ', 'Not found')
