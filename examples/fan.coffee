fluidDraw = require '../src'

opts =
  secondary: 'ff0000'
fluidDraw.savePainter __dirname + '/fan.png', 'Fan', opts, (err) ->
  throw err if err
