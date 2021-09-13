<template>
  <q-header
    elevated
    class="bg-primary text-white fixed-top"
    style="z-index: 999"
  >
    <q-toolbar>
      <q-btn
        flat
        round
        dense
        icon="menu"
        class="q-mr-sm"
        @click="$emit('leftDrawer', leftDrawerOpen)"
      />

      <q-toolbar-title style="text-align: left">
        <!-- <router-link to="/songs"> -->
        <q-avatar>
          <img src="../assets/image.jpg" />
        </q-avatar>
        <!-- </router-link> -->
        Ultimate Tab</q-toolbar-title
      >

      <q-space />

      <q-tabs shrink>
        <router-link to="/songs" style="color: white; text-decoration: none">
          <q-tab name="tab3" label="Browse" />
        </router-link>
        <router-link to="/login" style="color: white; text-decoration: none">
          <q-tab v-if="!isLoggedIn" name="tab1" label="Login" />
        </router-link>
        <router-link to="/register" style="color: white; text-decoration: none">
          <q-tab v-if="!isLoggedIn" name="tab2" label="Sign Up" />
        </router-link>
        <router-link to="/" style="color: white; text-decoration: none">
          <q-tab
            v-if="isLoggedIn"
            name="tab2"
            label="Log Out"
            @click="logout"
          />
        </router-link>
        <q-badge v-if="isLoggedIn" name="user" :label="user" />
        <q-avatar v-if="isLoggedIn">
          <img src="../assets/icon.png" />
        </q-avatar>
      </q-tabs>
    </q-toolbar>
  </q-header>
</template>

<script>
export default {
  name: "Header",

  data() {
    return {
      leftDrawerOpen: false,
    };
  },
  emits: ["leftDrawer"],
  computed: {
    //get value is presented as a computed property, not as a const as it changes (obviously)
    isLoggedIn() {
      return this.$store.getters["showbase/getLoggedIn"];
    },
    user() {
      return this.$store.getters["showbase/getUser"].username;
    },
  },
  methods: {
    logout() {
      this.$store.dispatch("showbase/setToken", null);
    },
  },
};
</script>
