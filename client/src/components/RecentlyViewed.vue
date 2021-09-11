<template>
  <q-layout view="lHh LpR fff">
    <q-page class="window-height window-width row justify-evenly items-center">
      <panel
        title="Recently Viewed"
        width="30"
        style="margin: 1em"
        class="shadow-2"
      >
        <q-table
          :title="user"
          :rows="histories"
          :columns="columns"
          row-key="id"
          @row-click="onRowClick"
        />
      </panel> </q-page
  ></q-layout>
</template>

<script>
import SongsHistoryService from "../boot/SongsHistoryService";
export default {
  data() {
    return {
      histories: [],
      columns: [
        {
          name: "id",
          required: true,
          label: "ID",
          field: "id",
          align: "left",
          sortable: false,
        },
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
        await SongsHistoryService
          .getHistory
          //{userId: this.$store.getters["showbase/getUser"].id,}
          ()
      ).data;

      this.histories = backBookmarks
        .map((history) => {
          const { id, title, artist, album, genre, year, createdAt, SongId } =
            history;
          return { id, title, artist, album, genre, year, createdAt, SongId };
        })
        .sort((a, b) => {
          //fixed descending sort, by the date the song page was visited (createdAt)
          if (a.createdAt > b.createdAt) {
            return -1;
          }
          if (a.createdAt < b.createdAt) {
            return 1;
          }
          return 0;
        });
    }
  },
};
</script>

<style scoped>
</style>