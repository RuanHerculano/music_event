import API from "./api";

export default class Events extends API {
  constructor() {
    super("v1/event");
  }

  list(page = 0, per = 999) {
    return this.get("", {
      params: {
        per,
        page
      }
    });
  }

  save(event) {
    return this.post({ event });
  }
}
