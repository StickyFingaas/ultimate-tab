import axios from './axios.js'

const apiServices = {
    login: (credentials) => axios().post('login', credentials),
    register: (credentials) => axios().post('register', credentials)
}

export default apiServices