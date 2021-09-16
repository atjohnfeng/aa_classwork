import React from 'react'

class TodoForm extends React.Component {
  constructor(props) {
    super(props)
    this.state = {
      id: new Date().getTime(),
      title: "",
      details: "",
      done: false
    }
    this.handleTitle = this.handleTitle.bind(this)
    this.handleDetails = this.handleDetails.bind(this)
    this.handleSubmit = this.handleSubmit.bind(this)
  }

  handleTitle(e) {
    this.setState({title: e.target.value});
  }

  handleDetails(e) {
    this.setState({ details: e.target.value });
  }

  handleSubmit(e) {
    e.preventDefault();
    console.log(this.props.receiveTodo)
    this.props.receiveTodo(this.state)
    this.setState({ id: new Date().getTime(), title: "", details: ""})
  }

  render() {
    return (
      <form onSubmit={this.handleSubmit}>
        <label>Title: 
          <input onChange={this.handleTitle} type="text" value={this.state.title}/>
        </label>
        <label>Details:
          <input onChange={this.handleDetails} type="text" value={this.state.details} />
        </label>
        <button>Create new todo!</button>
      </form>
    )
  }
}

export default TodoForm;