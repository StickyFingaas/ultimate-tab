import axios from './axios.js'

const apiServices = {
    getAllSongs: (search) => axios().get('songs', {
        params: {
            search: search
        }
    }),
    showSong: (id) => axios().get(`songs/${id}`),
    createSong: (song) => axios().post('songs', song),
    updateSong: (song) => axios().put(`songs/${song.id}`, song)
}

export default apiServices