import { RECEIVE_TODO, RECEIVE_TODOS, REMOVE_TODO } from "../actions/todo_actions";

const initialState = {};

export const todosReducer = (state = initialState, action) => {
  Object.freeze(state);
  const newState = Object.assign({}, state);

  switch (action.type) {
    case RECEIVE_TODOS:
      action.todos.forEach(todo => {
        newState[todo.id] = todo;
      })
      return newState;

    case RECEIVE_TODO:
      newState[action.todo.id] = action.todo;
      return newState;

    case REMOVE_TODO:
      delete newState[action.todo.id];
      return newState;
      
    default:
      return state;
  }
}

export default todosReducer;