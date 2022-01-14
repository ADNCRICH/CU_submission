menu = {"milk tea": [35, 45, 55], "green tea": [40, 50, 60], "ovaltine": [50, 65, 80], "black tea": [30, 40, 50]}
topping = {"none": 0, "bubble": 10, "jelly": 15, "coconut": 20}
order = []
price = 0

x = input("What would you like? : ").lower().strip()
while(True):
    ord = []
    p = 0

    while x not in menu:
        print("We don't have " + x + ".")
        x = input("What would you like? : ").lower().strip()
    ord.append(x)

    x = input("What size?(S/M/L) : ").lower().strip()
    while x not in ['s', 'm', 'l']:
        print("We don't have " + x + " size.")
        x = input("What size?(S/M/L) : ").lower().strip()
    ord.append(x)
    p += menu[ord[0]][['s', 'm', 'l'].index(ord[1])]

    x = input("What topping do you prefer?(none to skip) : ").lower().strip()
    while x not in topping:
        print("We don't have " + x)
        x = input("What topping do you prefer? : ").lower().strip()
    ord.append(x)
    p += topping[x]

    x = int(input("How many for this drink? : "))
    p *= x

    price += p
    order.append(str(x) + " " + ord[1].upper() + " size " + ord[0].capitalize() + ((" with " + ord[2]) if ord[2] != "none" else ""))

    x = input("Any thing else?(Yes/No) : ").lower().strip()
    if x == "yes":
        x = input("What would you like? : ").lower().strip()
    else:
        break

print("\nYour order is :")
for i in order:
    print(i)
print("\nTotal is", price)


"""

Ovaltine
L
coconut
3
yes
Milk tea
M
none
5
no

"""
