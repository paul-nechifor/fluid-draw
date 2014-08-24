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
      new opts.Color 'primary', '#3377aa', 'Primary color (left one).'
    ]

  paintAll: (cb) ->
    @canvas.width = width = @optsMap.width.value
    @canvas.height = height = @optsMap.height.value
    ctx = @canvas.getContext '2d'
    ctx.fillStyle = @optsMap.primary.value
    ctx.fillRect 0, 0, width, height
    cb()

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
