import React from 'react';
import TodoDetailView from './todo_detail_view';

class TodoListItem extends React.Component {
  constructor(props) {
    super(props)
    this.markDone = this.markDone.bind(this)
    this.handleDetails = this.handleDetails.bind(this)
    this.state = {
      details: false
    }
  }


  markDone(e) {
    e.preventDefault();
    if (this.props.todo.done) {
      const newTodo = Object.assign({}, this.props.todo, {done: false})
      this.props.receiveTodo(newTodo)
    } else {
      const newTodo = Object.assign({}, this.props.todo, {done: true})
      this.props.receiveTodo(newTodo)
    }
  }

  handleDetails() {
    if (this.state.details) {
      this.setState({details: false})
    } else {
      this.setState({ details: true })
    }
  }

  render() {
    return (
      <li>
        <p onClick={this.handleDetails}>
          {this.props.todo.title}
        </p>
          {this.props.todo.done ? <button onClick={this.markDone}>Done: Mark Undone?</button> : <button onClick={this.markDone}>Undone: Mark Done?</button>}
          { this.state.details ? <TodoDetailView todo={this.props.todo} removeTodo={this.props.removeTodo} /> : null }
      </li>
    )
  }
}

export default TodoListItem