class Card:
    def __init__(self, value, suit):
        self.v = value
        self.s = suit

    def __str__(self):
        return "(" + self.v + " " + self.s + ")"

    def next1(self):
        ord = ['3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A', '2']
        suit = ["club", "diamond", "heart", "spade"]
        i_ord = ord.index(self.v)
        i_suit = suit.index(self.s)+1

        if i_suit > 3:
            i_suit = 0
            i_ord = (i_ord+1) % 13

        return Card(ord[i_ord], suit[i_suit])

    def next2(self):
        nx = self.next1()
        self.v = nx.v
        self.s = nx.s


n = int(input())
cards = []
for i in range(n):
    value, suit = input().split()
    cards.append(Card(value, suit))
for i in range(n):
    print(cards[i].next1())
print("----------")
for i in range(n):
    print(cards[i])
print("----------")
for i in range(n):
    cards[i].next2()
    cards[i].next2()
    print(cards[i])
