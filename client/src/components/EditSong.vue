<template>
  <q-layout view="lHh LpR fff">
    <q-page
      class="window-height window-width row justify-evenly items-center"
      id="page"
    >
      <panel title="Edit Song Info" width="30">
        <q-card
          class="q-gutter-md"
          autofocus
          style="
            display: flex;
            flex-direction: column;
            max-height: 500px;
            overflow: scroll;
          "
        >
          <q-input
            square
            filled
            clearable
            v-model="song.title"
            name="title"
            type="text"
            label="title"
            lazy-rules
            :rules="[(val) => (val && val.length > 0) || 'Enter a song title']"
          />
          <q-input
            square
            filled
            clearable
            v-model="song.artist"
            name="artist"
            type="text"
            label="artist"
            lazy-rules
            :rules="[
              (val) => (val && val.length > 0) || 'Enter an artist name',
            ]"
          />
          <q-input
            square
            filled
            clearable
            v-model="song.album"
            name="album"
            type="text"
            label="album"
            lazy-rules
            :rules="[(val) => (val && val.length > 0) || 'Enter an album name']"
          />
          <q-input
            square
            filled
            clearable
            v-model="song.genre"
            name="genre"
            type="text"
            label="genre"
            lazy-rules
            :rules="[(val) => (val && val.length > 0) || 'Enter a music genre']"
          />
          <q-input
            square
            filled
            clearable
            v-model="song.year"
            name="year"
            type="number"
            label="year"
            lazy-rules
            :rules="yearRules"
          />
          <q-input
            square
            filled
            clearable
            v-model="song.youtubeId"
            name="youtubeId"
            type="url"
            label="youtubeId"
            placeholder="https://example.com"
            lazy-rules
            :rules="urlRules"
          />
          <q-input
            square
            filled
            clearable
            v-model="song.albumImage"
            name="albumImage"
            type="text"
            label="albumImage"
            lazy-rules
            :rules="imageRules"
          />
        </q-card>
      </panel>

      <panel title="Edit tab and lyrics" width="45">
        <q-card
          class="q-gutter-md"
          autofocus
          style="display: flex; flex-direction: column; max-height: 500px"
        >
          <q-input
            square
            filled
            clearable
            v-model="song.tab"
            name="tab"
            type="textarea"
            style="font-family: monospace; font-size: 0.8em"
            label="tab"
            lazy-rules
            :rules="[(val) => (val && val.length > 0) || 'Enter the song tab']"
          />
          <q-input
            square
            filled
            clearable
            v-model="song.lyrics"
            name="lyrics"
            type="textarea"
            label="lyrics"
            lazy-rules
            :rules="[
              (val) => (val && val.length > 0) || 'Enter the song lyrics',
            ]"
          />
          <div v-if="error">
            <p class="error">{{ error }}</p>
          </div>
          <q-card-actions class="q-px-md">
            <q-btn
              unelevated
              type="submit"
              color="positive"
              size="md"
              class="half-width"
              label="Confirm edit"
              style="margin: 0 auto"
              @click="update"
            />
          </q-card-actions>
        </q-card>
      </panel>
    </q-page>
  </q-layout>
</template>

<script>
import Panel from "./Panel.vue";
import SongsService from "../boot/SongsService";
export default {
  data() {
    return {
      song: {
        id: null,
        title: null,
        artist: null,
        album: null,
        genre: null,
        year: null,
        tab: null,
        lyrics: null,
        youtubeId: null,
        albumImage: null,
      },
      error: "",
      yearRules: [
        (val) => (val !== null && val !== "") || "Enter a year",
        (val) =>
          (val <= new Date().getFullYear() && val >= 1900) ||
          "Enter a valid year (1900-current)",
      ],
      urlRules: [
        (val) => (val && val.length > 0) || "Enter the song YouTube link",
        (val) =>
          val.match("https://www.youtube.com/embed/.+") ||
          "Enter a valid YT url format (embed instead of watch?v=)",
      ],
      imageRules: [
        (val) => (val && val.length > 0) || "Enter the album image link",
        (val) =>
          val.match("^(https://.+)|(http://.+)") || "Enter a valid url format",
      ],
    };
  },
  components: {
    Panel,
  },
  methods: {
    async update() {
      const filledIn = Object.keys(this.song).every((key) => !!this.song[key]);
      if (!filledIn) {
        this.error = "You must fill out every field!";
        return;
      }
      try {
        await SongsService.updateSong(this.song);
        this.$router.push({
          name: "song",
          params: {
            songId: this.song.id,
          },
        });
      } catch (err) {
        console.log(err);
      }
    },
  },
  async mounted() {
    const id = this.$store.state.route.params.songId;
    this.song = (await SongsService.showSong(id)).data;
  },
};
</script>

<style scoped>
.error {
  color: red;
}
</style>