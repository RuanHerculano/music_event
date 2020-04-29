<template>
  <div>
    <b-button v-b-modal.modal-genre-create>Create</b-button>

    <b-card class="mb-2" v-for="(genre, index) in genres" :key="index">
      <b-card-text>
        {{ genre.name }}
      </b-card-text>
    </b-card>

    <CreateModal />
  </div>
</template>

<script>
import CreateModal from "@/views/Genres/components/CreateModal";
import { mapActions, mapGetters } from "vuex";

export default {
  created() {
    this.getGenres();
  },
  methods: {
    ...mapActions({
      getGenres: "genres/list"
    })
  },
  computed: {
    ...mapGetters({
      genres: "genres/list"
    })
  },
  components: {
    CreateModal
  }
};
</script>
