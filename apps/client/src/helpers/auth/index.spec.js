import auth from "./index";
import * as token from "./token";

describe("Auth Helper index", () => {
  test("It returns an Object", () => {
    expect(typeof auth).toBe("object");
  });

  test("Auth's token property is the same as token", () => {
    expect(auth.token).toEqual(token);
  });
});
