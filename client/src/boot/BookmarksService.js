import axios from './axios.js'

const apiServices = {
    getBookmark: (bookmark) => axios().get('bookmarks', {
        params: bookmark
    }),
    createBookmark: (bookmark) => axios().post('bookmarks', bookmark),
    deleteBookmark: (bookmarkId) => axios().delete(`bookmarks/${bookmarkId}`),

}

export default apiServices