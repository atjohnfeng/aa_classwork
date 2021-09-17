import { RECEIVE_STEP, RECEIVE_STEPS, REMOVE_STEP } from "../actions/step_actions";

const initialState = {};

export const stepsReducer = (state = initialState, action) => {
    Object.freeze(state);
    const newState = Object.assign({}, state);

    switch (action.type) {
        case RECEIVE_STEPS:
            action.steps.forEach(step => {
                newState[step.id] = step;
            })
            return newState;

        case RECEIVE_STEP:
            newState[action.step.id] = action.step;
            return newState;

        case REMOVE_STEP:
            delete newState[action.step.id];
            return newState;

        default:
            return state;
    }
}

export default stepsReducer;