import { sync } from 'vuex-router-sync';
import { boot } from 'quasar/wrappers';

export default boot(({ router, store}) => {
  sync(store, router);
});