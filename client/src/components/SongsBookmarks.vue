<template>
  <q-layout view="lHh LpR fff">
    <q-page class="window-height window-width row justify-evenly items-center">
      <panel title="Bookmarks" width="30" style="margin: 1em" class="shadow-2">
        <q-table
          :title="user"
          :rows="bookmarks"
          :columns="columns"
          row-key="id"
          @row-click="onRowClick"
        />
      </panel> </q-page
  ></q-layout>
</template>

<script>
import BookmarksService from "../boot/BookmarksService";
export default {
  data() {
    return {
      bookmarks: [],
      columns: [
        {
          name: "title",
          align: "center",
          label: "TITLE",
          field: "title",
        },
        {
          name: "artist",
          align: "center",
          label: "ARTIST",
          field: "artist",
        },
        { name: "album", align: "center", label: "ALBUM", field: "album" },
        { name: "genre", align: "center", label: "GENRE", field: "genre" },
        { name: "year", align: "center", label: "YEAR", field: "year" },
        ,
      ],
      isLoggedIn: this.$store.getters["showbase/getLoggedIn"], //vuex getter which returns if the user is logged in
      user: this.$store.getters["showbase/getUser"].username,
    };
  },
  methods: {
    onRowClick(event, row) {
      this.$router.push("/songs/" + row.SongId);
    },
  },
  async mounted() {
    if (this.isLoggedIn) {
      const backBookmarks = (
        await BookmarksService
          .getBookmark

          //{userId: this.$store.getters["showbase/getUser"].id,} - no need to pass this prop because of JWT authorization in backend
          ()
      ).data;

      this.bookmarks = backBookmarks.map((bookmark) => {
        const { id, title, artist, album, genre, year, SongId } = bookmark;
        return { id, title, artist, album, genre, year, SongId };
      });
    }
  },
};
</script>

<style scoped>
</style>