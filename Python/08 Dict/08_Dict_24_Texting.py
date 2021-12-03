c1 = 0
c2 = 2
mp = {}
mp[' '] = '0'
mp['0'] = ' '
for i in range(0, 26):
    c1 += 1
    #print(chr(97+i), str(c2)*(c1))
    mp[chr(97+i)] = str(c2)*(c1)
    mp[str(c2)*(c1)] = chr(97+i)
    if c1 == (4 if c2 == 7 or c2 == 9 else 3):
        c1 = 0
        c2 += 1


def text2keys(a):
    return " ".join([mp[i.lower()] for i in a if i.isalpha() or i == " "])


def keys2text(a):
    return "".join([mp[i] for i in a.split()])


exec(input().strip())
