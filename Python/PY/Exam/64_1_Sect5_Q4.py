n, m = [int(i) for i in input().split()]
a = [input() for i in range(n)]
ans = []
key = input()
mk = [[0 for j in range(m)] for i in range(n)]


def play(i, j, st):
    if st == len(key):
        print(ans)
        exit(0)
    if i < 0 or j < 0 or i >= n or j >= m or mk[i][j] == 1:
        return
    if a[i][j] == key[st]:
        ans.append((i, j))
        mk[i][j] = 1
        play(i-1, j, st+1)
        play(i, j-1, st+1)
        play(i+1, j, st+1)
        play(i, j+1, st+1)
        ans.pop()
        mk[i][j] = 0
    return


for i in range(n):
    for j in range(m):
        if key[0] == a[i][j]:
            ans = []
            play(i, j, 0)
