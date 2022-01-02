winner = set()
loser = set()

for i in range(int(input())):
    w, l = input().split()
    winner.add(w)
    loser.add(l)

print(sorted(winner-loser))
