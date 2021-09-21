import React from 'react';
import ReactDOM from 'react-dom';
import { configureStore } from 'redux'

document.addEventListener('DOMContentLoaded', () => {
    const root = document.getElementById('root');
    const store = configureStore();
    
    ReactDOM.render(<h1>Hello</h1>, root);
})