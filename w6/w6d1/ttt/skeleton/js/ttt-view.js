class View {
  constructor(game, $el) {
    this.game = game;
    this.$el = $el;
    this.setupBoard();
    this.bindEvents();
  }

  bindEvents() {
    this.$el.on("click", "li", (e => {
      let $sq = $(e.currentTarget);
      this.makeMove($sq);
    }));
  }

  makeMove($square) {
    let mark = this.game.currentPlayer;
    let pos = $square.data("pos");
    this.game.playMove(pos);
    $square.addClass(mark);
    $square.text(mark);

    if (this.game.isOver()) {
      this.$el.off("click");

      let winner = this.game.winner();

      if (winner) {
        this.$el.addClass(`winner-${winner}`);
      }
    }
  }

  setupBoard() {
    const $ul = $("<ul>");
    $ul.addClass("cf");

    for (let i = 0; i < 3; i++) {
      for (let j = 0; j < 3; j++) {
        const $li = $("<li>");
        $li.data("pos", [i, j]);
        $ul.append($li);
      }
    }

    this.$el.append($ul);

    $("li").hover(
      function(e) {
        let sq = e.currentTarget;
        $(sq).toggleClass("hover_in");
      },
      function(e) {
        let sq = e.currentTarget;
        $(sq).toggleClass("hover_in");
      }
    );
  }


}

module.exports = View;
