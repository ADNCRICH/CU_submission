a = str(input())

s1 = (sum(int(a[3+7*i])*10**(4-i) for i in range(0, 5)))
s2 = (sum(int(a[7+5*i])*10**(4-i) for i in range(0, 5)))

s3 = str(s1+s2+10000)[-4:-1]

s4 = int(str(sum(int(s3[i]) for i in range(0, len(s3))))[-1])+1

print("%s%c" % (s3, chr(ord('A')+s4-1)))
