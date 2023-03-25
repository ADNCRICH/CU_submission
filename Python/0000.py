folder = input()
name = input().strip().lower()
n_name = input()

with open(folder, "r") as f:
    for line in f.readlines():
        line = line.strip()
        line = line.split("/")
        # print(line)
        out = ""
        for i in line[:-1]:
            if len(i) != len(name):
                out += i + "/"
                continue
            ch = True
            # for j in range(len(i)):
            #     if i[j].lower() != name[j] and name[j] != '?':
            #         ch = False
            if sum(1 if i[j].lower() == name[j] or name[j] == '?' else 0 for j in range(len(i))) != len(i):
                ch = False
            # if ch == True:
            #     out += n_name + "/"
            # else:
            #     out += i + "/"
            out += (n_name if ch else i) + '/'
        out += line[-1]
        print(out)
