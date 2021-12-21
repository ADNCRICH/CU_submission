a = [int(i) for i in input().split()]

print(len([i for i in range(1, len(a)-1) if a[i] > a[i-1] and a[i] > a[i+1]]))

"""
c = 0
for i in range(1, len(a)-1):
    if a[i] > a[i-1] and a[i] > a[i+1]:
        c += 1
"""
