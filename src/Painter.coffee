module.exports = class Painter
  constructor: (@canvas) ->
    @optsMap = {}
    @optsList = null

  setOpts: (@optsList) ->
    for opt in @optsList
      @optsMap[opt.name] = opt
    return

  paintAll: (cb) ->
    cb 'not-implemented'

  paintPartial: (cb) ->
    cb 'not-implemented'
