fluidDraw = require '../src'

opts =
  width: 740
  height: 360

  #primary: '37ad8e'
  #secondary: 'aa2222'

  #primary: '1144ff'
  #secondary: 'eeeeee'

  primary: 'ffa500'
  secondary: 'ff0000'
  angle: 15
  stripes: 10
fluidDraw.savePainter __dirname + '/fan.png', 'Fan', opts, (err) ->
  throw err if err
