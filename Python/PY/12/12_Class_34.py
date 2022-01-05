class piggybank:
    def __init__(self):
        self.coins = {}
        self.n = 0
        self.total = 0.0

    def add(self, v, n):
        v = float(v)
        if n + self.n > 100:
            return False
        if v not in self.coins:
            self.coins[v] = 0
        self.coins[v] += n
        self.n += n
        self.total += v*n
        return True

    def __float__(self):
        return self.total

    def __str__(self):
        return '{' + ', '.join(str(k)+':'+str(v) for k, v in sorted(self.coins.items())) + '}'


cmd1 = input().split(';')
cmd2 = input().split(';')
p1 = piggybank()
p2 = piggybank()
for c in cmd1:
    eval(c)
for c in cmd2:
    eval(c)
