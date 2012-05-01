// Generated by CoffeeScript 1.3.1
(function() {
  var Rect, exports;

  Rect = (function() {

    Rect.name = 'Rect';

    function Rect(context, left, top, width, height, style) {
      this.context = context;
      this.left = left;
      this.top = top;
      this.width = width;
      this.height = height;
      this.style = style;
    }

    Rect.prototype.draw = function() {
      this.context.beginPath();
      this.context.rect(this.left, this.top, this.width, this.height);
      this.context.fillStyle = this.style.fill;
      this.context.fill();
      this.context.lineWidth = this.style.strokewidth;
      this.context.strokeStyle = this.style.stroke;
      this.context.stroke();
      return this;
    };

    return Rect;

  })();

  exports = exports != null ? exports : window;

  exports.Rect = Rect;

}).call(this);