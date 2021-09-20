<template>
  <q-layout view="hHh LpR lFf">
    <Header @leftDrawer="toggleDrawer" />
    <q-drawer
      class="shadow-2"
      v-model="leftDrawerOpen"
      bordered
      :width="200"
      :breakpoint="500"
    >
      <q-scroll-area class="fit">
        <q-list padding class="menu-list">
          <q-item clickable v-ripple :to="{ name: 'songs' }" exact>
            <q-item-section avatar>
              <q-icon name="audiotrack" />
            </q-item-section>
            <q-item-section> Songs </q-item-section>
          </q-item>
          <q-item
            clickable
            v-ripple
            v-if="isLoggedIn"
            :to="{
              name: 'bookmarks',
              params: {
                userId: user,
              },
            }"
            exact
          >
            <q-item-section avatar>
              <q-icon name="turned_in" />
            </q-item-section>

            <q-item-section> Bookmarks </q-item-section>
          </q-item>
          <q-item
            clickable
            v-ripple
            v-if="isLoggedIn"
            :to="{
              name: 'history',
              params: {
                userId: user,
              },
            }"
            exact
          >
            <q-item-section avatar>
              <q-icon name="history" />
            </q-item-section>

            <q-item-section> Recent </q-item-section>
          </q-item>
          <q-item clickable v-ripple :to="{ name: 'views' }" exact>
            <q-item-section avatar>
              <q-icon name="swap_vert" />
            </q-item-section>
            <q-item-section>Song Views</q-item-section>
          </q-item>
        </q-list>
      </q-scroll-area>
    </q-drawer>
    <q-page-container>
      <router-view />
    </q-page-container>
  </q-layout>
</template>

<script>
import Header from "../components/Header.vue";

export default {
  name: "Main Layout",
  data() {
    return {
      leftDrawerOpen: false,
    };
  },
  components: {
    Header,
  },
  computed: {
    isLoggedIn() {
      return this.$store.getters["showbase/getLoggedIn"];
    },
    user() {
      return this.$store.getters["showbase/getUser"].id;
    },
  },
  methods: {
    toggleDrawer() {
      this.leftDrawerOpen = !this.leftDrawerOpen;
    },
  },
};
</script>
