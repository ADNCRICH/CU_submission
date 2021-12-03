class Card:
    def __init__(self, value, suit):
        self.v = value
        self.s = suit

    def __str__(self):
        return '(' + self.v + " " + self.s + ')'

    def next1(self):
        order = ['3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A', '2']
        suits = ['club', 'diamond', 'heart', 'spade']
        idx_order = order.index(self.v)
        idx_suit = suits.index(self.s) + 1
        if idx_suit > 3:
            idx_suit = 0
            idx_order = (idx_order + 1) % 13
        return Card(order[idx_order], suits[idx_suit])

    def next2(self):
        n = self.next1()
        self.v, self.s = n.v, n.s


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
