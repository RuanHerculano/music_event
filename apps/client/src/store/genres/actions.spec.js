import * as actions from "./actions";
import AuthAPI from "../../helpers/request/auth";
import * as MockAPI from "../../../test/helpers/api";

describe("auth actions", () => {
  describe("register", () => {
    let user;

    beforeEach(() => {
      user = "test user";
      MockAPI.setResponse({});
      jest.spyOn(AuthAPI.prototype, "create");
      actions.register({}, user);
    });

    test("it calls AuthAPI create", () => {
      expect(AuthAPI.prototype.create).toBeCalledWith(user);
    });
  });

  describe("logout", () => {
    beforeEach(() => {
      jest.spyOn(AuthAPI.prototype, "logout");
      MockAPI.setResponse({});
      actions.logout();
    });

    test("it calls AuthAPI logout", () => {
      expect(AuthAPI.prototype.logout).toBeCalled();
    });
  });
});
