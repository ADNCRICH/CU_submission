d = {'Robert': 'Dick', 'Dick': 'Robert', 'William': 'Bill', 'Bill': 'William', 'James': 'Jim', 'Jim': 'James', 'John': 'Jack', 'Jack': 'John', 'Margaret': 'Peggy',
     'Peggy': 'Margaret', 'Edward': 'Ed', 'Ed': 'Edward', 'Sarah': 'Sally', 'Sally': 'Sarah', 'Andrew': 'Andy', 'Andy': 'Andrew', 'Anthony': 'Tony', 'Tony': 'Anthony', 'Deborah': 'Debbie', 'Debbie': 'Deborah'}

# for i in range(10):
#     a, b = [i.strip() for i in input().split()]
#     d[a] = b
#     d[b] = a
# rint(d)p

n = int(input())
for i in range(n):
    key = input()
    if key in d:
        print(d[key])
    else:
        print("Not found")
