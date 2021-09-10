<template>
  <q-layout view="lHh LpR fff">
    <q-page class="window-height window-width row justify-center items-center">
      <songs-panel class="shadow-1" />
    </q-page>
  </q-layout>
</template>

<script>
import SongsPanel from "./SongsPanel.vue";
export default {
  components: {
    SongsPanel,
  },
};
</script>