import Auth from "../../auth";
import instance from "./instance";

const defaultConfig = () => ({
  headers: {
    "Content-Type": "application/json",
    ...Auth.token.get()
  }
});

export default class API {
  constructor(path) {
    this.path = path;

    this.axios = instance();
  }

  get(resource = "", config = {}) {
    return this.axios.get(
      `${this.path}/${resource}`,
      Object.assign({}, defaultConfig(), config)
    );
  }

  put(resource = "", data, config = {}) {
    return this.axios.put(
      `${this.path}/${resource}`,
      data,
      Object.assign({}, defaultConfig(), config)
    );
  }

  post(data, resource = "", config = {}) {
    const path = `${this.path}/${resource}`;

    return this.axios.post(
      path,
      data,
      Object.assign({}, defaultConfig(), config)
    );
  }

  delete(resource = "", config = {}) {
    return this.axios.delete(
      `${this.path}/${resource}`,
      Object.assign({}, defaultConfig(), config)
    );
  }
}
