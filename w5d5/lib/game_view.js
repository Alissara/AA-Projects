const GameView = function(game, ctx) {
  this.ctx = ctx;
  this.game = game;
};

GameView.prototype.start = function() {
  let gv = this;
  window.setInterval(function() {
    gv.game.moveObject();
    gv.game.draw(gv.ctx);
  }, 20);
};

module.exports = GameView;





// GameView.prototype.start = function () {
//   this.lastTime = 0;
//   //start the animation
//   requestAnimationFrame(this.animate.bind(this));
// };
//
// GameView.prototype.animate = function(time){
//   const timeDelta = time - this.lastTime;
//
//   this.game.moveObject(timeDelta);
//   this.game.draw(this.ctx);
//   this.lastTime = time;
//
//   //every call to animate requests causes another call to animate
//   requestAnimationFrame(this.animate.bind(this));
// };
