fluidDraw = require '../../src'
opts = fluidDraw.options
Canvas = require 'canvas'
fs = require 'fs'

class Fan extends fluidDraw.Painter
  constructor: (@canvas) ->
    super
    @setOpts [
      new opts.Number 'width', 512, 10, null, 'Width of the image.'
      new opts.Number 'height', 256, 10, null, 'Height of the image.'
      new opts.Color 'primary', '#0000FF', 'Primary color (left one).'
      new opts.Number 'angle', 25, 0, 90, 'Angle of the shape.'
      new opts.Number 'stripes', 8, 0, null, 'Number of stripes.'
      new opts.Number 'stripeSize', 0.08, 0, null,'Stripe size (ratio of width).'
    ]

  paintAll: (cb) ->
    @canvas.width = @width = @optsMap.width.value
    @canvas.height = @height = @optsMap.height.value

    @angle = @optsMap.angle.value * (Math.PI / 180)
    stripes = @optsMap.stripes.value
    @stripeSize = @optsMap.stripeSize.value * @width
    slant = @height * Math.tan @angle
    @stripeStart = (@width - @stripeSize * (stripes - 1) - slant) / 2

    @ctx = @canvas.getContext '2d'
    @ctx.fillStyle = @optsMap.primary.value
    @ctx.fillRect 0, 0, @width, @height

    for i in [0 .. stripes - 1]
      @paintTrapezoid @stripeStart + i * @stripeSize, false
      @paintTrapezoid @stripeStart + i * @stripeSize, true

    cb()

  paintTrapezoid: (start, reverse) ->
    stop = start + @height * Math.tan @angle
    @ctx.fillStyle = 'rgba(255, 0, 0, 0.104)'
    @ctx.beginPath()
    if reverse
      @ctx.moveTo start, @height
      @ctx.lineTo stop, 0
      @ctx.lineTo @width, 0
      @ctx.lineTo @width, @height
    else
      @ctx.moveTo start, 0
      @ctx.lineTo stop, @height
      @ctx.lineTo @width, @height
      @ctx.lineTo @width, 0
    @ctx.fill()

main = ->
  canvas = new Canvas
  fan = new Fan canvas
  fan.paintAll (err) ->
    throw err if err

    out = fs.createWriteStream __dirname + '/fan.png'
    stream = canvas.pngStream()
    stream.on 'data', (chunk) -> out.write chunk
    stream.on 'end', () -> console.log 'done'

main()
