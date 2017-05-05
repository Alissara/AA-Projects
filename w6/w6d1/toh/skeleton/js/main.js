const View = require("./toh-view");
const Game = require("./game");

$( () => {
  const rootEl = $('.toh');
  const game = new Game();
  new View(game, rootEl);
});
