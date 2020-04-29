import * as types from "./types";

export const state = {
  active: {}
};

export const mutations = {
  [types.RESET_ACTIVE](state) {
    state.active = {};
  },
  [types.SET_DATA](state, { name, value }) {
    state.active[name] = value;
  }
};
