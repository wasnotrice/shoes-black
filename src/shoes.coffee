class App
  constructor: (@block) ->
    @canvas = document.getElementById 'app-canvas'
    @context = @canvas.getContext '2d'
    @container = document.getElementById 'app-content'
    @container.innerHTML = ''
    @block()

  rect: (left, top, width, height, style = {}) ->
    rect = new Rect(@context, left, top, width, height, style)
    rect.draw()

  para: (text, style = {}) ->
    new Para(@container, text, style)

class Shoes
  @app: (block) ->
    app = new App block

  @sample: ->
    """
    Shoes.app ->
      style = {
        stroke: "black",
        fill: "mediumorchid",
        strokewidth: 4
      }
      @rect 10, 40, 200, 200, style
      @para "Here's a nice purple block to start with"
    """

# export functions, for node or for browser
exports = exports ? window
exports.Shoes = Shoes
