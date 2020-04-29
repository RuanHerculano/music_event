import API from "./api";

export default class Artists extends API {
  constructor() {
    super("v1/artist");
  }

  list(page = 0, per = 999) {
    return this.get("", {
      params: {
        per,
        page
      }
    });
  }

  save(artist) {
    return this.post({ artist });
  }
}
