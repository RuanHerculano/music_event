<template>
  <div>
    <b-button v-b-modal.modal-artist-create>Create</b-button>

    <b-card class="mb-2" v-for="(artist, index) in artists" :key="index">
      <b-card-text>
        {{ artist.name }}
      </b-card-text>
    </b-card>

    <CreateModal />
  </div>
</template>

<script>
import CreateModal from "@/views/Artists/components/CreateModal";
import { mapActions, mapGetters } from "vuex";

export default {
  created() {
    this.getArtists();
  },
  methods: {
    ...mapActions({
      getArtists: "artists/list"
    })
  },
  computed: {
    ...mapGetters({
      artists: "artists/list"
    })
  },
  components: {
    CreateModal
  }
};
</script>
