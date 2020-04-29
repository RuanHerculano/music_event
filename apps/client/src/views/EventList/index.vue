<template>
  <div>
    <b-button :to="{ name: 'CreateEvent' }">Create event</b-button>
    <b-button @click="fetch('festivals')">Festivals</b-button>
    <b-button @click="fetch('concerts')">Concerts</b-button>

    <header>
      <div>
        <b-row>
          <b-col>
            <label for="searchGenreSelect">Search music genres</label>
            <b-form-select
              id="searchGenreSelect"
              v-model="searchGenreSelected"
              :options="genreOptions"
              :multiple="true"
            ></b-form-select>
          </b-col>
          <b-col>
            <label for="excludeGenreSelect">Exclude music genres</label>
            <b-form-select
              id="excludeGenreSelect"
              v-model="excludeGenreSelected"
              :options="genreOptions"
              :multiple="true"
            ></b-form-select>
          </b-col>
        </b-row>
      </div>
      <b-button @click="fetch(type)">Filter</b-button>
    </header>

    <b-card class="mb-2" v-for="(day, index) in eventsByDateArray" :key="index">
      <b-card-header>
        {{ day.date | moment("MM/DD/YYYY") }}
      </b-card-header>

      <b-card-body>
        <b-card-text v-for="event in day.events" :key="event.id + Date.now()">
          <EventItem :event="event" />
        </b-card-text>
      </b-card-body>
    </b-card>
  </div>
</template>

<script>
import { mapActions, mapGetters } from "vuex";
import EventItem from "@/views/EventList/components/EventItem";

export default {
  data() {
    return {
      type: "",
      searchGenreSelected: [],
      excludeGenreSelected: []
    };
  },
  created() {
    this.getList();
    this.getGenreList();
  },
  methods: {
    fetch(type) {
      this.type = type;
      const filter = {
        include_genre: this.searchGenreSelected,
        exclude_genre: this.excludeGenreSelected
      };

      if (!this.type) {
        return this.getList(filter);
      }

      if (this.type === "festivals") {
        return this.getFestivals(filter);
      }

      return this.getConcerts(filter);
    },
    ...mapActions({
      getList: "events/list",
      getFestivals: "events/listFestivals",
      getConcerts: "events/listConcerts",
      getGenreList: "genres/list"
    })
  },
  computed: {
    genreOptions() {
      if (!this.genres) {
        return [];
      }

      return this.genres.map(genre => ({ value: genre.id, text: genre.name }));
    },
    eventsByDate() {
      return this.events.reduce((groups, event) => {
        const date = event.schedule.split("T")[0];

        if (!groups[date]) {
          groups[date] = [];
        }

        groups[date].push(event);

        return groups;
      }, {});
    },
    eventsByDateArray() {
      return Object.keys(this.eventsByDate).map(date => {
        return {
          date,
          events: this.eventsByDate[date]
        };
      });
    },
    ...mapGetters({
      genres: "genres/list",
      events: "events/list"
    })
  },
  components: {
    EventItem
  }
};
</script>
