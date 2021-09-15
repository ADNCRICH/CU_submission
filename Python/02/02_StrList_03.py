import calendar
a = str(input())
b = a.split("/")

print("%s %s, %s" % (calendar.month_name[int(b[1])], b[0], b[2]))
