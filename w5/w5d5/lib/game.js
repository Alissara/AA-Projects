const Asteroid = require("./asteroid");
const Util = require("./util");

const Game = function(){
  this.asteroids = [];

  this.addAsteroids();
};

Game.BG_COLOR = "#000000";
Game.DIM_X = 600;
Game.DIM_Y = 600;
Game.NUM_ASTEROIDS = 50;

Game.prototype.addAsteroids = function() {
  for (let i = 0; i < Game.NUM_ASTEROIDS; i++ ) {
    let ranPos = this.randomPosition();
    let a = new Asteroid({ pos: ranPos });
    this.asteroids.push(a);
  }
};

Game.prototype.randomPosition = function() {
  return [ Math.random() * Game.DIM_X, Math.random() * Game.DIM_Y ];
};

Game.prototype.draw = function(ctx) {
  ctx.clearRect(0, 0, Game.DIM_X, Game.DIM_Y);
  ctx.fillStyle = Game.BG_COLOR;
  ctx.fillRect(0, 0, Game.DIM_X, Game.DIM_Y);

  this.asteroids.forEach((a) => {
    a.draw(ctx);
  });
};

Game.prototype.moveObject = function() {
  this.asteroids.forEach((a) => {
    a.move();
  });
};

// Game.prototype.checkCollisions

module.exports = Game;










// Game.prototype.moveObject = function(delta) {
//   this.asteroids.forEach((a) => {
//     a.move(delta);
//   });
// };
