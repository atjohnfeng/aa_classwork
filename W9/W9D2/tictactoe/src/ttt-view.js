class View {
  constructor(game, el) {
    this.game = game;
    this.el = el;
    this.handleClick = this.handleClick.bind(this);
    this.setupBoard();
    this.bindEvents();
  }

  setupBoard() {
    const board = document.createElement('ul');

    for (let i = 0; i < 3; i++) {
      for (let j = 0; j < 3; j++) {
        const grid = document.createElement('li');
        grid.dataset.pos = JSON.stringify([i,j]);
        board.append(grid);
      }
    }
    this.el.append(board);
  }
  
  bindEvents() {
    this.el.addEventListener('click', this.handleClick)
  }

  handleClick(e) {
    const el = e.target;
    if (el.nodeName === "LI") {
      this.makeMove(el);
    }
  }

  makeMove(square) {
    square.innerText = this.game.current_player;
  }

}

module.exports = View;