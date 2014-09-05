exports.Option = class Option
  constructor: (@name, @initial, @desc) ->
    @validateFunc = -> 'not-implemented'
    @value = @initial

  validate: -> @validateFunc()

exports.Number = class Number extends Option
  constructor: (name, initial, @min, @max, desc) ->
    super name, initial, desc
    @validateFunc = =>
      return 'non-number' unless typeof @value is 'number'
      return 'smaller-than-minimum' if @min? and @value < @min
      return 'bigger-than-maximum' if @max? and @value > @max
      return null

exports.Color = class Color extends Option
  constructor: (name, initial, desc) ->
    super
    @validateFunc = =>
      return 'non-string' unless typeof @value is 'string'
      return 'invalid hex color' unless /^[0-9a-f]{6}$/i.test @value
      @r = parseInt @value.substring(0, 2), 16
      @g = parseInt @value.substring(2, 4), 16
      @b = parseInt @value.substring(4, 6), 16
      return null

exports.String = class String extends Option
  constructor: (name, initial, desc) ->
    super
    @validateFunc = ->
      return 'non-string' unless typeof @value is 'string'
      return null
