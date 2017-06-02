fluidDraw = require '../src'

start = 270
plus = 30
opts =
  width: 6000
  height: 6000
  hMin: start
  hMax: start + plus
  sMin: 50
  sMax: 60
  lMin: 50
  lMax: 60
  squareSize: 0.04
fluidDraw.savePainter __dirname + '/squares.png', 'Squares', opts, (err) ->
  throw err if err
