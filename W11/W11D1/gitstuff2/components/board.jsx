import React from 'react';
import Tile from './tile'

class Board extends React.Component{
    constructor(props){
        super(props)
    }
    render(){
        // console.log(this.props)
        return (
            <div>
                {this.props.currentBoard.grid.map((tiles, i) =>{
                    return(
                    <div key={i}>
                        {tiles.map((tile, j) =>{
                            return <Tile onChange={this.props.updateGame} name={tile} board={this.props.currentBoard} key={j} pos={[i,j]}/>
                        })}
                    </div>
                    )
                })}

            </div>
        )
    }
}

export default Board;