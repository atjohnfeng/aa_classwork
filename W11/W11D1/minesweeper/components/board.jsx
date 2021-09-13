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
                            return <Tile updateGame={this.props.updateGame} name={tile} board={this.props.currentBoard} key={j} pos={[i,j]} bombed={tile.bombed ? true : false}/> 
                        })}
                    </div>
                    )
                })}

            </div>
        )
    }
}

export default Board;