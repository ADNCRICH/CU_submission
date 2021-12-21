n = int(input())
a = [n]

while n != 1:
    if n % 2 == 0:
        n //= 2
    else:
        n = n*3+1
    a.append(n)


print("->".join([str(i) for i in a[-min(15, len(a)):]]))
