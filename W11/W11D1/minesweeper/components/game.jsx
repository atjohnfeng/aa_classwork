  
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

    updateGame(tile, bool) {
        if (bool){
            tile.toggleFlag();
        } else {
            tile.explore();
        }
        this.setState({board: this.state.board})
    }

    end(){
        if (this.state.board.lost()){
            return <div>YOU LOST IT ALL</div>
        } else if (this.state.board.won()){
            return <div>YOU WON</div>
        }
    }


    render() {
        return (
        <div>
            <h1>MINESWEEPER</h1>
            {this.end()}
            <Board currentBoard={this.state.board} updateGame={this.updateGame} />
        </div>
        )
    }
}

export default Game