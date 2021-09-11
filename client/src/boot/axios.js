import axios from 'axios'
import store from '../store/index.js'
export default () => {
    return axios.create({
        baseURL: 'http://localhost:8081/',
        headers: { //for some endpoints this will be required
            //since we want only users with valid JWT to have access to those endpoints
            Authorization: `Bearer ${store.getters["showbase/getToken"]}`
        }
    })
}