import axios from './axios.js'

const apiServices = {
    getAllSongs: () => axios().get('songs'),
    createSong: (song) => axios().post('songs', song)
}

export default apiServices