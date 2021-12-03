import numpy as np
from numpy.ma.core import array


def read_data():
 # อ่านข ้อมูลจากแป้นพิมพ์ จากนั้นสร้างและคืนอาเรย์สองตัว
 # weight เป็นอาเรยส์ ามชอ่ งเก็บน ้าหนักของคะแนนกลางภาค ปลายภาค และโครงงาน (float)
 # data เป็นอาเรย์ขนาด n4 เก็บข ้อมูลนักเรียน n คน แต่ละคนมีข ้อมูล
 # เลขประจ าตัว คะแนนกลางภาค ปลายภาค และโครงงาน (int)
    w = [float(e) for e in input().split()]
    weight = np.array(w)
    n = int(input())
    data = np.ndarray((n, 4), int)
    for i in range(n):
        data[i] = [int(e) for e in input().split()]
    return weight, data


def report_lower_than_mean(weight, data):
    sco = np.matmul(data[:, 1:], weight.reshape(-1, 1))
    dd = [str(i) for i in (data[:, :1][sco < sum(sco)/len(sco)])]
    print(", ".join(dd) if len(dd) > 0 else "None")
 # แสดงเลขประจ าตัวที่ได ้คะแนนรวมต ่ากว่าคะแนนเฉลี่ย
 # ให ้แสดงบนบรรทัดเดียวกันหมดคั่ นด ้วยเครื่องหมายจุลภาคและชอ่ งวา่ งหนงึ่ ชอ่ ง
 # เรียงตามล าดับที่ปรากฎใน data ถ้าไม่มีใครได ้ต ่ากว่าคะแนนเฉลี่ยเลย ให ้แสดงค าว่า None


exec(input().strip())
