n, m = [int(i) for i in input().split()]
a = [input() for i in range(n)]
ans = []
key = input()
mk = [[0 for i in range(m)] for j in range(n)]


def play(i, j, st):
    if(st == len(key)):
        print(ans)
        exit(0)
    if(i < 0 or j < 0 or i >= n or j >= m):
        return
    elif(a[i][j] == key[st]):
        #print("do1", i, j, st)
        ans.append((i, j))
        play(i+1, j, st+1)
        play(i, j+1, st+1)
        play(i-1, j, st+1)
        play(i, j-1, st+1)
        ans.pop()
    return


for i in range(n):
    for j in range(m):
        if key[0] == a[i][j]:
            ans = []
            #print("do", i, j)
            play(i, j, 0)

"""

5 7
ENVXYYL
NWOXYEC
OPROANG
SXREIGC
JYJENDD
ENGINEER


"""
