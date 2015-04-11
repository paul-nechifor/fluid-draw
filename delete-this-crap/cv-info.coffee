fluidDraw = require '../src'

opts =
  width: 740
  height: 360

  #primary: '37ad8e'
  #secondary: 'aa2222'

  #primary: '1144ff'
  #secondary: 'eeeeee'

  #primary: 'ffa500'
  secondary: 'ff0000'
  angle: 18
  stripes: 8
  text: 'CV INFO'
fluidDraw.savePainter __dirname + '/cv-info.png', 'Fan', opts, (err) ->
  throw err if err
