name = ['Robert', 'William', 'James', 'John', 'Margaret', 'Edward', 'Sarah', 'Andrew', 'Anthony', 'Deborah']
nick = ['Dick', 'Bill', 'Jim', 'Jack', 'Peggy', 'Ed', 'Sally', 'Andy', 'Tony', 'Debbie']
n = int(input())
for i in range(0, n):
    c = input()
    if c in name:
        print(nick[name.index(c)])
    elif c in nick:
        print(name[nick.index(c)])
    else:
        print("Not found")
