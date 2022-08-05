import nico



const
  barLen = 20
  yBarPos = 100
  barHeigth = 4

var 
  xBarPos = screenWidth/%2 - barLen

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
  # bar
  setColor(4)
  rboxfill(xBarPos, yBarPos, barLen, barHeigth)




# initialization
nico.init("nico", "test")

# we want a fixed sized screen with perfect square pixels
fixedSize(true)
integerScale(true)
# create the window
nico.createWindow("nico",128,128,4)

# start, say which functions to use for init, update and draw
nico.run(gameInit, gameUpdate, gameDraw)