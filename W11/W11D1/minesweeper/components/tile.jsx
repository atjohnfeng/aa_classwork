import React from 'react';
import * as Minesweeper from '../minesweeper';

class Tile extends React.Component {
    constructor(props){
        super(props);
        this.state = {
            tile: new Minesweeper.Tile(this.props.board, this.props.pos),
            bombed: false,
            explored: false,
            flagged: false
        }
        this.clickHandler = this.clickHandler.bind(this)
    }

    clickHandler(){
        let newTile = this.state.tile
        // console.log(newTile)
        newTile.explore();
        this.setState({explored: true})
    }

    checkElement(){
        if (this.state.explored){

        } else {

        }
    }

    render() {
        return (
            <div onClick={this.clickHandler}>
                {this.checkElement()}    
            </div>
        )
    }
}

export default Tile;