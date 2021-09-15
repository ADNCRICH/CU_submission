a = {"(": "[", "[": "(", ")": "]", "]": ")"}
ch = 0
c = input()
ans = str()
for i in c:
    ans += (a[i] if i in a else i)
print(ans)
