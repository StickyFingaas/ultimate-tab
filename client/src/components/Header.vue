<template>
  <q-header
    elevated
    class="bg-primary text-white shadow-2 fixed-top"
    style="z-index: 1"
  >
    <q-toolbar>
      <q-btn
        flat
        round
        dense
        icon="menu"
        class="q-mr-sm"
        @click="$emit('passEvent', leftDrawerOpen)"
      />

      <q-toolbar-title>
        <router-link to="home">
          <q-avatar>
            <img src="../assets/image.jpg" />
          </q-avatar>
        </router-link>
        Ultimate Tab</q-toolbar-title
      >
      <q-space />
      <q-tabs v-model="tab" shrink>
        <router-link to="login" style="color: white; text-decoration: none">
          <q-tab v-if="isLoggedIn === false" name="tab1" label="Login" />
        </router-link>
        <router-link to="register" style="color: white; text-decoration: none">
          <q-tab v-if="isLoggedIn === false" name="tab2" label="Sign Up" />
        </router-link>
      </q-tabs>
    </q-toolbar>
  </q-header>
</template>

<script>
export default {
  name: "Header",

  data() {
    return {
      leftDrawerOpen: null,
    };
  },
  emits: {
    passEvent: () => {
      return !this.leftDrawerOpen ? false : true;
    },
  },
  computed: {
    //get value is presented as a computed property, not as a const as it changes (obviously)
    isLoggedIn() {
      return this.$store.getters["showbase/getLoggedIn"];
    },
  },
};
</script>
