mname = ["Jan", "Feb", "Mar", "Apr",
         "May", "Jun", "Jul", "Aug",
         "Sep", "Oct", "Nov", "Dec"]


def read_date():
    date1 = input().split()
    d1 = int(date1[0])
    m1 = mname.index(date1[1][:3]) + 1
    y1 = int(date1[2])
    return [d1, m1, y1]


def zodiac(d1, m1):
    if d1 >= 22 and m1 == 3 or d1 <= 21 and m1 == 4:
        z1 = "Aries"
    elif d1 >= 22 and m1 == 4 or d1 <= 21 and m1 == 5:
        z1 = "Taurus"
    elif d1 >= 22 and m1 == 5 or d1 <= 21 and m1 == 6:
        z1 = "Gemini"
    elif d1 >= 22 and m1 == 6 or d1 <= 21 and m1 == 7:
        z1 = "Cancer"
    elif d1 >= 22 and m1 == 7 or d1 <= 21 and m1 == 8:
        z1 = "Leo"
    elif d1 >= 22 and m1 == 8 or d1 <= 21 and m1 == 9:
        z1 = "Virgo"
    elif d1 >= 22 and m1 == 9 or d1 <= 21 and m1 == 10:
        z1 = "Libra"
    elif d1 >= 22 and m1 == 10 or d1 <= 21 and m1 == 11:
        z1 = "Scorpio"
    elif d1 >= 22 and m1 == 11 or d1 <= 21 and m1 == 12:
        z1 = "Sagittarius"
    elif d1 >= 22 and m1 == 12 or d1 <= 20 and m1 == 1:
        z1 = "Capricorn"
    elif d1 >= 21 and m1 == 1 or d1 <= 20 and m1 == 2:
        z1 = "Aquarius"
    elif d1 >= 21 and m1 == 2 or d1 <= 21 and m1 == 3:
        z1 = "Pisces"
    return z1


def days_in_feb(y1):
    days_in_feb1 = 28
    if y1 % 400 == 0 or y1 % 100 != 0 and y1 % 4 == 0:
        days_in_feb1 = 29
    return days_in_feb1
