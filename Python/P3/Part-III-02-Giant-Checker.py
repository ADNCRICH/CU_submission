# ----------------------------------------
# Q3: Checker
# ----------------------------------------
pos = input().strip()  # รับมามีอย่างน้อย 1 ตัวแน่ ๆ

row = ''
col = ''
if len(pos) <= 3:
    # แบบที่ 1
    row = pos[0]
    col = pos[1:]
else:
    # แบบที่ 2 (กรณีนี้ค่อยทำทีหลังก็ได้ เพราะยุ่งกว่า แต่ให้คะแนนแค่ 20%)
    # หาค่าของตัวอักษรแถว มาใส่ในตัวแปร  row ถ้าหาไม่พบ ก็ให้เป็นสตริงว่าง ๆ
    # หาค่าของเลขคอลัมน์ มาใส่ในตัวแปร  col ถ้าหาไม่พบ ก็ให้เป็นสตริงว่าง ๆ

    row, col = pos.split(',')
    row = row.split('=')
    col = col.split('=')
    if(row[0] == 'row'):
        row, col = row[1], col[1]
    else:
        row, col = col[1], row[1]


row = row.strip()
col = col.strip()
# -----------------------------------------
valid_row = True
valid_col = True
cf = 0
ans = 0

# ตรวจค่าของสตริง row ถ้าผิด ก็เปลี่ยนตัวแปร valid_row ให้เป็น False
if row.isalpha():
    ans += ord(row)
else:
    valid_col = False
    cf += 1

# ตรวจค่าของสตริง col ถ้าผิด ก็เปลี่ยนตัวแปร valid_col ให้เป็น False
if col.isnumeric() and 0 < int(col) <= 52:
    ans += int(col)
else:
    valid_row = False
    cf += 1

# -----------------------------------------
# ตรวจค่าของตัวแปร valid_row และ valid_col
# เพื่อแสดงข้อผิดพลาด ถ้ามีค่าเป็น False (มี 3 กรณี)
# ถ้าไม่มีข้อผิดพลาด ก็ค่อยตัดสินใจว่าจะแสดง Black หรือ White ตามสีพื้นของช่อง row, col
if cf == 0:
    print("White" if ans % 2 == 0 else "Black")
elif cf == 2:
    print("Invalid row and column")
else:
    print("Invalid "+("row" if not valid_col else "column"))
