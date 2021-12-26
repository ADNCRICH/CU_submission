# a, b = input().split()

# a = int(a, 2)
# b = int(b, 2)

# print(bin(a+b)[2:])

################################

print(bin(sum(int(i, 2) for i in input().split()))[2:])
