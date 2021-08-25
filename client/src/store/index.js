import { createStore } from 'vuex'
import showbase from './showbase'


const store = createStore({
  modules: {
    showbase
  },
  strict: true,
})
export default store