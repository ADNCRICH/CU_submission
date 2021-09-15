def distance1(x1, y1, x2, y2):
    return ((x1-x2)**2+(y1-y2)**2)**0.5


def distance2(p1, p2):
    return ((p1[0]-p2[0])**2+(p1[1]-p2[1])**2)**0.5


def distance3(c1, c2):
    d = distance2(c1[0:2], c2[0:2])
    p = True
    if abs(c1[2]-c2[2]) > d or abs(c1[2]+c2[2]) < d:
        p = False
    return d, p


def perimeter(points):
    return sum(((points[i][0]-points[(i+1) % len(points)][0])**2+(points[i][1]-points[(i+1) % len(points)][1])**2)**0.5 for i in range(0, len(points)))


exec(input().strip())
