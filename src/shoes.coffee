# use exports also in browser
exports = exports ? window

class Shoes
  @app: (block) ->
    app = new Shoes.App block

  @sample: ->
    """
    Shoes.app ->
      style = {
        stroke: "black",
        fill: "mediumorchid",
        strokewidth: 4
      }
      rect 10, 40, 200, 200, style
      para "Here's a nice purple block to start with"
    """

  # Provide for nicely named DSL methods, e.g. "rect" instead of "@rect"
  # Adds local variables aliased to the DSL methods on object.
  # Re-evals block to pick up local variables.
  @eval: (object, block) ->
    rect = object.rect
    para = object.para
    code = "withContext = " + block.toString() + ";"
    eval(code)
    withContext.call(object)
    object

exports.Shoes = Shoes

class Shoes.App

  constructor: (@block) ->
    @canvas = document.getElementById 'app-canvas'
    @context = @canvas.getContext '2d'
    @container = document.getElementById 'app-content'
    @container.innerHTML = ''
    if @block then Shoes.eval this, @block

  rect: (left, top, width, height, style = {}) =>
    console.log("Making rect(#{left}, #{top}, #{width}, #{height}")
    rect = new Rect(@context, left, top, width, height, style)
    rect.draw()

  para: (text, style = {}) =>
    new Para(@container, text, style)


