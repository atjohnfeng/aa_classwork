import React from 'react';

class Tile extends React.Component {
    constructor(props) {
        super(props)
        this.clickHandler = this.clickHandler.bind(this)
    }

    clickHandler(e){
        let flag = false;
        if (e.altKey) {
            flag = true;
        }
        this.props.updateGame(this.props.tile, flag);
    }

    render() {
        let status = 'unexplored';
        let icon = '';
        if (this.props.tile.explored) {
            if (this.props.tile.bombed) {
                status = 'bombed';
                icon = '💣';
            } else {
                status = 'explored';
                if (this.props.tile.adjacentBombCount() > 0) {
                    icon = this.props.tile.adjacentBombCount();
                } 
            }
        } else if (this.props.tile.flagged) {
            console.log('hi')
            status = 'flagged';
            icon = '🚩';
        }
        return (
            <div onClick={this.clickHandler} className={`tile ${status}`}>
                {icon}    
            </div>
        )
    }
}

export default Tile;