s = input()
k1 = input().split()
k2 = input().split()
mi, mj = len(s), 0
for i in range(len(k1)):
    for j in range(len(s)-len(k1[i])+1):
        if (s[j:j+len(k1[i])] == k1[i] and j < mi):
            mi, mj = j, i
print(s[:mi] + "<" + k2[mj]+">"+s[mi+len(k1[mj]):])
