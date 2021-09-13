import React from 'react';
import { Board } from '../minesweeper';
import { Tile } from './tile';

class Game extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            board: new Board(10, 10)
        }
        this.updateGame = this.updateGame.bind(this)
    }

    updateGame() {

    }

    render() {
        return <Board currentBoard={this.state.board} onUpdate={this.updateGame}>
            <Tile />
        </Board>
    }
}

export default Game