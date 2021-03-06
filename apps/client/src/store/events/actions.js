import * as types from "./types";
import EventAPI from "../../helpers/request/event";

const Event = new EventAPI();

export const list = ({ commit }, filter) =>
  Event.list(filter).then(response =>
    commit(types.SET_LIST, response.data.events)
  );

export const listFestivals = ({ commit }, filter) =>
  Event.listFestivals(filter).then(response =>
    commit(types.SET_LIST, response.data.events)
  );

export const listConcerts = ({ commit }, filter) =>
  Event.listConcerts(filter).then(response =>
    commit(types.SET_LIST, response.data.events)
  );

export const setData = ({ commit }, data) => commit(types.SET_DATA, data);

export const resetActive = ({ commit }) => commit(types.RESET_ACTIVE);

export const save = ({ state, dispatch }) =>
  Event.save(state.active).then(() => dispatch("resetActive"));
