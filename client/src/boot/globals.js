//making the Panel component a global module usable by all files
import { boot } from 'quasar/wrappers'
import Panel from '../components/Panel.vue'

export default boot(({ app }) => {
  app.component('panel', Panel)
})