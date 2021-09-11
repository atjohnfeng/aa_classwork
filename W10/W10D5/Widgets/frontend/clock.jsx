import React from 'react';

class Clock extends React.Component {
    constructor(){
        super();
        this.state = {
            date: new Date()
        }
        this.tick = this.tick.bind(this)
    }

    tick(){
        this.setState({date: new Date()})
    }

    componentDidMount(){
        this.ticker = setInterval(this.tick, 1000)
    }

    componentWillUnmount(){
        clearInterval(this.ticker)
    }

    render (){
        return (
        <div className="clock">
            <h1>Clock</h1>
            <div className="time">
                <div id="time">
                    <li>Time:</li>
                    <li>{`${this.state.date.getHours()}:${this.state.date.getMinutes()}:${this.state.date.getSeconds()}`}</li>
                </div>
                <div id="date">
                    <li>Date:</li>
                    <li>{`${this.state.date.toDateString()}`}</li>
                </div>
            </div>
        </div>
        )
    }

}

export default Clock