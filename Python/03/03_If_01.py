n = input()

if len(n) != 2 or not n.isnumeric():
    print("Error")
    exit(0)

n = int(n)

if (n <= 2 or 20 <= n <= 40 or n == 51 or n == 53 or n == 55 or n == 58) and n != 0:
    print("OK")
    exit(0)

print("Error")
exit(0)
