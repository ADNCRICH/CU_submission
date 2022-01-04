class person:
    def __init__(self, s):
        self.name = s[0]
        self.sco = s[1]

    def __str__(self):
        return self.name + " " + str(self.sco)


a = person(["abc", 20])
print(a)
