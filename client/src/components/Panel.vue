<template>
  <div class="column" style="overflow: hidden">
    <div class="row justify-center" id="row1">
      <q-bar dark class="bg-primary text-white" :style="style">
        <div class="col text-center text-weight-bold">{{ title }}</div>
        <slot name="action" />
      </q-bar>
    </div>
    <div class="row">
      <q-card square bordered class="q-pa-md shadow-2" :style="style">
        <slot>No content detected</slot>
      </q-card>
    </div>
  </div>
</template>

<script>
export default {
  name: "Panel",
  props: {
    title: null,
    width: null,
  },
  computed: {
    style() {
      const width = this.width; //call individual props and not props.prop
      return `min-width: ${width}vw; max-width: 85vw;`;
    },
  },
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