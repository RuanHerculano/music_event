import * as types from "./types";

const defaultActive = {
  name: "",
  schedule: new Date(),
  location: ""
};

export const state = {
  active: { ...defaultActive },
  list: []
};

export const mutations = {
  [types.SET_LIST](state, list) {
    state.list = list;
  },
  [types.RESET_ACTIVE](state) {
    state.active = { ...defaultActive };
  },
  [types.SET_DATA](state, { name, value }) {
    state.active[name] = value;
  }
};
