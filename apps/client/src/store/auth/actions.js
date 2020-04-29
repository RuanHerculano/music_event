import AuthAPI from "../../helpers/request/auth";
import Session from "../../helpers/auth";

const Auth = new AuthAPI();

export const login = (_, user) =>
  Auth.authenticate(user).then(response => {
    const { headers } = response;

    const token = {
      accessToken: headers["access-token"],
      uid: headers.uid,
      client: headers.client
    };

    Session.token.set(token);
    return response;
  });

export const isLogged = () => Session.token.has();

export const logout = () => Auth.logout();

export const save = (_, user) => Auth.create(user);
