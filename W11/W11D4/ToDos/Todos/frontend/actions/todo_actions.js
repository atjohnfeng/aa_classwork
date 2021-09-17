export const RECEIVE_TODOS = "RECEIVE_TODOS";
export const RECEIVE_TODO = "RECEIVE_TODO";
export const REMOVE_TODO = "REMOVE_TODO";
export const RETURN_ALL_TODOS = "RETURN_ALL_TODOS"
import * as APIUtil from '../util/todo_api_util'

export const receiveTodos = (todos) => {
  return {
    type: RECEIVE_TODOS,
    todos,
  };
};

export const receiveTodo = (todo) => {
  return {
    type: RECEIVE_TODO,
    todo,
  };
};

export const removeTodo = (todo) => {
  return {
    type: REMOVE_TODO,
    todo,
  }
}

export const fetchAllTodos = (todos) => {
  return {
    type: RETURN_ALL_TODOS,
    todos
  }
}

export const createTodo = todo => dispatch => {
  return APIUtil.postTodo(todo)
    .then(todo => dispatch(receiveTodo(todo)));
};

export const fetchTodos = todos => dispatch => {
  return APIUtil.getTodos(todos)
    .then(todos => dispatch(fetchAllTodos(todos)));
};
