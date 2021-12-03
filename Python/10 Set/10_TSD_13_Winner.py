winner = set()
loser = set()
n = int(input())

for i in range(n):
    a, b = input().strip().split()
    winner.add(a)
    loser.add(b)

print(sorted(winner-loser))
