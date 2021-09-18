import { RECEIVE_ALL_POKEMON } from '../actions/pokemon_actions';

const initialState = {};

const pokemonReducer = (state = initialState, action) => {
  Object.freeze(state);
  const newState = Object.assign({}, state);

  switch (action.type) {
    case RECEIVE_ALL_POKEMON:
      // let nextState = {};
      // action.pokemon.forEach(pokemon => {
      //   nextState[pokemon.id] = pokemon;
      // })
      return Object.assign(newState, action.pokemon);
    default:
      return state;
  }
}

export default pokemonReducer;