import axios from './axios.js'

const apiServices = {

    getSongRatings: (id) => axios().get(`ratings/${id}`),
    createRating: (rating, userId, songId) => axios().post('ratings', {
        songRating: rating,
        songId: songId,
        userId: userId
    }),
    updateRating: (rating, ratingId, userId) => axios().put(`ratings/${ratingId}`, {rating: rating, UserId: userId}),
    deleteRating: (id) => axios().delete(`ratings/${id}`)
}

export default apiServices