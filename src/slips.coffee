class App
  constructor: (@block) ->
    @canvas = document.getElementById 'slips-canvas'
    @context = @canvas.getContext '2d'
    @context.fillStyle = "#eeeeee"
    @context.fillRect 0, 0, 500, 500
    @block()

  status: (status) ->
    $('.console').empty().append("<p>#{status} app...</p>")

  rect: (left, top, width, height, style = {}) ->
    rect = new Rect(@context, left, top, width, height, style)
    console.log "created rect: #{rect}"
    rect.draw()

class Slips
  @app: (block) ->
    app = new App block

# export functions, for node or for browser
exports = exports ? window
exports.Slips = Slips
