import { combineReducers } from "redux";
import pokemonReducer from "./pokemonReducer";

const entityReducer = combineReducers ({
    pokemon: pokemonReducer
});

export default entityReducer;