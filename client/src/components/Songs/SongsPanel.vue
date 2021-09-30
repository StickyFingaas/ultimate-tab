<template>
  <panel title="Songs" width="45" style="margin: 1em; ">
    <template v-slot:action v-if="isLoggedIn">
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
    <div class="row justify-center items-center">
      <q-input
        rounded
        outlined
        v-model="search"
        label="Search by title, artist, album or genre"
        style="min-width: 30vw"
      >
        <template v-slot:prepend>
          <q-icon name="search" />
        </template>
      </q-input>
    </div>
    <template v-if="error == 29"><h5>No content found.</h5></template>
    <template v-else>
      <div
        class="row inline items-start q-gutter-md"
        v-for="song in songs"
        :key="song.id"
      >
        <q-card-section class="row items-center">
          <q-card-section>
            <q-img class="img" :src="song.albumImage" :alt="song.title"/>
            <div class="text-h6 text-orange-9">{{ song.title }}</div>
            <div class="text-subtitle2">by {{ song.artist }}</div>
          </q-card-section>
          <q-card-section>
            <q-list>
              <q-item class="justify-between">
                <q-item-section avatar>
                  <q-icon color="primary" name="album" />
                </q-item-section>

                <q-item-section style="max-width: 10vw">
                  <q-item-label>Album</q-item-label>
                  <q-item-label
                    caption
                    style="
                      width: fit-content;
                      width: fit-content;
                      overflow-wrap: break-word;
                      margin: 0 auto;
                    "
                    >{{ song.album }}</q-item-label
                  >
                </q-item-section>
              </q-item>

              <q-item>
                <q-item-section avatar>
                  <q-icon color="red" name="audiotrack" />
                </q-item-section>

                <q-item-section>
                  <q-item-label>Genre</q-item-label>
                  <q-item-label caption>{{ song.genre }}</q-item-label>
                </q-item-section>
              </q-item>

              <q-item>
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
              <router-link
                :to="{
                  name: 'song',
                  params: {
                    songId: song.id,
                  },
                }"
                style="text-decoration: none; margin: 1em"
              >
                <q-btn color="primary" label="Details" />
              </router-link>
              <q-btn color="primary"
                ><a
                  :href="song.youtubeId"
                  target="_blank"
                  style="text-decoration: none; color: white"
                  >Listen</a
                ></q-btn
              >
            </q-card-actions>
          </q-card-section>
        </q-card-section>
      </div>
      <div class="q-pa-lg flex flex-center">
        <q-pagination push v-model="current" :max="max" />
      </div>
    </template>
  </panel>
</template>

<script>
import SongsService from "../../boot/SongsService";
import _ from "lodash";
export default {
  data() {
    return {
      songs: null,
      search: "",
      error: null,
      isLoggedIn: this.$store.getters["showbase/getLoggedIn"],
      current: 1,
      max: null,
    };
  },
  // components: {
  //   Panel,
  // },
  watch: {
    // using lodash.debounce function for delayed execution on route change method, and by proxy the http request is delayed for more optimized performance
    search: _.debounce(async function (newValue) {
      //any function with a time variable should be async
      //methods are called after the property which is being watched
      //in order to bookmark songs (future functionality),
      //it's best to store data in the URL by creating a router link with params which match certain data
      const route = {
        name: "songs", //route is always defined as an object w/ name, optionally params (ex. /:id) or queries (ex. ?search=name)
      };
      if (newValue !== "") {
        route.query = {
          search: newValue, //'search' will be included after '?' followed by '=${this.search}'
          // page: this.current,
        };
      }
      this.$router.push(route);
    }, 700), //time in milliseconds until execution
    "$route.query.search": {
      //we want our input field to bind the query param upon refresh
      async handler(value) {
        //this.search = value;

        const data = (await SongsService.getAllSongs({ search: value }))
          .headers["content-length"]; //if this is 0, empty object of songs is returned
        this.error = data;
        const allSongs = (await SongsService.getAllSongs({ search: value }))
          .data;
        this.songs = allSongs.content; //mounted is commented out bcs the immediate property makes the request immediate on load
        this.max = allSongs.totalPages;
      },
      immediate: true,
    },
    current: function (newValue) {
      const value = newValue - 1;
      const route = {
        name: "songs", //route is always defined as an object w/ name, optionally params (ex. /:id) or queries (ex. ?search=name)
      };
      route.query = {
        page: value, //'search' will be included after '?' followed by '=${this.search}'
      };

      this.$router.push(route);
    },
    "$route.query.page": {
      async handler(value) {
        const data = (await SongsService.getAllSongs({ page: value })).headers[
          "content-length"
        ]; //if this is 29, empty object of songs is returned
        this.error = data;
        const allSongs = (await SongsService.getAllSongs({ page: value })).data;
        this.songs = allSongs.content; //mounted is commented out bcs the immediate property makes the request immediate on load
            console.log(this.songs);

      },
      immediate: true,
    },
  },
  mounted() {
    this.$router.replace({ query: null }); //on page refresh it resets the search query params
  },
};
</script>

<style lang="scss" scoped>
.my-card {
  width: 100%;
  max-width: 250px;
}

.img {
  width: 20em;
  height: 20em;
  object-fit: fit
}
</style>