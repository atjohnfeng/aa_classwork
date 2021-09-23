import React from 'react';
import GreetingContainer from './greeting/greeting_container';

const App = () => {
    return (
        <div>
            <header>
                <h1>BenchBnB</h1>
                <GreetingContainer />
            </header>

            <Route path="/login" component={LoginFormContainer} />
            <Route path="/signup" component={SignupFormContainer} />
        </div>
    )
};

export default App;