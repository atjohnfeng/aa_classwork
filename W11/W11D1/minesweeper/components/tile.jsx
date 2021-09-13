import React from 'react';
import * as Minesweeper from '../minesweeper';

class Tile extends React.Component {
    constructor(props){
        super(props);
        this.state = {
            tile: new Minesweeper.Tile(this.props.board, this.props.pos),
            status: 'unexplored'
        }
        this.clickHandler = this.clickHandler.bind(this)
    }

    clickHandler(e){
        let flag = false;
        if (e.altKey) {
            flag = true;
        }
        this.props.updateGame(this.state.tile, flag);
    }

    checkElement(){
        console.log(this.state.tile.bombed);
        if (this.props.bombed && this.state.tile.explored) {
            return '💣'
        } else if (this.state.tile.flagged) {
            return '🚩'
        } else if (this.state.tile.explored) {
            if (this.state.tile.adjacentBombCount() > 0) {
                return this.state.tile.adjacentBombCount()
            } else {
                return this.state.tile.explore();
            }
        } else {
            return ''
        }
    }

    render() {
        return (
            <div onClick={this.clickHandler} className={`tile ${this.state.status}`}>
                {this.checkElement()}    
            </div>
        )
    }
}

export default Tile;