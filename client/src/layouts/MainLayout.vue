<template>
  <q-layout view="hHh LpR lFf">
    <Header @leftDrawer="toggleDrawer" />

    <q-drawer v-model="leftDrawerOpen" side="left" bordered>
      drawer content
    </q-drawer>

    <q-page-container>
      <router-view />
    </q-page-container>

    <!-- <q-footer elevated class="bg-grey-8 text-white">
      <q-toolbar>
        <q-toolbar-title>
          <q-avatar>
            <img src="../assets/image.jpg" />
          </q-avatar>
          Ultimate Tab
        </q-toolbar-title>
      </q-toolbar>
    </q-footer> -->
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
  methods: {
    toggleDrawer() {
      this.leftDrawerOpen = !this.leftDrawerOpen;
    },
  },
};
</script>