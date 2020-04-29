import { mutations } from "./mutations";

describe("auth mutations", () => {
  let state;

  beforeEach(() => {
    state = {
      user: {}
    };
  });

  test("SET_USER", () => {
    mutations.SET_USER(state, "test user");
    expect(state.user).toEqual("test user");
  });
});
