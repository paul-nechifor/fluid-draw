fluidDraw = require '../src'

opts =
  width: 740
  height: 360
  primary: 'ffbb00'
  customFill: 'rgba(255, 255, 255, 0.20)'
  stripeSize: 0.1
  angle: 60
  stripes: 4
  circleRadius: 0.22
  fontName: '"Ubuntu"'
  fontSize: 0.09
  text: 'PayWord\nRadio'
  circleLineWidth: 0.01
  drawColor: '524320'
fluidDraw.savePainter __dirname + '/payworld.png', 'Fan', opts, (err) ->
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
