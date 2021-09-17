import React from 'react';
import TodoListItem from '../todo_list/todo_list_item';
import TodoForm from '../todo_list/todo_form'
import TodoDetailView from '../todo_list/todo_detail_view';

class ToDoList extends React.Component {
  constructor(props) {
    super(props)
  }

  render() {
    return (
      <div>
        <ul>
          {
            this.props.todos.map((todo, i) => <TodoListItem removeTodo={this.props.removeTodo} receiveTodo={this.props.receiveTodo} key={i} todo ={todo}/>)
          }
        </ul>
        <TodoForm receiveTodo={this.props.receiveTodo}/>
      </div>
    )
  }
}

export default ToDoList