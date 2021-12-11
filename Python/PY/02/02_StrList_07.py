# print(chr(ord('A')+1))
# ord('h') ใส่อักษร คืนเลข ascii
# chr(65)  ใส่เลข ascii คืนค่าตัวอักษร

a = input()

n = str(int(a[3::7]) + int(a[7::5]) + 10000)[-4:-1]
m = sum(int(i) for i in n) % 10 + 1

print(n + chr(ord('A')+m-1))
