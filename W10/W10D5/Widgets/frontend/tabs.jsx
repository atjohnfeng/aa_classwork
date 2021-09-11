import React from 'react';

class Tabs extends React.Component {
    constructor(props){
        super(props);
        this.state = {
            tabsIndex: 0
        }
        this.boundClicker = this.clicker.bind(this);
    }

    clicker(event){
        console.log(event.target.id)
        this.setState({ tabsIndex: event.target.id })
    }

    render (){
        return (
            <ul id="list-tabs">
                {this.props.tabbies.map((obj, i)=> {
                    return (
                        <li key={i} id={i} onClick={this.boundClicker} >
                            <h1 id={i}>{obj.title}</h1>
                        </li>
                    )
                
                })}
                <article>{this.props.tabbies[this.state.tabsIndex].content}</article>
            </ul>
        )
    }

}

export default Tabs