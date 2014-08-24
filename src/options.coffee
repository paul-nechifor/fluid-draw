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
    @validateFunc = -> true # TODO
