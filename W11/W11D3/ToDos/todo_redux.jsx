import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from "./frontend/store/store"
import {receiveTodo, receiveTodos, removeTodo} from "./frontend/actions/todo_actions"
import { receiveStep, receiveSteps, removeStep } from "./frontend/actions/step_actions"
import Root from './frontend/components/root'
import {allTodos} from "./frontend/reducers/selectors"


document.addEventListener("DOMContentLoaded", () => {
  const root = document.getElementById("content");
  const store = configureStore();
  window.receiveTodos = receiveTodos
  window.receiveTodo = receiveTodo
  window.removeTodo = removeTodo
  window.receiveStep = receiveStep
  window.receiveSteps = receiveSteps
  window.removeStep = removeStep
  window.allTodos = allTodos
  window.store = store;
  ReactDOM.render(<Root store={store}/>, root);
})