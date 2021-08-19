import API from './API.js'

export default {
    register(credentials) {
        return API().post('register', credentials)
    }
}