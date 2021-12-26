def distance1(x1, y1, x2, y2):
    return ((x1-x2)**2 + (y1-y2)**2)**0.5


def distance2(p1, p2):
    return ((p1[0]-p2[0])**2 + (p1[1]-p2[1])**2)**0.5


def distance3(c1, c2):
    D = distance2(c1[:2], c2[:2])
    return (D, not(D > c1[2]+c2[2] or max(c1[2], c2[2]) > D + min(c1[2], c2[2])))


def perimeter(points):

    # s = 0
    # for i in range(len(points)):
    #     s += distance2(points[i], points[(i+1) % len(points)])
    # return s

    return sum(distance2(points[i], points[(i+1) % len(points)]) for i in range(len(points)))


exec(input().strip())
