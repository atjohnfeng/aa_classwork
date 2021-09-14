import React from 'react';
import Tile from './tile'

class Board extends React.Component{
    constructor(props){
        super(props)
    }
    render(){
        return (
            <div className="grid">
                {this.props.currentBoard.grid.map((tiles, i) =>{
                    return(
                    <div key={i} className="row">
                        {tiles.map((tile, j) =>{
                            return <Tile updateGame={this.props.updateGame} tile={tile} board={this.props.currentBoard} key={j}/> 
                        })}
                    </div>
                    )
                })}

            </div>
        )
    }
}

export default Board;