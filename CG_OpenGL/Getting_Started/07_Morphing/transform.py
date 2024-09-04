# a = input().split('/')[0].strip()
# print(a)
a = []

for i in range(12):
    a.append(input().split('/')[0].strip())

o = []
for i in range(20):
    i1, i2, i3 = [int(x.strip()) for x in input().split(',')[:-1]]
    print(i1, i2, i3)
    o.extend((a[i1], a[i2], a[i3]))

for i in range(20):
    for j in range(3):
        print(o[i*3 + j])
    print()


'''
0, 1, gr,   // 0
0, 1, -gr,  // 1
0, -1, gr,  // 2
0, -1, -gr, // 3
1, gr, 0,   // 4
1, -gr, 0,  // 5
-1, gr, 0,  // 6
-1, -gr, 0, // 7
gr, 0, 1,   // 8
gr, 0, -1,  // 9
-gr, 0, 1,  // 10
-gr, 0, -1,  // 11

0, sq, 1,   // 0
0, sq, -1,  // 1
0, -sq, 1,  // 2
0, -sq, -1, // 3
sq, 0, 0,   // 4          // rotate cloclwise 45 degree and fit clostest
0, -sq, 0,  // 5
0, sq, 0,   // 6
-sq, 0, 0,  // 7
sq, 0, 1,   // 8
sq, 0, -1,  // 9
-sq, 0, 1,  // 10
-sq, 0, -1, // 11

0, 2, 8, 
0, 10, 2,
0, 8, 4,
0, 6, 10,
0, 4, 6,
2, 5, 8,
2, 10, 7,
5, 2, 7,
4, 1, 6,
8, 9, 4,
8, 5, 9,
10, 6, 11,
10, 11, 7,
4, 9, 1, 
5, 3, 9,
6, 1, 11,
7, 11, 3,
1, 9, 3,
1, 3, 11, 
5, 7, 3,
'''
