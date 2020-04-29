import * as AuthToken from "./token";

describe("helper auth token", () => {
  let token;

  beforeEach(() => {
    navigator.cookiesEnabled = true;
    token = "6d1255d5-89f8-4f6c-8e74-abdba72bf038";
  });

  afterEach(() => {
    AuthToken.destroy();
  });

  test("return correct token", () => {
    AuthToken.set(token);
    expect(AuthToken.get()).toEqual(token);
  });

  test("token does not exists", () => {
    expect(AuthToken.has()).toBeFalsy();
  });

  test("token exists", () => {
    AuthToken.set(token);
    expect(AuthToken.has()).toBeTruthy();
  });
});
