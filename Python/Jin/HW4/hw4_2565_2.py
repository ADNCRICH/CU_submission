def get_product_from_file(textfile):
    product = {}
    with open(textfile) as f:
        for l in f:
            a, b = [i.strip() for i in l.split("=")]
            if (a == "created_date"):
                product[a] = b[0:2]+"/"+b[2:4]+"/"+b[4:8]
            else:
                product[a] = b
    return product


# ======================================
def cal_defect_ratio(textfile):
    defect_ratio = 0
    a = get_product_from_file(textfile)["scan_data"].split(",")
    defect_ratio = sum(i == '+' for i in a)/len(a)
    return round(defect_ratio, 2)


# ======================================
def cal_defect_box_ratio(textfile):
    defect_box_ratio = 0
    a = get_product_from_file(textfile)["scan_data"].split(",")
    l = 0
    r = len(a)
    while l != r:
        mid = (l+r+1)//2
        if mid*mid*mid <= len(a):
            l = mid
        else:
            r = mid-1
    mi, mj, mk = [l]*3
    Mi, Mj, Mk = [0]*3
    for i in range(l):
        for j in range(l):
            for k in range(l):
                if a[i*l*l+j*l+k] == '+':
                    mi, mj, mk = [min(mi, i), min(mj, j), min(mk, k)]
                    Mi, Mj, Mk = [max(Mi, i), max(Mj, j), max(Mk, k)]
    defect_box_ratio = max(Mi-mi+1, 0)*max(Mj-mj+1, 0)*max(Mk-mk+1, 0)/len(a)
    return round(defect_box_ratio, 2)


# ======================================
def create_prod_summary_file(pids):
    if len(pids) == 0:
        return
    add = []
    for i in pids:
        a = get_product_from_file(i+".txt")
        add.append([i, a["created_date"], a["factory_id"], str(cal_defect_ratio(i+".txt")), str(cal_defect_box_ratio(i+".txt"))])
    add = sorted(add, key=lambda x: x[0])
    with open("product_summary.csv", "w") as f:
        f.write("pid,created_date,factory_id,defect_ratio,defect_box_ratio\n")
        for i in add:
            f.write(",".join(i)+"\n")
    return


# ======================================
def create_size_summary_file(pids):
    if len(pids) == 0:
        return
    a = [0, 0, 0]
    for i in pids:
        s = cal_defect_box_ratio(i+".txt")
        if (s < 0.33):
            a[0] += 1
        elif (s < 0.67):
            a[1] += 1
        else:
            a[2] += 1
    with open("size_summary.csv", "w") as f:
        f.write("size,#\n")
        f.write("S,"+str(a[0])+"\n")
        f.write("M,"+str(a[1])+"\n")
        f.write("L,"+str(a[2])+"\n")
    return


# ======================================
# สามารถเขียนฟังก์ชันที่สร้างเองได้ในบริเวณด้านล่างนี้เท่านั้น
# print(get_product_from_file("004.txt"))
# print(cal_defect_ratio("004.txt"))
# print(cal_defect_box_ratio("010.txt"))
# create_prod_summary_file(["001", "199", "003", "004", "ABCD", "002", "010", "009", "008", "007", "005"])
create_prod_summary_file(["005", "005"])
create_size_summary_file(["005", "005"])
