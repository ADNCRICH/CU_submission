class Point:
    def __init__(self, x, y):
        self.x = x
        self.y = y

    def __str__(self):
        return "("+str(self.x)+","+str(self.y)+")"


class Rect:
    def __init__(self, p1, p2):
        self.lowerleft = p1
        self.upperright = p2

    def __lt__(self, rhs):
        if self.area() != rhs.area():
            return self.area() < rhs.area()

    def area(self):
        return (self.upperright.x - self.lowerleft.x) * (self.upperright.y - self.lowerleft.y)

    def contains(self, p):
        if self.lowerleft.x <= p.x <= self.upperright.x and self.lowerleft.y <= p.y <= self.upperright.y:
            return True
        return False


a = []
a.append(Rect(Point(1, 5), Point(3, 17)))
a.append(Rect(Point(5, 10), Point(7, 15)))
a.append(Rect(Point(1, 3), Point(3, 4)))
a.append(Rect(Point(6, -4), Point(11, 10)))
a.sort()
for i in a:
    print(i.lowerleft, i.upperright, i.area())
x1, y1, x2, y2 = [int(e) for e in input().split()]
lowerleft = Point(x1, y1)
upperright = Point(x2, y2)
rect = Rect(lowerleft, upperright)
print(rect.area())
m = int(input())

for i in range(m):
    x, y = [int(e) for e in input().split()]
    p = Point(x, y)
    print(rect.contains(p))
