import React from 'react';
import ToDoListContainer from '../Todos/todo_list_container'

class TodoDetailView extends React.Component {
    constructor(props) {
        super(props)
        this.removeItem = this.removeItem.bind(this)
    }
    markDone(e) {
        e.preventDefault();
        if (this.props.todo.done) {
            const newTodo = Object.assign({}, this.props.todo, { done: false })
            this.props.receiveTodo(newTodo)
        } else {
            const newTodo = Object.assign({}, this.props.todo, { done: true })
            this.props.receiveTodo(newTodo)
        }
    }

    removeItem(e) {
        e.preventDefault();
        this.props.removeTodo(this.props.todo)
    }

    render() {
        return (
            <div>
                <p>
                    {this.props.todo.details}
                </p>
                <button onClick={this.removeItem}>Remove item.</button>
            </div>
        )
    }
}

export default TodoDetailView;