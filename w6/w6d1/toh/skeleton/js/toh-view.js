class View {
  constructor(game, $el) {
    this.game = game;
    this.$el = $el;
    this.setupTowers();
  }

  setupTowers() {
    for (let i = 1; i <= 3; i++) {
      let $ul = $("<ul>");
      $ul.addClass('cf');
      $ul.data("tower", i);
      this.$el.append($ul);
    }

    for (let j = 1; j <= 3; j++){
      let $ul = $("ul").first();
      let $li = $("<li>");
      $li.addClass(`d${j}`);
      $ul.append($li);
    }

  }



}

module.exports = View;
