idd = {}
all = {}
n = int(input())


def pri(m):
    if(m == int(m)):
        return str(int(m))
    return str(m)


for i in range(n):
    name, id, money = input().split()
    money = float(money)
    idd[id] = name
    if name not in all:
        all[name] = {}
    if id not in all[name]:
        all[name][id] = 0
    all[name][id] += money
n = input().split()
while(n[0] != "exit"):
    name, id, mode, data = n[0], n[1], n[2], n[3:]
    if(mode == "deposit"):
        money = float(data[0])
        if(id in idd and name != idd[id]):
            print("Transaction Failed")
            n = input().split()
            continue
        if name not in all:
            all[name] = {}
        if id not in all[name]:
            all[name][id] = 0
        all[name][id] += money
        print(name + " (" + id + ") " + pri(all[name][id]))

    if(mode == "withdraw"):
        money = float(data[0])
        if (id not in idd) or (id in idd and name != idd[id]) or all[name][id] < money:
            print("Transaction Failed")
            n = input().split()
            continue
        all[name][id] -= money
        print(name + " (" + id + ") " + pri(all[name][id]))

    if(mode == "transfer"):
        to, money = data[0], float(data[1])
        if (id not in idd) or (to not in idd) or (id in idd and name != idd[id]) or all[name][id] < money:
            print("Transaction Failed")
            n = input().split()
            continue
        all[name][id] -= money
        print(name + " (" + id + ") " + pri(all[name][id]))
        all[idd[to]][to] += money
        print(idd[to] + " (" + to + ") " + pri(all[idd[to]][to]))
    n = input().split()


"""

4
computer.pro 0123456789 40000.3200
computer.pro 0123456789 40000.3200
creamy.ice 8875321960 46670.000
nonono.ipe 8987738010 4670

2
computer.pro 0123456789 40000.32
apple.str 0089553714 0
computer.pro 0123456789 transfer 0089553714 40
computer.rop 0123456789 deposit 10
computer.pro 5555555555 deposit 10
exit


"""
