import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from "./store/store"
import {receiveTodo, receiveTodos, removeTodo, fetchTodos} from "./actions/todo_actions"
import {receiveStep, receiveSteps, removeStep} from "./actions/step_actions"
import Root from './components/root'
// import {allTodos} from "./reducers/selectors"
import * as APIUtil from "./util/todo_api_util"


document.addEventListener("DOMContentLoaded", () => {
  const root = document.getElementById("root");
  const store = configureStore();
  // window.receiveTodos = receiveTodos
  // window.receiveTodo = receiveTodo
  // window.removeTodo = removeTodo
  // window.receiveStep = receiveStep
  // window.receiveSteps = receiveSteps
  // window.removeStep = removeStep
  // window.allTodos = allTodos
  window.fetchTodos = fetchTodos
  window.getTodos = APIUtil.getTodos
  window.postTodo = APIUtil.postTodo
  window.store = store;
  ReactDOM.render(<Root store={store}/>, root);
})