import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from "./frontend/store/store"
import {receiveTodo, receiveTodos, removeTodo} from "./frontend/actions/todo_actions"
import { receiveStep, receiveSteps, removeStep } from "./frontend/actions/step_actions"



document.addEventListener("DOMContentLoaded", () => {
  const root = document.getElementById("content");
  const store = configureStore();
  window.receiveTodos = receiveTodos
  window.receiveTodo = receiveTodo
  window.removeTodo = removeTodo
  window.receiveStep = receiveStep
  window.receiveSteps = receiveSteps
  window.removeStep = removeStep
  window.store = store;
  ReactDOM.render(<h1>It's working</h1>, root);
})