class roman:
    def __init__(self, r):
        self.str = r

    def __lt__(self, rhs):
        return int(self) < int(rhs)

    def __str__(self):
        val = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1]
        syb = ["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"]
        roman_num = ''
        i = 0
        num = int(self)
        while num > 0:
            for _ in range(num // val[i]):
                roman_num += syb[i]
                num -= val[i]
            i += 1
        self.text = roman_num
        return roman_num

    def __int__(self):
        r = self.str
        r = r.replace('IV', 'IIII')
        r = r.replace('IX', 'VIIII')
        r = r.replace('XL', 'XXXX')
        r = r.replace('XC', 'LXXXX')
        r = r.replace('CD', 'CCCC')
        r = r.replace('CM', 'DCCCC')
        r = r.replace('I', '1 ')
        r = r.replace('V', '5 ')
        r = r.replace('X', '10 ')
        r = r.replace('L', '50 ')
        r = r.replace('C', '100 ')
        r = r.replace('D', '500 ')
        r = r.replace('M', '1000 ')
        return sum(map(int, r.split()))

    def __add__(self, rhs):
        return roman(str(int(self) + int(rhs)))


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
