import auth from "../../auth";
import router from "../../../router";

export default error => {
  if (error.response.status !== 401) {
    return Promise.reject(error);
  }

  auth.token.destroy();
  router.push({ name: "Login" });

  return Promise.reject(error);
};
