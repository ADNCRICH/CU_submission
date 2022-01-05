class roman:
    def __init__(self, r):
        self.str = r

    def __lt__(self, rhs):
        return int(self) < int(rhs)

    def __str__(self):
        if self.str.isalpha():
            return self.str
        v = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1]
        s = ["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"]
        a = ""

        n = int(self)
        i = 0
        while n > 0:
            a += s[i]*(n//v[i])
            n %= v[i]
            i += 1
        return a

    def __int__(self):
        a = self.str
        a = a.replace("IV", "IIII")
        a = a.replace("IX", "VIIII")
        a = a.replace("XL", "XXXX")
        a = a.replace("XC", "LXXXX")
        a = a.replace("CD", "CCCC")
        a = a.replace("CM", "DCCCC")

        a = a.replace("I", "1 ")
        a = a.replace("V", "5 ")
        a = a.replace("X", "10 ")
        a = a.replace("L", "50 ")
        a = a.replace("C", "100 ")
        a = a.replace("D", "500 ")
        a = a.replace("M", "1000 ")

        return sum(map(int, a.split()))

    def __add__(self, rhs):
        return roman(str(int(self)+int(rhs)))


t, r1, r2 = input().split()
a = roman(r1)
b = roman(r2)
if t == '1':
    print(a < b)
elif t == '2':
    print(int(a), int(b))
elif t == '3':
    print(str(a), str(b))
elif t == '4':
    print(int(a + b))
else:
    print(str(a + b))
