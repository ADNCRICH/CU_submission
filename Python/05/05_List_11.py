a = input()
x = [str(i) for i in range(0, 10) if a.find(str(i)) == -1]
print("None"if len(x) == 0 else ",".join(x))
