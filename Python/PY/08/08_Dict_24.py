d = {}
c1 = 2
c2 = 0
d[" "] = "0"
d["0"] = " "

for i in range(26):
    c2 += 1
    d[chr(ord('a')+i)] = str(c1) * c2
    d[str(c1) * c2] = chr(ord('a')+i)
    if c2 == (4 if c1 in [7, 9] else 3):
        c1 += 1
        c2 = 0


def text2keys(text):
    return " ".join([d[i] for i in text.lower() if i.isalpha() or i == " "])


def keys2text(keys):
    return "".join([d[i] for i in keys.split()])


exec(input().strip())
