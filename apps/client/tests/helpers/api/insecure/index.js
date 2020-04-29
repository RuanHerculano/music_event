import API from "../../../../src/helpers/request/api/insecure";

let response;
let error;

const methods = ["get", "put", "post", "delete", "query"];

const originalAPI = methods.map(method => ({
  [method]: API.prototype[method]
}));

const getPromise = (currentResponse = response, currentError = error) => {
  const promise = {};

  promise.then = callback => {
    if (!currentResponse) {
      throw new Error("you must call setResponse");
    }

    if (!currentResponse.data || currentResponse.data.errors) {
      currentError = currentResponse.data.errors;
      return getPromise(currentResponse, currentError);
    }

    if (currentResponse) {
      return getPromise(callback(currentResponse), currentError);
    }

    return getPromise(currentResponse, currentError);
  };

  promise.catch = callback => {
    if (currentError) {
      return getPromise(currentResponse, callback(currentError));
    }

    return getPromise(currentResponse, currentError);
  };

  response = null;
  error = null;

  return promise;
};

export const enable = () => {
  methods.forEach(method => (API.prototype[method] = () => getPromise()));
};

export const disable = () => {
  methods.forEach(method => (API.prototype[method] = originalAPI[method]));
};

export const setResponse = data => {
  if (data) {
    response = { data };
    return;
  }

  response = null;
};

export const setError = data => {
  error = data;
};

enable();

export default API;
