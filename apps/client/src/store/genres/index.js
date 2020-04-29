import * as actions from "./actions";
import { mutations, state } from "./mutations";
import * as getters from "./getters";

export default {
  namespaced: true,
  actions,
  mutations,
  state,
  getters
};
