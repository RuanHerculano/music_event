<template>
  <div>
    <div>
      <b-navbar toggleable="lg" type="dark" variant="info">
        <b-navbar-brand :to="{ name: 'EventList' }">
          Music events
        </b-navbar-brand>

        <b-navbar-toggle target="nav-collapse"></b-navbar-toggle>

        <b-collapse id="nav-collapse" is-nav>
          <b-navbar-nav>
            <b-nav-item :to="{ name: 'EventList' }">Events</b-nav-item>
            <b-nav-item :to="{ name: 'Artists' }">Artists</b-nav-item>
            <b-nav-item :to="{ name: 'Genres' }">Genres</b-nav-item>
          </b-navbar-nav>
        </b-collapse>
      </b-navbar>
    </div>

    <router-view />
  </div>
</template>

<script>
import { mapActions } from "vuex";

export default {
  created() {
    this.isLogged().then(response => {
      if (!response) {
        this.$router.push({ name: "Login" });
      }
    });
  },
  methods: {
    ...mapActions({
      isLogged: "auth/isLogged"
    })
  }
};
</script>
