mp = {'A': 'T', 'T': 'A', 'G': 'C', 'C': 'G'}
a = input().strip().upper()
o = input().strip()

for i in a:
    if i not in mp:
        print('Invalid DNA')
        exit(0)

b = []
if o == 'R':
    a = a[::-1]
    for i in range(len(a)):
        b.append(mp[a[i]])
    print(''.join(b))

if o == 'F':
    print('A={}, T={}, G={}, C={}'.format(a.count('A'), a.count('T'), a.count('G'), a.count('C')))

cou = 0
if o == 'D':
    key = input().strip()
    for i in range(0, len(a)-len(key)+1):
        if a[i:i+len(key)] == key:
            cou += 1
    print(cou)
