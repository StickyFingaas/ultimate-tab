import axios from './axios.js'

const apiServices = {
    register: (credentials) => axios().post('register', credentials)
}

export default apiServices