const Util = require("./util");

const MovingObject = function (options = {}) {
  this.pos = options.pos;
  this.vel = options.vel;
  this.radius = options.radius;
  this.color = options.color;
};

MovingObject.prototype.draw = function(ctx) {
  ctx.fillStyle = this.color;
  ctx.beginPath();
  ctx.arc(this.pos[0], this.pos[1], this.radius, 0, 2 * Math.PI, true);
  ctx.fill();
};

MovingObject.prototype.move = function() {
  this.pos = [this.pos[0] + this.vel[0], this.pos[1] + this.vel[1]];
};

// MovingObject.prototype.isCollidedWith(otherMovingObject)

module.exports = MovingObject;








// const NORMAL_FRAME_TIME_DELTA = 1000/60;
// MovingObject.prototype.move = function(timeDelta) {
//   const velocityScale = timeDelta / NORMAL_FRAME_TIME_DELTA,
//     offsetX = this.vel[0] * velocityScale,
//     offsetY = this.vel[1] * velocityScale;
//
// this.pos = [this.pos[0] + offsetX, this.pos[1] + offsetY];
// };
