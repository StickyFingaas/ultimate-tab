<template>
  <q-layout view="lHh LpR fff">
    <q-page class="window-height window-width row justify-center items-center">
      <panel title="Songs" width="45">
        <template v-slot:action>
          <router-link to="create" style="text-decoration: none">
            <q-btn
              round
              color="positive"
              size="md"
              icon="add"
              style="margin-top: 2em; z-index: 1"
            />
          </router-link>
        </template>
        <div
          class="q-pa-md row inline items-start q-gutter-md shadow-box shadow-2"
          v-for="song in songs"
          :key="song.id"
        >
          <q-card class="my-card" flat bordered>
            <q-img class="img" :src="song.albumImage" :alt="song.title" />

            <q-card-section>
              <q-card-section>
                <div class="text-h6 text-orange-9">{{ song.title }}</div>
                <div class="text-subtitle2">by {{ song.artist }}</div>
              </q-card-section>
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
            </q-card-section>

            <q-card-actions class="justify-center">
              <q-btn
                color="primary"
                label="Details"
                @click="
                  navigate({
                    name: 'song',
                    params: {
                      songId: song.id,
                    },
                  })
                "
              />

              <q-btn color="primary"
                ><a
                  :href="song.youtubeId"
                  target="_blank"
                  style="text-decoration: none; color: white"
                  >Listen</a
                ></q-btn
              >
            </q-card-actions>
          </q-card>
        </div>
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
      songs: null,
    };
  },
  components: {
    Panel,
  },
  methods: {
    navigate(route) {
      this.$router.push(route);
    },
  },
  async mounted() {
    this.songs = (await SongsService.getAllSongs()).data; //axios has a data property in its return object
  },
};
</script>

<style lang="scss" scoped>
.my-card {
  width: 100%;
  max-width: 250px;
}

.img {
  width: 250px;
  height: 150px;
  background-size: cover;
}
</style>