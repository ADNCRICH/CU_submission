import calendar

n = input().split('/')

print(calendar.month_name[int(n[1])] + " " + n[0] + ", " + n[2])
print("%s %s, %s" % (calendar.month_name[int(n[1])], n[0], n[2]))
