  
import React from 'react';
import * as Minesweeper from '/minesweeper';
import Board from './board'
import Tile from './tile'

class Game extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            board: new Minesweeper.Board(10, 10)
        }
        this.updateGame = this.updateGame.bind(this)
    }

    updateGame() {
        
    }

    render() {
        return (
        <div>
        <Board currentBoard={this.state.board} onUpdate={this.updateGame}>
        </Board>
        </div>
        )
    }
}

export default Game