import React from "react";
import ReactDOM from "react-dom";
import { fetchAllPokemon } from "../frontend/util/api_util";
import { receiveAllPokemon } from "../frontend/actions/pokemon_actions";
import configureStore from "./store/store";

document.addEventListener("DOMContentLoaded", () => {
  const store = configureStore();

  window.getState = store.getState;
  window.dispatch = store.dispatch;

  const rootEl = document.getElementById('root');
  window.fetchAllPokemon = fetchAllPokemon;
  window.receiveAllPokemon = receiveAllPokemon;
  ReactDOM.render(<h1>Pokedex</h1>, rootEl);
})