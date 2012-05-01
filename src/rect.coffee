class Rect
  constructor: (@context, @left, @top, @width, @height, @style) ->

  draw: ->
    @context.beginPath()
    @context.rect(@left, @top, @width, @height)
    @context.fillStyle = @style.fill
    @context.fill()
    @context.lineWidth = @style.strokewidth
    @context.strokeStyle = @style.stroke
    @context.stroke()
    this

exports = exports ? window
exports.Rect = Rect
