n = int(input())
now = 0
a = []
cou = 0
idx = -1
t = 0

for i in range(n):
    x = input().split()
    if x[0] == "reset":
        now = int(x[1])

    if x[0] == "new":
        a.append((now, int(x[1])))
        print("ticket", now)
        now += 1

    if x[0] == "next":
        idx += 1
        print("call", a[idx][0])

    if x[0] == "order":
        t += int(x[1]) - a[idx][1]
        cou += 1
        print("qtime", a[idx][0], int(x[1]) - a[idx][1])

    if x[0] == "avg_qtime":
        print("avg_qtime", round(t/cou, 4))
