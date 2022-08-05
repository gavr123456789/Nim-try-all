import nico
import consts
import targets



var 
  xBarPos = screenWidth/%2 - BAR_LEN

  targetPool = initTargets()

proc gameInit() =
  setPalette(loadPalettePico8())


proc gameUpdate(dt: Pfloat) =


  if btn(pcLeft):
    xBarPos -= 1
  if btn(pcRight):
    xBarPos += 1



proc gameDraw() =
  cls()
  # background
  setColor(2)
  boxfill(0,0,screenWidth,screenHeight)
  # targets
  setColor(5)
  for target in targetPool:
    if not target.dead:
      target.draw()
      

  # bar
  setColor(6)
  rboxfill(xBarPos, Y_BAR_POS, BAR_LEN, BAR_HEIGTH)




# initialization
nico.init("nico", "test")

# we want a fixed sized screen with perfect square pixels
fixedSize(true)
integerScale(true)
# create the window
nico.createWindow("nico",128,128,4)

# start, say which functions to use for init, update and draw
nico.run(gameInit, gameUpdate, gameDraw)