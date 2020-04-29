<template>
  <b-card>
    <p>
      <strong>
        <span v-if="isFestival">Festival</span>
        <span v-else>Concert</span>
        {{ event.name }}
        -
        {{ event.schedule | moment("hh:mm") }}
      </strong>
    </p>

    <p><strong>Genres:</strong></p>
    <ul>
      <li v-for="genre in event.genres" :key="genre.id + Date.now()">
        {{ genre.name }}
      </li>
    </ul>

    <div v-if="isFestival">
      <p>
        <strong>
          Artists
        </strong>
      </p>

      <ol>
        <li v-for="artist in event.artists" :key="artist.id + Date.now()">
          {{ artist.name }}
        </li>
      </ol>
    </div>
    <div v-else>
      <p>
        <strong>
          Artist
        </strong>
      </p>

      <p>
        {{ event.artists[0].name }}
      </p>
    </div>
  </b-card>
</template>

<script>
export default {
  props: {
    event: {
      type: Object,
      required: true
    }
  },
  computed: {
    isFestival() {
      return this.event.artists.length > 1;
    }
  }
};
</script>
