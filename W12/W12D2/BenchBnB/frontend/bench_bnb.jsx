import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';

const store = configureStore();

document.addEventListener('DOMContentLoaded', () => {
    const root = document.getElementById('root');
    window.getState = store.getState;
    
    ReactDOM.render(<h1>Hello</h1>, root);
})