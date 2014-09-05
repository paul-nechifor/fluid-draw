opts = require '../options'
Painter = require '../Painter'

module.exports = class Fan extends Painter
  constructor: (@canvas) ->
    super
    @setOpts [
      new opts.Number 'width', 512, 10, null, 'Width of the image.'
      new opts.Number 'height', 256, 10, null, 'Height of the image.'
      new opts.Color 'primary', '0000ff', 'Primary color (left one).'
      new opts.Color 'secondary', 'ff0000', 'Secondary color (right one).'
      new opts.Color 'drawColor', 'ffffff', 'Text and circle color.'
      new opts.Number 'angle', 25, 0, 90, 'Angle of the shape.'
      new opts.Number 'stripes', 8, 0, null, 'Number of stripes.'
      new opts.Number 'stripeSize', 0.08, 0, null,
          'Stripe size (ratio of width).'
      new opts.Number 'circleRadius', 0.2, 0, null,
          'Circle radius (ratio of width).'
      new opts.Number 'circleLineWidth', 0.01, 0, null,
          'Circle line width (radio of width).'
    ]

  paintAll: (cb) ->
    errs = @validateValues()
    return cb errs if errs.length > 0
    @canvas.width = @width = @optsMap.width.value
    @canvas.height = @height = @optsMap.height.value

    @angle = @optsMap.angle.value * (Math.PI / 180)
    @stripes = @optsMap.stripes.value
    @stripeSize = @optsMap.stripeSize.value * @width
    slant = @height * Math.tan @angle
    @stripeStart = (@width - @stripeSize * (@stripes - 1) - slant) / 2
    @radius = @optsMap.circleRadius.value * @width
    @lineWidth = @optsMap.circleLineWidth.value * @width

    @ctx = @canvas.getContext '2d'
    @ctx.fillStyle = '#' + @optsMap.primary.value
    @ctx.fillRect 0, 0, @width, @height

    for i in [0 .. @stripes - 1]
      @paintTrapezoid @stripeStart + i * @stripeSize, false
      @paintTrapezoid @stripeStart + i * @stripeSize, true

    if @radius > 0
      @paintCircle()

    cb()

  paintTrapezoid: (start, reverse) ->
    stop = start + @height * Math.tan @angle
    color2 = @optsMap.secondary
    transp = 1 / (@stripes + 0.2) # So it looks a little better
    @ctx.fillStyle = "rgba(#{color2.r}, #{color2.g}, #{color2.b}, #{transp})"
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

  paintCircle: ->
    @ctx.beginPath()
    @ctx.arc @width/2, @height/2, @radius, 0, 2 * Math.PI, false
    @ctx.lineWidth = @lineWidth
    @ctx.strokeStyle = '#' + @optsMap.drawColor.value
    @ctx.stroke()
