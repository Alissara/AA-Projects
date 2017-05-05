/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// identity function for calling harmony imports with the correct context
/******/ 	__webpack_require__.i = function(value) { return value; };
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, {
/******/ 				configurable: false,
/******/ 				enumerable: true,
/******/ 				get: getter
/******/ 			});
/******/ 		}
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = 4);
/******/ })
/************************************************************************/
/******/ ([
/* 0 */
/***/ (function(module, exports) {

const Util = {
  inherits (childClass, parentClass) {
    function Surrogate () {}
    Surrogate.prototype = parentClass.prototype;
    childClass.prototype = new Surrogate();
    childClass.prototype.constructor = childClass;
  },

  randomVec (length) {
    const deg = 2 * Math.PI * Math.random();
    return Util.scale([Math.sin(deg), Math.cos(deg)], length);
  },

  scale (vec, m) {
    return [vec[0] * m, vec[1] * m];
  }
};

module.exports = Util;


/***/ }),
/* 1 */
/***/ (function(module, exports, __webpack_require__) {

const Asteroid = __webpack_require__(3);
const Util = __webpack_require__(0);

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


/***/ }),
/* 2 */
/***/ (function(module, exports) {

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


/***/ }),
/* 3 */
/***/ (function(module, exports, __webpack_require__) {

const Util = __webpack_require__(0);
const MovingObject = __webpack_require__(5);

const Asteroid = function(options = {}) {
  options.pos = options.pos;
  options.vel = Util.randomVec(5);
  options.radius = 20;
  options.color = 'blue';

  MovingObject.call(this, options);
};

Util.inherits(Asteroid, MovingObject);




module.exports = Asteroid;


/***/ }),
/* 4 */
/***/ (function(module, exports, __webpack_require__) {

const Game = __webpack_require__(1);
const GameView = __webpack_require__(2);

document.addEventListener("DOMContentLoaded", function() {
  const canvasEl = document.getElementById("game-canvas");
  canvasEl.width = Game.DIM_X;
  canvasEl.height = Game.DIM_Y;

  const ctx = canvasEl.getContext("2d");
  const game = new Game();
  new GameView(game, ctx).start();
});


/***/ }),
/* 5 */
/***/ (function(module, exports, __webpack_require__) {

const Util = __webpack_require__(0);

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


/***/ })
/******/ ]);