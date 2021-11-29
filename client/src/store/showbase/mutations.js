export function setToken(state, token) {
    state.token = token
            if(token) state.isLoggedIn = true
            else state.isLoggedIn = false
            
}

export function setUser(state, user){
    state.user = user
}