<template>
  <div>
    <b-form @submit.prevent="onSubmit">
      <b-form-group
        id="type-selector"
        label="Type of the event"
        label-for="type-selector"
      >
        <b-form-radio
          v-model="eventType"
          @change="setEventType"
          name="event-type-radios"
          value="concert"
        >
          Concert
        </b-form-radio>
        <b-form-radio
          v-model="eventType"
          @change="setEventType"
          name="event-type-radios"
          value="festival"
        >
          Festival
        </b-form-radio>
      </b-form-group>

      <b-form-group id="name" label="Name" label-for="name">
        <b-form-input
          id="name"
          :value="active['name']"
          @input="processData($event, 'name')"
          required
        ></b-form-input>
      </b-form-group>

      <b-form-group id="location" label="Location" label-for="location">
        <b-form-input
          id="location"
          :value="active['location']"
          @input="processData($event, 'location')"
          required
        ></b-form-input>
      </b-form-group>

      <div>
        <label for="schedule">Scheduled day</label>
        <b-form-datepicker
          id="schedule"
          v-model="scheduleDay"
          :min="new Date()"
          class="mb-2"
        ></b-form-datepicker>
      </div>

      <div>
        <b-form-timepicker v-model="scheduleTime"></b-form-timepicker>
      </div>

      <div>
        <label for="genreSelect">Music genres</label>
        <b-form-select
          id="genreSelect"
          v-model="genreSelected"
          :options="genreOptions"
          :multiple="true"
        ></b-form-select>
      </div>

      <div>
        <label for="artistSelect">
          Artist<span v-if="isArtistMultiple">s</span>
        </label>
        <b-form-select
          id="artistSelect"
          v-model="artistSelected"
          :options="artistOptions"
          :multiple="isArtistMultiple"
        ></b-form-select>
      </div>

      <b-button type="submit" variant="primary">
        Save
      </b-button>

      <b-button :to="{ name: 'EventList' }">
        Back
      </b-button>
    </b-form>
  </div>
</template>

<script>
import { mapActions, mapGetters } from "vuex";

export default {
  created() {
    this.getGenreList();
    this.getArtistList();
  },
  data() {
    return {
      eventType: "concert",
      scheduleDay: this.todayToString(),
      scheduleTime: "12:00:00",
      genreSelected: [],
      artistSelected: []
    };
  },
  methods: {
    setEventType(event) {
      if (event === "festival") {
        this.artistSelected = [];
        return;
      }

      this.artistSelected = null;
    },
    onSubmit() {
      let artists = this.artistSelected;

      if (!this.isArtistMultiple) {
        artists = [artists];
      }

      const promises = [
        this.setData({ value: this.formatSchedule(), name: "schedule" }),
        this.setData({ value: this.genreSelected, name: "genre_ids" }),
        this.setData({ value: artists, name: "artist_ids" })
      ];

      Promise.all(promises).then(() =>
        this.save().then(() => this.$router.push({ name: "EventList" }))
      );
    },
    todayToString() {
      const date = new Date();
      let month = "" + (date.getMonth() + 1);
      let day = "" + date.getDate();
      const year = date.getFullYear();

      if (month.length < 2) {
        month = "0" + month;
      }

      if (day.length < 2) {
        day = "0" + day;
      }

      return [year, month, day].join("-");
    },
    formatSchedule() {
      const splitedDate = this.scheduleDay.split("-");
      const splitedTime = this.scheduleTime.split(":");

      return new Date(
        splitedDate[0],
        Number(splitedDate[1]) - 1,
        splitedDate[2],
        splitedTime[0],
        splitedTime[1],
        splitedTime[2]
      );
    },
    processData(value, name) {
      this.setData({ value, name });
    },
    ...mapActions({
      save: "events/save",
      setData: "events/setData",
      resetActive: "events/resetActive",
      getGenreList: "genres/list",
      getArtistList: "artists/list"
    })
  },
  computed: {
    isArtistMultiple() {
      return this.eventType === "festival";
    },
    genreOptions() {
      if (!this.genres) {
        return [];
      }

      return this.genres.map(genre => ({ value: genre.id, text: genre.name }));
    },
    artistOptions() {
      if (!this.artists) {
        return [];
      }

      return this.artists.map(artist => ({
        value: artist.id,
        text: artist.name
      }));
    },
    ...mapGetters({
      active: "events/active",
      genres: "genres/list",
      artists: "artists/list"
    })
  }
};
</script>
