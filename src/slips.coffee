class App
  constructor: ->
    @canvas = document.getElementById 'slips-canvas'
    @canvas.width = 300
    @canvas.height = 300
    @context = @canvas.getContext '2d'

  run: (block) ->
    block()

  status: (status) ->
    $('.status').text("#{status} app...")

  rect: (left, top, width, height) ->
    console.log(this)
    @context.beginPath()
    @context.rect(left, top, width, height)
    @context.fillStyle = "ff3377"
    @context.fill()
    @context.lineWidth = 4
    @context.strokeStyle = 'black'
    @context.stroke()
    this

class Slips
  @app: (block) ->
    app = new App
    console.log("app: #{app}")
    app.status "testing"
    block.apply(app)

# export functions, for node or for browser
exports = exports ? window
exports.Slips = Slips
