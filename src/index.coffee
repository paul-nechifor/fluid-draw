fs = require 'fs'
Canvas = require 'canvas'

exports.Painter = require './Painter'
exports.options = require './options'
exports.painters =
  Fan: require './painters/Fan'
  Squares: require './painters/Squares'

exports.saveCanvas = (canvas, file, cb) ->
  out = fs.createWriteStream file
  returned = false
  stream = canvas.pngStream()
  stream.on 'data', (chunk) ->
    out.write chunk
  stream.on 'error', (err) ->
    cb err unless returned
    returned = true
  stream.on 'end', (err) ->
    cb() unless returned
    returned = true

exports.savePainter = (file, painterName, opts, cb) ->
  canvas = new Canvas
  painter = new exports.painters[painterName] canvas
  painter.set opts
  painter.paintAll (err) ->
    return cb err if err
    exports.saveCanvas canvas, file, (err) ->
      return cb err if err
      cb()
