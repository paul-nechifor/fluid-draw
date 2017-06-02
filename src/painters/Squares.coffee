opts = require '../options'
Painter = require '../Painter'
Color = require 'color'

module.exports = class Squares extends Painter
  constructor: (@canvas) ->
    super
    @setOpts [
      new opts.Number 'width', 512, 10, null, 'Width of the image.'
      new opts.Number 'height', 256, 10, null, 'Height of the image.'
      new opts.Number 'squareSize', 0.05, 0, null,
          'Square size (ratio of width).'
      new opts.Number 'hMin', 10, 0, 360, 'Minimul hue.'
      new opts.Number 'hMax', 40, 0, 360, 'Maximum hue.'
      new opts.Number 'sMin', 70, 0, 100, 'Minimul saturation.'
      new opts.Number 'sMax', 70, 0, 100, 'Maximum saturation.'
      new opts.Number 'lMin', 50, 0, 100, 'Minimul lightness.'
      new opts.Number 'lMax', 50, 0, 100, 'Maximum lightness.'
    ]

  paintAll: (cb) ->
    errs = @validateValues()
    return cb errs if errs.length > 0
    @canvas.width = @width = @optsMap.width.value
    @canvas.height = @height = @optsMap.height.value

    @squareSize = Math.floor @optsMap.squareSize.value * @width
    nSquaresX = Math.ceil @width / @squareSize
    nSquaresY = Math.ceil @height / @squareSize

    @startX = Math.floor (@width - nSquaresX * @squareSize) / 2
    @startY = Math.floor (@height - nSquaresY * @squareSize) / 2

    @ctx = @canvas.getContext '2d'

    for x in [0 .. nSquaresX - 1]
      for y in [0 .. nSquaresY - 1]
        @paintSquare x, y

    cb()

  paintSquare: (x, y) ->
    color = Color
      h: @rand @optsMap.hMin.value, @optsMap.hMax.value
      s: @rand @optsMap.sMin.value, @optsMap.sMax.value
      l: @rand @optsMap.lMin.value, @optsMap.lMax.value
    @ctx.fillStyle = color.rgb().string()
    posX = @startX + x * @squareSize
    posY = @startY + y * @squareSize
    @ctx.fillRect posX, posY, @squareSize, @squareSize

  rand: (min, max) ->
    Math.floor Math.random() * (max - min + 1) + min
