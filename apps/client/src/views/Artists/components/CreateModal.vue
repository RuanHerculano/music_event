<template>
  <b-modal
    id="modal-artist-create"
    title="BootstrapVue"
    @ok="onSubmit"
    @hidden="resetActive"
  >
    <b-form @submit.prevent="onSubmit">
      <b-form-group id="name" label="Name" label-for="name">
        <b-form-input
          id="name"
          :value="active['name']"
          @input="processData($event, 'name')"
          required
        ></b-form-input>
      </b-form-group>
    </b-form>
  </b-modal>
</template>

<script>
import { mapActions, mapGetters } from "vuex";

export default {
  methods: {
    onSubmit() {
      this.$nextTick(() => {
        this.$bvModal.hide("modal-artist-create");
      });

      this.save();
    },
    processData(value, name) {
      this.setData({ value, name });
    },
    ...mapActions({
      save: "artists/save",
      setData: "artists/setData",
      resetActive: "artists/resetActive"
    })
  },
  computed: {
    ...mapGetters({
      active: "artists/active"
    })
  }
};
</script>
