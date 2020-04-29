import currentUser from "./getters";

describe("auth getters", () => {
  let state;

  beforeEach(() => {
    state = {
      user: "testUser"
    };
  });

  test("default", () => {
    expect(currentUser(state)).toEqual("testUser");
  });
});
