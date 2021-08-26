import axios from './axios.js'

const apiServices = {
    getAllSongs: () => axios().get('songs')
}

export default apiServices