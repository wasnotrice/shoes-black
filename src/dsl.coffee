# Dsl methods
#
# Methods signatures include an explicit receiver. These are *not* part of
# the user-facing DSL. They are just to navigate around shifting `this`. See
# `Shoes.eval` for the assignment of the receiver.
Dsl =
  rect: (receiver, left, top, width, height, style = {}) ->
    console.log("Making rect(#{left}, #{top}, #{width}, #{height})")
    rect = new Rect(receiver.context, left, top, width, height, style)
    rect.draw()

  para: (receiver, text, style = {}) ->
    new Para(receiver.container, text, style)

  flow: (receiver, block) ->
    new Flow(receiver.container, {}, block)

exports = exports ? window
exports.Shoes.Dsl = Dsl



