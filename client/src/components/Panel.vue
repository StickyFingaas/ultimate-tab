<template>
  <div class="column">
    <div class="row justify-center" id="row1">
      <q-bar dark class="bg-primary text-white" style="min-width: 45vw">
        <div class="col text-center text-weight-bold">{{ title }}</div>
        <slot name="action" />
      </q-bar>
    </div>
    <div class="row">
      <q-card square bordered class="q-pa-lg shadow-1" style="min-width: 45vw">
        <slot></slot>
      </q-card>
    </div>
  </div>
</template>

<script>
export default {
  name: "Panel",
  props: ["title", "width"],
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