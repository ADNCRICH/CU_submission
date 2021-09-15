q = list()
n = int(input())
now = 0
t = 0
idx = -1
do = 0
for k in range(n):
    c = input().split()
    if c[0] == 'reset':
        now = int(c[1])
    elif c[0] == 'new':
        q.append([now, int(c[1])])
        print("ticket {}".format(now))
        now += 1
    elif c[0] == 'next':
        idx += 1
        print("call {}".format(q[idx][0]))
    elif c[0] == 'order':
        print("qtime {} {}".format(q[idx][0], int(c[1])-q[idx][1]))
        do += 1
        t += int(c[1])-q[idx][1]
    elif c[0] == 'avg_qtime':
        print("avg_qtime", round(t/do, 4))
