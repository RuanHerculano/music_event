import Session from "../auth";
import API from "./api";

export default class Auth extends API {
  constructor() {
    super("auth");
  }

  create({ email, password, passwordConfirmation }) {
    return this.post(
      { email, password, password_confirmation: passwordConfirmation },
      ""
    );
  }

  authenticate(user) {
    return this.post(user, "sign_in", { headers: {} });
  }

  logout() {
    return this.delete("sign_out").then(() => Session.token.destroy());
  }
}
