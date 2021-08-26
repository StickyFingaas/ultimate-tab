<template>
  <div class="column">
    <div class="row" id="row1">
      <q-bar dark class="bg-primary text-white" style="min-width: 60vw">
        <div class="col text-center text-weight-bold">{{ title }}</div>
      </q-bar>
    </div>
    <div class="row">
      <q-card square bordered class="q-pa-lg shadow-1" style="min-width: 60vw">
        <slot>Slot title</slot>
      </q-card>
    </div>
  </div>
</template>

<script>
export default {
  name: "Panel",
  props: ["title"],
};
</script>

<style lang="scss" scoped>
#row1 {
  background-color: $primary;
}

h5 {
  padding: 0.75em;
  margin: auto;
}
</style>