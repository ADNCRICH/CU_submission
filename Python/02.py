def get_sid_section(stu_rec):
    a = stu_rec.split(",")
    return [a[0], a[1].lstrip("0")]


def get_sid_sections(stu_recs):
    return sorted([get_sid_section(stu_rec) for stu_rec in stu_recs], key=lambda x: x[0])


def get_section(sid_sections, sid):
    for x in sid_sections:
        if x[0] == sid:
            return x[1]
    return "0"


def get_stu_points(grader_points):
    re = []
    for x in grader_points:
        a = x.split(",")
        id = a[0]
        p = int(a[2])
        ch = 1
        for (i, x) in enumerate(re):
            if x[0] == id:
                re[i][1] = max(re[i][1], p)
                ch = 0
                break
        if ch == 1:
            re.append([id, p])
    return sorted(re, key=lambda x: x[0])


def get_stu_section_points(stu_points, sid_sections):
    re = []
    for x in stu_points:
        id = x[0]
        p = x[1]
        s = get_section(sid_sections, id)
        ch = 1
        for (i, x) in enumerate(re):
            if x[2] == id:
                re[i][1] = max(re[i][1], p)
                ch = 0
                break
        if ch == 1:
            re.append([s, p, id])
    return sorted(re, key=lambda x: x[2])


def get_section_point_count(stu_section_points, min_point):
    re = []
    for x in stu_section_points:
        s = x[0]
        p = x[1]
        ch = 1
        for (i, y) in enumerate(re):
            if y[0] == s:
                if p >= min_point:
                    re[i][1] += 1
                ch = 0
                break
        if ch == 1:
            re.append([s, 1 if p >= min_point else 0])
    return sorted(re, key=lambda x: x[0])


    # print(get_sid_section("MrBond,007,BND"))
    # print(get_sid_sections(["stu_CompProg,101,CPG", "MrBond,007,BND"]))
    # print(get_section([["MrBond", "7"], ["stu_CompProg", "101"]], "MrBond"))
grader_points = ["MrBond,9:55:10,80", "stu_CompProg,9:40:18,60", "MrBond,9:59:19,100",
                 "MrBond,10:02:43,0", "Luffy,10:09:59,0", "Lalisa,9:50:09,100", "Zoro,10:05:55,0"]
# print(get_stu_points(grader_points))
stu_points = [["Lalisa", 100], ["Luffy", 0], ["MrBond", 100], ["Zoro", 0], ["stu_CompProg", 60]]
sid_sections = [["Lalisa", "101"], ["MrBond", "7"], ["Zoro", "7"], ["stu_CompProg", "101"]]
print(get_stu_section_points(stu_points, sid_sections))


stu_section_points = [["101", 100, "Lalisa"], ["0", 0, "Luffy"], ["7", 100, "MrBond"],  ["7", 0, "Zoro"], ["101", 60, "stu_CompProg"]]
print(get_section_point_count(stu_section_points, 60))  # [["0", 0], ["101", 2], ["7", 1]]
