import axios from './axios.js'

const apiServices = {
    getHistory: (history) => axios().get('history', {
        params: history
    }),
    createHistory: (history) => axios().post('history', history),

}

export default apiServices