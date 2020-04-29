import axios from "axios";
import Interceptors from "../interceptors";

const API_URL = process.env.VUE_APP_API_URL;

let instance;

export default () => {
  if (instance) {
    return instance;
  }

  instance = axios.create({
    baseURL: API_URL
  });

  instance.interceptors.response.use(response => response, Interceptors.token);

  return instance;
};
