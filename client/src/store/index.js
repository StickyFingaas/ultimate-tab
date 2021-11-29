import { createStore } from 'vuex'
import showbase from './showbase'
import createPersistedState from "vuex-persistedstate"; //for persisting vuex store data upon refresh in browser's local storage


const store = createStore({
  modules: {
    showbase
  },
  strict: true,
  plugins: [createPersistedState()], //persists the vuex store data upon refresh in browser's local storage
})

export default store