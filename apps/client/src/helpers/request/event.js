import API from "./api";

export default class Events extends API {
  constructor() {
    super("v1/event");
  }

  list(filter, page = 0, per = 999) {
    return this.get("", {
      params: {
        per,
        page,
        ...filter
      }
    });
  }

  listFestivals(filter, page = 0, per = 999) {
    return this.get("festivals", {
      params: {
        per,
        page,
        ...filter
      }
    });
  }

  listConcerts(filter, page = 0, per = 999) {
    return this.get("concerts", {
      params: {
        per,
        page,
        ...filter
      }
    });
  }

  save(event) {
    return this.post({ event });
  }
}
