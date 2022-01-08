all = {}
idd = {}
n = int(input())


def pri(s):
    if s == int(s):
        return str(int((s)))
    else:
        return str(s)


for i in range(n):
    name, id, mon = input().split()
    mon = float(mon)
    idd[id] = name
    if name not in all:
        all[name] = {}
    if id not in all[name]:
        all[name][id] = 0
    all[name][id] += mon

x = input().split()
while x[0] != "exit":
    name, id, o, data = x[0], x[1], x[2], x[3:]

    if o == "deposit":
        mon = float(data[0])
        if id in idd and name != idd[id]:
            print("Transaction Failed")
            x = input().split()
            continue
        if name not in all:
            all[name] = {}
        if id not in all[name]:
            all[name][id] = 0
        all[name][id] += mon
        print(name + " (" + id + ") " + pri(all[name][id]))

    if o == "withdraw":
        mon = float(mon)
        if id not in idd or (id in idd and name != idd[id]) or all[name][id] < mon:
            print("Transaction Failed")
            x = input().split()
            continue
        all[name][id] -= mon
        print(name + " (" + id + ") " + pri(all[name][id]))

    if o == "transfer":
        to, mon = data[0], float(data[1])
        if id not in idd or (id in idd and name != idd[id]) or all[name][id] < mon or to not in idd:
            print("Transaction Failed")
            x = input().split()
            continue
        all[name][id] -= mon
        print(name + " (" + id + ") " + pri(all[name][id]))
        all[idd[to]][to] += mon
        print(idd[to] + " (" + to + ") " + pri(all[idd[to]][to]))

    x = input().split()
