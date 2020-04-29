import * as types from "./types";
import ArtistAPI from "../../helpers/request/artist";

const Artist = new ArtistAPI();

export const list = ({ commit }) =>
  Artist.list().then(response => commit(types.SET_LIST, response.data.artists));

export const setData = ({ commit }, data) => commit(types.SET_DATA, data);

export const resetActive = ({ commit }) => commit(types.RESET_ACTIVE);

export const save = ({ state, dispatch }) =>
  Artist.save(state.active).then(() => {
    dispatch("list");
    dispatch("resetActive");
  });
