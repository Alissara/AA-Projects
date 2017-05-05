const View = require("./ttt-view");
const Game = require('../../solution/game');

$( () => {
  const $el = $(".ttt");
  const game = new Game();
  new View(game, $el);
});
