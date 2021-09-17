import { combineReducers } from "redux";
import entityReducer from "./entityReducer";

const rootReducer = combineReducers ({
    entities: entityReducer
});

export default rootReducer;