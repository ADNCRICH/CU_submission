a, b = input().replace(" ", "").lower(), input().replace(" ", "").lower()

aa = [0 for i in range(30)]
bb = [0 for i in range(30)]

for i in a:
    aa[ord(i)-ord('a')] += 1
for i in b:
    bb[ord(i)-ord('a')] += 1

print("YES" if aa == bb else "NO")
