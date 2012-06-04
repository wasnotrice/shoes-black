class Flow
  constructor: (@container, @style, @block) ->
    @canvas = document.getElementById 'app-canvas'
    @context = @canvas.getContext '2d'
    @element = document.createElement "div"
    @element.className = "shoes-flow"
    @container.appendChild @element
    if @block then Shoes.eval this, @block
    this

include Flow, Shoes.Dsl

exports = exports ? window
exports.Flow = Flow
