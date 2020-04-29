import * as types from "./types";
import GenreAPI from "../../helpers/request/genre";

const Genre = new GenreAPI();

export const list = ({ commit }) =>
  Genre.list().then(response => commit(types.SET_LIST, response.data.genres));

export const setData = ({ commit }, data) => commit(types.SET_DATA, data);

export const resetActive = ({ commit }) => commit(types.RESET_ACTIVE);

export const save = ({ state, dispatch }) =>
  Genre.save(state.active).then(() => {
    dispatch("list");
    dispatch("resetActive");
  });
