<template>
  <div>
    <b-button :to="{ name: 'CreateEvent' }">Create event</b-button>

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
  created() {
    this.getList();
  },
  methods: {
    ...mapActions({
      getList: "events/list"
    })
  },
  computed: {
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
      events: "events/list"
    })
  },
  components: {
    EventItem
  }
};
</script>
