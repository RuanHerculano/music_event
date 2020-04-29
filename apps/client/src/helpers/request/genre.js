import API from "./api";

export default class Genres extends API {
  constructor() {
    super("v1/genre");
  }

  list(page = 0, per = 999) {
    return this.get("", {
      params: {
        per,
        page
      }
    });
  }

  save(genre) {
    return this.post({ genre });
  }
}
