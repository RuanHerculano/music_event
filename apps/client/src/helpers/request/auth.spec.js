import * as MockAPI from "../../../test/helpers/api";
import AuthAPI from "./auth";
import Session from "../auth";

describe("auth requests", () => {
  let Auth;

  beforeEach(() => {
    MockAPI.setResponse({});
    jest.spyOn(AuthAPI.prototype, "get");
    jest.spyOn(AuthAPI.prototype, "post");
    jest.spyOn(AuthAPI.prototype, "delete");

    Auth = new AuthAPI();
  });

  test("create", () => {
    Auth.create("test user");
    expect(AuthAPI.prototype.post).toBeCalledWith({ user: "test user" }, "", {
      headers: {}
    });
  });

  test("authenticate", () => {
    Auth.authenticate("test user");
    expect(AuthAPI.prototype.post).toBeCalledWith(
      {
        user: "test user"
      },
      "sign_in",
      {
        headers: {}
      }
    );
  });

  describe("logout", () => {
    beforeEach(() => {
      Auth.logout();
      jest.spyOn(Session.token, "destroy");
    });

    test("it deletes the session", () => {
      expect(AuthAPI.prototype.delete).toBeCalledWith("sign_out");
    });

    test("it removes the token from the session", () => {
      expect(Session.token.destroy).toBeCalled();
    });
  });
});
