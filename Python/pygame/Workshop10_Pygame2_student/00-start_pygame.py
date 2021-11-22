import pygame as pg

pg.init()

#Define some colors
black = (0,0,0)
white = (255,255,255)
green = (0,255,0)
red = (255,0,0)

width = 700
height = 500
FPS = 60
screen = pg.display.set_mode((width,height))
pg.display.set_caption("ComProg ECN")
clock = pg.time.Clock()

while True:

    clock.tick(FPS)

    for event in pg.event.get():
        if event.type == pg.QUIT:
            pg.quit()

    screen.fill(white)

    # Draw text "CP SEC 5" [size : 80 , center :(width/2 , height/4)]
    font_name = pg.font.match_font('arial') # กำหนดชื่อ Font
    font = pg.font.Font(font_name, 80) # กำหนดขนาด font
    text_surface = font.render("ComProg SEC 5", True, black) # กำหนด Text และ สี
    text_rect = text_surface.get_rect() # แปลง Surface เป็น object
    text_rect.midtop = (400, 300) # ระบุตำแหน่งของ text
    screen.blit(text_surface, text_rect) # เอา Text ใส่ลงใน object ของ Text นั้น

    pg.draw.rect(screen,red,[55,200,100,70],0)
    pg.draw.line(screen, green ,[20,35],[250,160],5)
    pg.draw.ellipse(screen , black , [340,100,250,100], 2)

    pg.display.flip()

