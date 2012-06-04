# use exports also in browser
exports = exports ? window

# from https://github.com/jashkenas/coffee-script/wiki/FAQ
exports.extend = (obj, mixin) ->
  for name, method of mixin
    obj[name] = method

exports.include = (klass, mixin) ->
  extend klass.prototype, mixin

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
    # reassign a function to `object`. Allows use of the Shoes DSL, without the
    # explicit receiver expected by functions in Shoes.Dsl
    reassign = (f) ->
      (args...) ->
        object[f](object, args...)
    rect = reassign "rect"
    para = reassign "para"
    flow = reassign "flow"
    code = "var withContext = " + block.toString() + ";"
    eval(code)
    withContext.apply(object)
    object

exports.Shoes = Shoes

