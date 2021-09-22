import * as SessionApiUtil from '../util/session_api_util';

export const RECEIVE_CURRENT_USER = 'RECEIVE_CURRENT_USER';
export const LOGOUT_CURRENT_USER = 'LOGOUT_CURRENT_USER';
export const SESSION_RECEIVE_ERRORS = 'SESSION_RECEIVE_ERRORS';

const receiveCurrentUser = user => {
    return {
        type: RECEIVE_CURRENT_USER,
        user
    }
}

const logoutCurrentUser = () => {
    return {
        type: LOGOUT_CURRENT_USER
    }
}

const receiveErrors = errors => {
    return {
        type: SESSION_RECEIVE_ERRORS,
        errors
    }
}

export const signup = user => dispatch => (
    SessionApiUtil.signup(user).then(user => (
        dispatch(receiveCurrentUser(user))
    ), errors => (
        dispatch(receiveErrors(errors.responseJSON))
    ))
)

export const login = user => dispatch => (
    SessionApiUtil.login(user).then(user => (
        dispatch(receiveCurrentUser(user))
    ), errors => (
        dispatch(receiveErrors(errors.responseJSON))
    ))
)

export const logout = () => dispatch => (
    SessionApiUtil.logout().then(payload => (
        dispatch(logoutCurrentUser())
    ))
)