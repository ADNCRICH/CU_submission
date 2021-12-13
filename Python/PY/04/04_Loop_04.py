b = {'(': '[', ')': ']', '[': '(', ']': ')'}
a = input()
ans = ""

#######
for i in a:
    if i in b:
        ans += b[i]
    else:
        ans += i
#######
for i in a:
    if i == '[':
        ans += '('
    elif i == ']':
        ans += ')'
    elif i == '(':
        ans += '['
    elif i == ')':
        ans += ']'
    else:
        ans += i
#######
print(ans)
