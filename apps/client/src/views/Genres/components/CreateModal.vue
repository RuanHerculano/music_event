<template>
  <b-modal
    id="modal-genre-create"
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
        this.$bvModal.hide("modal-genre-create");
      });

      this.save();
    },
    processData(value, name) {
      this.setData({ value, name });
    },
    ...mapActions({
      save: "genres/save",
      setData: "genres/setData",
      resetActive: "genres/resetActive"
    })
  },
  computed: {
    ...mapGetters({
      active: "genres/active"
    })
  }
};
</script>
