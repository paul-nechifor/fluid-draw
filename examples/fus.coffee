fluidDraw = require '../src'

opts =
  width: 740
  height: 360
  primary: 'ffcc00'
  customFill: 'rgba(180, 0, 0, 0.09)'
  stripeSize: 0.074
  angle: 45
  stripes: 8
  fontName: 'Ubuntu'
  fontSize: 0.10
  text: 'Fus Talk'
  circleLineWidth: 0.018
  circleRadius: 0.215
  #drawColor: 'e4e4ff'
  drawColor: '661100'
fluidDraw.savePainter __dirname + '/fus.png', 'Fan', opts, (err) ->
  throw err if err

###
      new opts.Color 'secondary', 'ff0000', 'Secondary color (right one).'
      new opts.String 'customFill', '',
          'Custom fill for trapezoids (ex: "rgba(0, 0, 0, 0.1)").'
      new opts.Color 'drawColor', 'ffffff', 'Text and circle color.'
      new opts.Number 'angle', 25, 0, 90, 'Angle of the shape.'
      new opts.Number 'stripes', 8, 0, null, 'Number of stripes.'
      new opts.Number 'stripeSize', 0.08, 0, null,
          'Stripe size (ratio of width).'
      new opts.Number 'circleRadius', 0.2, 0, null,
          'Circle radius (ratio of width).'
      new opts.Number 'circleLineWidth', 0.01, 0, null,
          'Circle line width (radio of width).'
      new opts.String 'text', 'FAN', 'Text to be drawn.'
      new opts.String 'fontName', 'sans-serif', 'Font name.'
      new opts.Number 'fontSize', 0.08, 0, null, 'Font size.'
###
