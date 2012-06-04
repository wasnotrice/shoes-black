class App
  constructor: (@block) ->
    @canvas = document.getElementById 'app-canvas'
    @context = @canvas.getContext '2d'
    @container = document.getElementById 'app-content'
    @container.innerHTML = ''
    if @block then Shoes.eval this, @block

include App, Shoes.Dsl

exports = exports ? window
exports.Shoes.App = App
