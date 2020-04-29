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
          name="event-type-radios"
          value="concert"
        >
          Concert
        </b-form-radio>
        <b-form-radio
          v-model="eventType"
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
    </b-form>
  </div>
</template>

<script>
import { mapActions, mapGetters } from "vuex";

export default {
  data() {
    return {
      eventType: "concert",
      scheduleDay: this.todayToString(),
      scheduleTime: "12:00:00"
    };
  },
  methods: {
    onSubmit() {
      this.setData({ value: this.formatSchedule(), name: "schedule" }).then(
        () => {
          console.log("submit", this.active);
        }
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
      setData: "events/setData",
      resetActive: "events/resetActive"
    })
  },
  computed: {
    ...mapGetters({
      active: "events/active"
    })
  }
};
</script>
