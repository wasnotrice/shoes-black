class Para
  constructor: (@container, @text, @style) ->
    @element = document.createElement "p"
    @element.appendChild document.createTextNode(@text)
    @container.appendChild @element
    # Need to apply styles, something like
    # @element.style[key] = value for key, value of @style
    this

exports = exports ? window
exports.Para = Para
