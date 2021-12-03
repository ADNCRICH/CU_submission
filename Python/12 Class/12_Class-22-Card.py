class Card:
    def __init__(self, value, suit):
        self.v = value
        self.s = suit

    def __str__(self):
        return "(" + self.v + " " + self.s + ")"

    def getScore(self):
        if self.v == 'A':
            return 1
        elif self.v in ['J', 'Q', 'K']:
            return 10
        else:
            return int(self.v)

    def sum(self, other):
        return (self.getScore() + other.getScore()) % 10

    def __lt__(self, rhs):
        if self.v == rhs.v:
            return self.s < rhs.s
        else:
            idx = ['3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A', '2']
            return idx.index(self.v) < idx.index(rhs.v)


n = int(input())
c = []
for i in range(n):
    v, s = input().split()
    c.append(Card(v, s))
for i in range(n):
    print(c[i].getScore())
print("----------")
for i in range(n-1):
    print(Card.sum(c[i], c[i+1]))
print("----------")
c.sort()
for i in range(n):
    print(c[i])
