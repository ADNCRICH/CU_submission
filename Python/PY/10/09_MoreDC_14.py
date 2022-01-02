x = input().strip()
course = {}
with open(x, 'r') as f:
    a = f.readlines()
    for i in a:
        idx, n = i.split(',')
        course[idx] = n.strip()

x = input().strip()
teacher = {}
with open(x, 'r') as f:
    a = f.readlines()
    for i in a:
        idx, n = i.split(',')
        teacher[idx] = n.strip()

x = input().strip()
with open(x, 'r') as f:
    a = f.readlines()
    for i in a:
        i1, i2 = i.strip().split(',')
        if i1 not in course or i2 not in teacher:
            print("record error")
            continue
        print(course[i1] + ',' + teacher[i2])
