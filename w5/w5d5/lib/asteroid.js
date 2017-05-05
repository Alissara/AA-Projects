const Util = require("./util");
const MovingObject = require("./moving_object");

const Asteroid = function(options = {}) {
  options.pos = options.pos;
  options.vel = Util.randomVec(5);
  options.radius = 20;
  options.color = 'blue';

  MovingObject.call(this, options);
};

Util.inherits(Asteroid, MovingObject);




module.exports = Asteroid;
