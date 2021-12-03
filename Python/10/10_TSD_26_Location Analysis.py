n = int(input())
mp = {}

for i in range(n):
    a = input()
    key, val = a.split(':')
    val = [i.strip() for i in val.split(',')]
    mp[key] = val

k = input()
ch = 0
for i in mp:
    if not set(mp[k]).isdisjoint(mp[i]) and i != k and len(mp[k]) > 0:
        print(i)
        ch = 1

if ch == 0:
    print("Not Found")

"""

6
51234621: A, B, D, E, F
427613829: B, D, G, H, I
38216542: Z, B, D, J
423212822: AA, B1, C3, D
4126548: J, Z3
98871973331:
98871973331


"""
