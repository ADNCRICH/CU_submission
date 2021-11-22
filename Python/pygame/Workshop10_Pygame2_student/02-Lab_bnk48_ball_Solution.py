# Lab_BNK48 (SCORE 2%)

import pygame as pg

# TO DO 1 : กำหนด width : 1000 , height : 600 และ FPS : 60
width = 1000
height = 600
FPS = 60

# TO DO 2 : กำหนดค่าสีดังนี้ pink : (197,142,195) , white : (255,255,255)
pink = (197, 142, 195)
white = (255, 255, 255)

# TO DO 3 : กำหนดความเร็วให้กับ member แต่ละคน [ 3 member ]
cherprang_speed = [2, 2]
music_speed = [-3, 4]    # [-3,4]
jennis_speed = [3, -2]   # [3,-2]

# TO DO 4 : initialize pygame variable and create clock
pg.init()
clock = pg.time.Clock()

# TO DO 5 : create screen [pygame.display.set_mode] and set caption [pygame.display.set_caption]
screen = pg.display.set_mode((width, height))
pg.display.set_caption("BNK48_BALL")

# Choose 3 members from BNK48 and create pygame object from  get_rect
# [ load , resize , get_rect ]

# Member 1 [size : (150 , 150) , center : (500 , 250) ]
cherprang_img = pg.image.load("source\BNK48\cherprang.png").convert_alpha()
cherprang_img = pg.transform.scale(cherprang_img, (150, 150))
cherprang_rect = cherprang_img.get_rect(center=(500, 250))

# TO DO 6 : create object with attribute in each comment
# Member 2 [size : (100 , 100) , center : (250 , 120)]
jennis_img = pg.image.load("source\BNK48\jennis.png").convert_alpha()
jennis_img = pg.transform.scale(jennis_img, (100, 100))
jennis_rect = jennis_img.get_rect(center=(250, 120))


# Member 3 [size : (120 , 120) , center : (800 , 400)]
music_img = pg.image.load("source\BNK48\music.png").convert_alpha()
music_img = pg.transform.scale(music_img, (120, 120))
music_rect = music_img.get_rect(center=(800, 400))


def check_collide(obj1, obj2):
    if ((obj1.left < obj2.left < obj1.right) and ((obj2.bottom > obj1.top > obj2.top) or (obj1.bottom > obj2.top > obj1.top))) or \
            ((obj2.left < obj1.left < obj2.right) and ((obj2.bottom > obj1.top > obj2.top) or (obj1.bottom > obj2.top > obj1.top))):
        return True
    else:
        return False


while True:
    # TO DO 7 : set ให้ตัวเกมส์แสดงผลด้วยความเร็วที่เหมาะสม [clock.tick(...)]
    clock.tick(FPS)

    for event in pg.event.get():
        if event.type == pg.QUIT:
            pg.quit()

    # TO DO 8 :ใส่สี background สีชมพู (screen.fill(...))
    screen.fill(pink)

    # TO DO 9 : ให้ member ทั้ง 3 คนเคลื่อนที่ตามทิศทางและความเร็วเป็นไปตาม speed ของแต่ละคน
    cherprang_rect = cherprang_rect.move(cherprang_speed)
    jennis_rect = jennis_rect.move(jennis_speed)
    music_rect = music_rect.move(music_speed)

    # TO DO 10 : วาด text คำว่า "BNK48" [size : 250 , center :(width/2 , height/4), สีขาว]
    font_name = pg.font.match_font('arial')  # กำหนดชื่อ Font
    font = pg.font.Font(font_name, 250)  # กำหนดขนาด font
    text_surface = font.render("BNK48", True, white)  # กำหนด Text และ สี
    text_rect = text_surface.get_rect()  # แปลง Surface เป็น object
    text_rect.midtop = (width/2, height/4)  # ระบุตำแหน่งของ text
    screen.blit(text_surface, text_rect)  # เอา Text ใส่ลงใน object ของ Text นั้น

    # TO DO 11 : เขียนเงื่อนไขไม่ให้ตกกรอบทุกด้านให้กับ member ทั้ง 3 คน
    if cherprang_rect.left < 0 or cherprang_rect.right > width:
        cherprang_speed[0] = -cherprang_speed[0]
    if cherprang_rect.top < 0 or cherprang_rect.bottom > height:
        cherprang_speed[1] = -cherprang_speed[1]

    if jennis_rect.left < 0 or jennis_rect.right > width:
        jennis_speed[0] = -jennis_speed[0]
    if jennis_rect.top < 0 or jennis_rect.bottom > height:
        jennis_speed[1] = -jennis_speed[1]

    if music_rect.left < 0 or music_rect.right > width:
        music_speed[0] = -music_speed[0]
    if music_rect.top < 0 or music_rect.bottom > height:
        music_speed[1] = -music_speed[1]

    # Special point
    if (check_collide(cherprang_rect, jennis_rect)):
        cherprang_speed[0] = -cherprang_speed[0]
        cherprang_speed[1] = -cherprang_speed[1]
        jennis_speed[0] = -jennis_speed[0]
        jennis_speed[1] = -jennis_speed[1]
    if (check_collide(cherprang_rect, music_rect)):
        cherprang_speed[0] = -cherprang_speed[0]
        cherprang_speed[1] = -cherprang_speed[1]
        music_speed[0] = -music_speed[0]
        music_speed[1] = -music_speed[1]
    if (check_collide(music_rect, jennis_rect)):
        music_speed[0] = -music_speed[0]
        music_speed[1] = -music_speed[1]
        jennis_speed[0] = -jennis_speed[0]
        jennis_speed[1] = -jennis_speed[1]

    # TO DO 12 : เอาภาพของ member แต่ละคนใส่ลงใน object ของตนเอง
    screen.blit(cherprang_img, cherprang_rect)
    screen.blit(jennis_img, jennis_rect)
    screen.blit(music_img, music_rect)

    pg.display.flip()
