<template>
  <div>
    <div>
      <b-form @submit="onSubmit">
        <b-form-group id="email" :label="$t('labels.email')" label-for="email">
          <b-form-input
            id="email"
            v-model="form.email"
            type="email"
            required
            :placeholder="$t('views.login.email.placeholder')"
          ></b-form-input>
        </b-form-group>

        <b-form-group
          id="password"
          :label="$t('labels.password')"
          label-for="password"
        >
          <b-form-input
            id="password"
            v-model="form.password"
            type="password"
            required
            :placeholder="$t('views.login.password.placeholder')"
          ></b-form-input>
        </b-form-group>

        <b-button type="submit" variant="primary">
          {{ $t("views.login.actions.login") }}
        </b-button>

        <b-button variant="outline-primary">
          <router-link :to="{ name: 'Register' }">
            {{ $t("views.login.actions.register") }}
          </router-link>
        </b-button>
      </b-form>
    </div>
  </div>
</template>

<script>
import { mapActions } from "vuex";

export default {
  data() {
    return {
      form: {
        email: "",
        password: ""
      }
    };
  },
  methods: {
    onSubmit(evt) {
      evt.preventDefault();
      this.login(this.form).then(() => {
        this.$router.push({ name: "EventList" });
      });
    },
    ...mapActions({
      login: "auth/login"
    })
  }
};
</script>
