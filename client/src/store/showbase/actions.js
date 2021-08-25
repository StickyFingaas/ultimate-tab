export function setToken ({commit}, token){ //Vuex commit method manages mutations
        commit('setToken', token) //first param is the mutation method name, second is the argument passed to it
    }

export function setUser ({commit}, user){
        commit('setUser', user)
 }

