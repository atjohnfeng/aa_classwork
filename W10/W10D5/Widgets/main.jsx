import React from 'react';
import Clock from './frontend/clock';
import Tabs from './frontend/tabs';

const panes = [
    {title: 'one', content: 'I am the first'},
    {title: 'two', content: 'Second tab here'},
    {title: 'three', content: 'Third tab here'}
  ];
  

const Main = () => {
    return (
    <div id="main">
        <Clock/>
        <Tabs tabbies={panes}/> 
    
    </div>
    )
}


export default Main;
