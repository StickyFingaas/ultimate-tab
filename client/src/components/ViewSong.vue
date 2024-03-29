<template>
  <q-layout view="lHh LpR fff">
    <q-page class="window-height window-width row justify-evenly items-top">
      <panel title="Song Info" width="30" style="margin: 1em">
        <div class="q-pa-md column items-start q-gutter-md">
          <q-card-section class="row align-center">
            <q-card-section>
              <q-img class="img" :src="song.albumImage" :alt="song.title" />
              <div class="text-h6 text-orange-9">{{ song.title }}</div>
              <div class="text-subtitle2">by {{ song.artist }}</div>
            </q-card-section>
            <q-card-section>
              <q-list>
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

                <q-item>
                  <q-item-section avatar>
                    <q-avatar
                      color="red"
                      text-color="white"
                      style="font-size: 2em"
                      ><span>{{ validAvgRating }}</span>
                    </q-avatar>
                  </q-item-section>
                  <q-chip> Avg. Rating </q-chip>
                </q-item>
              </q-list>
            </q-card-section>
          </q-card-section>
          <q-card-section class="row" v-if="isLoggedIn">
            <div class="q-gutter-y-md row items-center">
              <q-item-label>Your rating:</q-item-label>
              <q-rating
                v-model="ratingModel"
                size="3.5em"
                color="yellow"
                icon="star_border"
                icon-selected="star"
                no-dimming
              />
            </div>
            <q-card-actions class="items-right">
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
              <q-btn
                v-if="isLoggedIn && !bookmark"
                color="positive"
                icon-right="turned_in"
                @click="setBookmark"
              />
              <q-btn
                v-if="isLoggedIn && bookmark"
                color="negative"
                icon-right="bookmark_border"
                @click="unsetBookmark"
              />
            </q-card-actions>
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
          style="max-height: 30vw; overflow: auto"
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
          style="max-height: 30vw; overflow: auto; font-size: 0.8em"
        />
      </panel>
    </q-page>
  </q-layout>
</template>

<script>
import SongsService from "../boot/SongsService";
import BookmarksService from "../boot/BookmarksService";
import SongsHistoryService from "../boot/SongsHistoryService";
import RatingsService from "../boot/RatingsService";
export default {
  data() {
    return {
      song: {},
      isLoggedIn: this.$store.getters["showbase/getLoggedIn"], //vuex getter which returns if the user is logged in
      user: this.$store.getters["showbase/getUser"],
      bookmark: null,
      ratingObject: null,
      ratingModel: 0,
      avgRating: null,
      ratingColors: [
        "light-green-3",
        "light-green-6",
        "green",
        "green-9",
        "green-10",
      ],
    };
  },

  computed: {
    validAvgRating() {
      return this.avgRating || "/";
    },
  },
  // components: {
  //   Panel,
  // },
  //whenever the router changes, the changes in its params are reflected in Vuex state
  //- router and state are synchronized
  watch: {
    async song() {
      this.song.views++; //song view count increases on each page visit
      await SongsService.updateSong(this.song);
    },

    async ratingModel(newVal, oldVal) {
      if (oldVal === 0 || (oldVal === null && newVal !== 0)) {
        const rating = await RatingsService.createRating(
          newVal,
          this.user.id,
          this.song.id
        );
        if (!this.ratingObject) {
          this.ratingObject = rating.data;
        }
      } else if (oldVal !== 0 && oldVal !== newVal && newVal !== 0) {
        await RatingsService.updateRating(
          newVal,
          this.ratingObject.id,
          this.user.id
        );
      } else if (oldVal !== 0 && newVal === 0) {
        await RatingsService.deleteRating(this.ratingObject.id);
        this.ratingObject = null;
      }
      const id = this.$store.state.route.params.songId;
      const avgRatingBack = await RatingsService.getSongRatings(id);
      this.avgRating = avgRatingBack.data.averageRating;
    },
  },

  async mounted() {
    try {
      const id = this.$store.state.route.params.songId;
      this.song = (await SongsService.showSong(id)).data; // AxiosResponse is an object, and data is its property

      const avgRatingBack = await RatingsService.getSongRatings(id);
      this.avgRating = avgRatingBack.data.averageRating;

      if (!this.isLoggedIn) {
        return;
      } else {
        await SongsHistoryService.createHistory({
          songId: id,
          //userId: this.user.id,
        });

        const bookmarks = (
          await BookmarksService.getBookmark({
            songId: id,
            //commented out the following because userId is going to be extracted from the JWT in the backend
            // userId: this.user.id, //prop user is defined in the state, marks the logged user
          })
        ).data;
        if (bookmarks.length) {
          this.bookmark = bookmarks[0]; //since backend has been changed to getAll bookmarks
        }
        //this.bookmark = !!bookmark; //convert the value into true or false

        try {
          const currUserRating = avgRatingBack.data.rows.filter(
            (row) => row.UserId == this.user.id
          );
          this.ratingObject = currUserRating[0];
          this.ratingModel = this.ratingObject.rating;
        } catch (error) {
          console.log(error);
        }
      }
    } catch (error) {
      console.log(error);
    }
  },
  methods: {
    navigate(route) {
      this.$router.push(route);
    },
    async setBookmark() {
      try {
        this.bookmark = (
          await BookmarksService.createBookmark({
            songId: this.song.id,
            //same reason as above - userId is extracted from JWT in the backend
            //userId: this.$store.state.showbase.user.id, //prop user is defined in the state, marks the logged user
          })
        ).data;
      } catch (error) {
        console.log(error);
      }
    },
    async unsetBookmark() {
      try {
        await BookmarksService.deleteBookmark(this.bookmark.id);
        this.bookmark = null;
      } catch (error) {
        console.log(error);
      }
    },
  },
};
</script>

<style lang="scss" scoped>
.img {
  width: 15em;
  height: 15em;
  background-size: cover;
}

.textarea {
  font-family: monospace;
}
</style>