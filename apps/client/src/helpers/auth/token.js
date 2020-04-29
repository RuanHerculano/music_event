const KEY = process.env.VUE_APP_AUTH_TOKEN_NAME;

const storage = window.localStorage;

export const set = token => storage.setItem(KEY, JSON.stringify(token));

export const get = () => {
  if (navigator.cookieEnabled) {
    const token = JSON.parse(storage.getItem(KEY));
    if (!token) {
      return false;
    }

    const { accessToken, ...newToken } = token;

    newToken["access-token"] = accessToken;

    return newToken;
  }

  return false;
};

export const has = () => {
  const token = get();
  return token;
};

export const destroy = () => {
  storage.removeItem(KEY);
};
