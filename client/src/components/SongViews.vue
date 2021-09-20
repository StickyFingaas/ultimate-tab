<template>
  <q-layout view="lHh LpR fff">
    <q-page class="window-height window-width row justify-evenly items-center">
      <panel title="Song Views" width="30" style="margin: 1em" class="shadow-2">
        <q-table
          :rows="songs"
          :columns="columns"
          row-key="id"
          @row-click="onRowClick"
        />
      </panel> </q-page
  ></q-layout>
</template>

<script>
import SongsService from "../boot/SongsService";
export default {
  data() {
    return {
      songs: [],
      columns: [
        {
          name: "id",
          required: true,
          label: "ID",
          field: "id",
          align: "left",
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
        {
          name: "views",
          align: "center",
          label: "VIEWS",
          field: "views",
        },
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
      const allSongs = (await SongsService.getAllSongs()).data;
      // this.songs = allSongs.map((song) => {
      //   const { id, title, artist, album, genre, year, views, SongId } = song;
      //   return { id, title, artist, album, genre, year, views, SongId };
      // });
      this.songs = { allSongs };
      console.log(allSongs);
    }
  },
};
</script>

<style scoped>
</style>