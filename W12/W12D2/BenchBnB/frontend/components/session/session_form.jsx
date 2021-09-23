import React from 'react';
import { Link } from 'react-router-dom';

class SessionForm extends React.Component {
    constructor(props){
        super(props)
        this.state = {
            username: '',
            password: ''
        };
        this.handleSubmit = this.handleSubmit.bind(this);
    }

    handleSubmit(e) {
        e.preventDefault();
        const user = Object.assign({}, this.state);
        this.props.processForm(user);
    }

    update(type) {
        return (e) => {
            this.setState({ [type]: e.target.value })
        }
    }

    render() {
        return (
            <div>
                <h3>{this.props.formType}</h3>
                <form onSubmit={this.handleSubmit}>
                    <label>Username:
                        <input
                            type="text"
                            value={this.state.username}
                            onChange={this.update("username")}>
                        </input>
                    </label>
                    <br />
                    <label>Password:
                        <input
                            type="password"
                            value={this.state.password}
                            onChange={this.update("password")}>
                        </input>
                    </label>
                    <br />
                    <button type="submit">{this.props.formType}</button>
                </form>
            </div>
        )
    }
}

export default SessionForm;