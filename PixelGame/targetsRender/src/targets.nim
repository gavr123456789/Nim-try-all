import consts
import nico

type Target = object 
  x*: int
  y*: int
  dead*: bool

func initTarget(x, y: int): Target =
  Target(x: x, y: y, dead: false)

proc draw*(self: Target) =
  rboxfill(self.x, self.y, TARGET_WIDTH, TARGET_HEIGTH)



func initTargets*(): seq[Target] =
  result.setLen TARGET_ROWS * TARGET_COLS

  for row in 0..<TARGET_ROWS:
    for col in 0..<TARGET_COLS:
      let 
        x = TARGET_GRID_X + (TARGET_WIDTH + TARGET_PADDING_X) * col
        y = TARGET_GRID_Y + TARGET_PADDING_Y * row
      result[row*TARGET_COLS + col] = initTarget(x, y)

    