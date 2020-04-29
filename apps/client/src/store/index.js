import Vue from "vue";
import Vuex from "vuex";

import auth from "./auth";
import artists from "./artists";
import genres from "./genres";
import events from "./events";

Vue.use(Vuex);

export default new Vuex.Store({
  modules: {
    auth,
    artists,
    genres,
    events
  }
});
