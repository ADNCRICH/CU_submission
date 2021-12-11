row, col = [int(x) for x in input().split()]

table = []
for n in range(row):
    text = input().strip().upper()
    temp = []
    for letter in text:
        temp.append(letter)
    table.append(temp)
    temp = []

word = input().strip().upper()
m = 0
p = []


def check_neighbours(rows, cols, m):
    if len(word) == m:
        print(p)
        exit(0)
    try:
        if rows > 0:  # upper
            if table[rows-1][cols] == word[m] and (rows-1, cols) not in p:
                p.append((rows-1, cols))
                check_neighbours(rows-1, cols, m+1)
                p.pop()
    except:
        pass

    try:
        if rows != len(table)-1:  # lover
            if table[rows+1][cols] == word[m] and (rows+1, cols) not in p:
                p.append((rows+1, cols))
                check_neighbours(rows+1, cols, m+1)
                p.pop()
    except:
        pass

    try:
        if cols > 0:  # left
            if table[rows][cols-1] == word[m] and (rows, cols-1) not in p:
                p.append((rows, cols-1))
                check_neighbours(rows, cols-1, m+1)
                p.pop()
    except:
        pass

    try:
        if cols != len(table[0])-1:  # right
            if table[rows][cols+1] == word[m] and (rows, cols+1) not in p:
                p.append((rows, cols+1))
                check_neighbours(rows, cols+1, m+1)
                p.pop()
    except:
        pass


def neighbours(table):
    for r in range(0, len(table)):
        for c in range(0, len(table[r])):
            if table[r][c] == word[0]:
                try:
                    p.append((r, c))
                    check_neighbours(r, c, 1)
                    p.pop()
                except IndexError:
                    pass
            else:
                pass


neighbours(table)

