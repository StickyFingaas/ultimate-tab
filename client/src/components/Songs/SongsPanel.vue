<template>
  <panel title="Songs" width="45" style="margin: 1em">
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
    <template v-if="error == 2"><h5>No content detected.</h5></template>
    <template v-else>
      <div
        class="row inline items-start q-gutter-md"
        v-for="song in songs"
        :key="song.id"
      >
        <q-card-section class="row items-center">
          <q-card-section>
            <q-img class="img" :src="song.albumImage" :alt="song.title" />
            <div class="text-h6 text-orange-9">{{ song.title }}</div>
            <div class="text-subtitle2">by {{ song.artist }}</div>
          </q-card-section>
          <q-card-section>
            <q-list style="">
              <q-item>
                <q-item-section avatar>
                  <q-icon color="primary" name="album" />
                </q-item-section>

                <q-item-section style="max-width: 7vw">
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
          </q-card-section>
        </q-card-section>
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
        };
      }
      this.$router.push(route);
    }, 700), //time in milliseconds until execution
    "$route.query.search": {
      //we want our input field to bind the query param upon refresh
      async handler(value) {
        //this.search = value;
        const data = (await SongsService.getAllSongs(value)).headers[
          "content-length"
        ]; //if this is 2, empty object of songs is returned
        this.error = data;
        console.log(this.error);
        this.songs = (await SongsService.getAllSongs(value)).data; //mounted is commented out bcs the immediate property makes the request immediate on load
      },
      immediate: true,
    },
  },
  methods: {
    navigate(route) {
      this.$router.push(route);
    },
  },
  // async mounted() {
  //   this.songs = (await SongsService.getAllSongs()).data; //axios has a data property in its return object
  // },
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