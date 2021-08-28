import axios from './axios.js'

const apiServices = {
    getAllSongs: () => axios().get('songs'),
    showSong: (id) => axios().get(`songs/${id}`),
    createSong: (song) => axios().post('songs', song),
    updateSong: (song) => axios().put(`songs/${song.id}`, song)
}

export default apiServices