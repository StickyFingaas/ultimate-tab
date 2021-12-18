<template>
  <q-layout view="lHh LpR fff">
    <q-page class="window-height window-width row justify-evenly items-center">
      <panel
        title="Song List
      "
        width="30"
        style="margin: 1em"
        class="shadow-2"
      >
        <q-table :rows="songs" :columns="columns" row-key="id">
          <template v-slot:body="props">
            <q-tr>
              <!-- unresolved redirection to song on click-->
              <q-td key="albumImage" :props="props">
                <img
                  :src="props.row.albumImage"
                  style="width: 5em; height: 5em; object-fit: cover"
                />
              </q-td>

              <q-td key="title" :props="props">
                <q-badge color="secondary" style="padding: 5px">
                  {{ props.row.title }}
                </q-badge>
              </q-td>
              <q-td key="artist" :props="props">
                <q-badge color="accent" style="padding: 5px">
                  {{ props.row.artist }}
                </q-badge>
              </q-td>
              <q-td key="album" :props="props">
                <q-badge color="positive" style="padding: 5px">
                  {{ props.row.album }}
                </q-badge>
              </q-td>
              <q-td key="genre" :props="props">
                <q-badge color="negative" style="padding: 5px">
                  {{ props.row.genre }}
                </q-badge>
              </q-td>
              <q-td key="year" :props="props">
                <q-badge color="info" style="padding: 5px">
                  {{ props.row.year }}
                </q-badge>
              </q-td>
              <q-td key="views" :props="props">
                <q-badge color="warning" style="padding: 5px">
                  {{ props.row.views }}
                </q-badge>
              </q-td>
            </q-tr>
          </template>
        </q-table>
      </panel>
    </q-page>
  </q-layout>
</template>

<script>
import SongsService from "../boot/SongsService";
export default {
  data() {
    return {
      songs: [],
      columns: [
        {
          name: "albumImage",
          align: "left",
          label: "ALBUM COVER",
          field: "albumImage",
        },
        {
          name: "title",
          align: "left",
          label: "TITLE",
          field: "title",
          sortable: true,
        },
        {
          name: "artist",
          align: "left",
          label: "ARTIST",
          field: "artist",
          sortable: true,
        },
        {
          name: "album",
          align: "left",
          label: "ALBUM",
          field: "album",
          sortable: true,
        },
        {
          name: "genre",
          align: "left",
          label: "GENRE",
          field: "genre",
          sortable: true,
        },
        {
          name: "year",
          align: "left",
          label: "YEAR",
          field: "year",
          sortable: true,
        },
        {
          name: "views",
          align: "left",
          label: "VIEWS",
          field: "views",
          sortable: true,
        },
      ],
      isLoggedIn: this.$store.getters["showbase/getLoggedIn"], //vuex getter which returns if the user is logged in
      user: this.$store.getters["showbase/getUser"].username,
    };
  },
  async mounted() {
    // goal is to collect songs from all subsets of pages and merge them into one array
    const response = (await SongsService.getAllSongs()).data;
    const pages = response.totalPages;
    for (let i = 0; i < pages; i++) {
      this.songs.push(
        (await SongsService.getAllSongs({ page: i })).data.content
      );
    }
    this.songs = this.songs.flat(); //all sub-arrays are concatenated into the main array
  },
};
</script>