import React from "react";
import ReactDOM from "react-dom";
import { fetchAllPokemon } from "../frontend/util/api_util";
import { receiveAllPokemon } from "../frontend/actions/pokemon_actions";

document.addEventListener("DOMContentLoaded", () => {
  const rootEl = document.getElementById('root');
  window.fetchAllPokemon = fetchAllPokemon;
  window.receiveAllPokemon = receiveAllPokemon;
  ReactDOM.render(<h1>Pokedex</h1>, rootEl);
})