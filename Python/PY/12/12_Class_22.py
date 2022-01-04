class Card:
    def __init__(self, value, suit):
        self.v = value
        self.s = suit

    def __str__(self):
        return "(" + self.v + " " + self.s + ")"

    def getScore(self):
        if self.v == "A":
            return 1
        if self.v.isnumeric():
            return int(self.v)
        else:
            return 10

    def sum(self, other):
        return (self.getScore() + other.getScore()) % 10

    def __lt__(self, rhs):
        if self.v == rhs.v:
            # idx = ["club", "diamond", "heart", "spade"]
            # return idx.index(self.s) < idx.index(rhs.s)
            return self.s < rhs.s
        else:
            idx = ['3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A', '2']
            return idx.index(self.v) < idx.index(rhs.v)


n = int(input())
cards = []
for i in range(n):
    value, suit = input().split()
    cards.append(Card(value, suit))
for i in range(n):
    print(cards[i].getScore())
print("----------")
for i in range(n-1):
    print(Card.sum(cards[i], cards[i+1]))
print("----------")
cards.sort()
for i in range(n):
    print(cards[i])
