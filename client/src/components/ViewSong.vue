<template>
  <q-layout view="lHh LpR fff">
    <q-page class="window-height window-width row justify-evenly items-top">
      <panel title="Song Info" width="30" style="margin: 1em">
        <div class="q-pa-md column items-start q-gutter-md shadow-box shadow-2">
          <q-card-section class="row items-center">
            <q-card-section>
              <q-img class="img" :src="song.albumImage" :alt="song.title" />
              <div class="text-h6 text-orange-9">{{ song.title }}</div>
              <div class="text-subtitle2">by {{ song.artist }}</div>
            </q-card-section>
            <q-card-section>
              <q-list>
                <q-item clickable>
                  <q-item-section avatar>
                    <q-icon color="primary" name="album" />
                  </q-item-section>

                  <q-item-section>
                    <q-item-label>Album</q-item-label>
                    <q-item-label caption>{{ song.album }}</q-item-label>
                  </q-item-section>
                </q-item>

                <q-item clickable>
                  <q-item-section avatar>
                    <q-icon color="red" name="audiotrack" />
                  </q-item-section>

                  <q-item-section>
                    <q-item-label>Genre</q-item-label>
                    <q-item-label caption>{{ song.genre }}</q-item-label>
                  </q-item-section>
                </q-item>

                <q-item clickable>
                  <q-item-section avatar>
                    <q-icon color="amber" name="watch_later" />
                  </q-item-section>

                  <q-item-section>
                    <q-item-label>Year</q-item-label>
                    <q-item-label caption>{{ song.year }}</q-item-label>
                  </q-item-section>
                </q-item>
              </q-list>
              <q-card-actions class="justify-center">
                <q-btn
                  color="primary"
                  label="Edit"
                  @click="
                    navigate({
                      name: 'edit',
                      params: {
                        songId: song.id,
                      },
                    })
                  "
                />
              </q-card-actions>
            </q-card-section>
          </q-card-section>
        </div>
      </panel>
      <panel title="YouTube Video" width="45" style="margin: 1em">
        <div class="q-pa-md">
          <q-video :ratio="16 / 9" :src="song.youtubeId" />
        </div>
      </panel>
      <panel title="Lyrics" width="30" style="margin: 1em">
        <q-input
          v-model="song.lyrics"
          rounded
          outlined
          autogrow
          readonly
          class="textarea"
        />
      </panel>
      <panel title="Tab" width="45" style="margin: 1em">
        <q-input
          v-model="song.tab"
          rounded
          outlined
          autogrow
          readonly
          class="textarea"
        />
      </panel>
    </q-page>
  </q-layout>
</template>

<script>
import SongsService from "../boot/SongsService";
import Panel from "./Panel.vue";
export default {
  data() {
    return {
      song: {},
    };
  },
  components: {
    Panel,
  },
  //whenever the router changes, the changes in its params are reflected in Vuex state - router and state are synchronized
  async mounted() {
    const id = this.$store.state.route.params.songId;
    this.song = (await SongsService.showSong(id)).data;
  },
  methods: {
    navigate(route) {
      this.$router.push(route);
    },
  },
};
</script>

<style lang="scss" scoped>
.img {
  width: 250px;
  height: 150px;
  background-size: cover;
}

.textarea {
  font-family: monospace;
}
</style>