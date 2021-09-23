import React from 'react';
import { Link } from 'react-router-dom';


// {user, logout} deconstructing state
const Greeting = ({user, logout}) => {
    if (user) {
        return (
            <div>
                <p>Welcome {user.username}!</p>
                <button onClick={logout} value='Log Out'/>
            </div>
        )
    } else {
        return (
            <div>
                <Link to='/signup'>Sign Up</Link>
                <Link to='/login'>Log In</Link> 
            </div>
        )
    }
}

export default Greeting;