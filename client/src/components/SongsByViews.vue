<template>
  <q-layout view="lHh LpR fff">
    <q-page class="window-height window-width row justify-evenly items-center">
      <panel title="Songs by Views" width="30" style="margin: 1em" class="shadow-2">
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
          sortable: true
        },
        ,
      ],
      isLoggedIn: this.$store.getters["showbase/getLoggedIn"], //vuex getter which returns if the user is logged in
      user: this.$store.getters["showbase/getUser"].username,
    };
  },
  methods: {
    onRowClick(event, row) {
      this.$router.push("/songs/" + row.id);
    },
  },
  async mounted() {
    // goal is to collect songs from all subsets of pages and merge them into one array
      const response = (await SongsService.getAllSongs()).data
      const pages = response.totalPages
      for (let i = 0; i < pages; i++) {
        this.songs.push((await SongsService.getAllSongs({page: i})).data.content)
      
      }
      this.songs = this.songs.flat() //all sub-arrays are concatenated into the main array
      console.log(this.songs);
}
  
};
</script>

<style scoped>
</style>