module.exports = class Painter
  constructor: (@canvas) ->
    @optsMap = {}
    @optsList = null

  setOpts: (@optsList) ->
    for opt in @optsList
      @optsMap[opt.name] = opt
    return

  validateValues: ->
    errs = []
    for opt in @optsList
      err = opt.validate()
      errs.push opt.name + ': ' + err if err?
    errs

  paintAll: (cb) ->
    cb 'not-implemented'

  paintPartial: (cb) ->
    paintAll cb
