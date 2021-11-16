import db from "../models/index.js" //for storing rest endpoints
const {Rating, Song} = db

import _ from 'lodash' //all functionalities from lodash library

export default {
    async getSongRatings (req, res){
            try {
                const {songId} = req.params //returns the user's bookmarked songs
                const condition = {
                    SongId: songId
                }
                const ratings = await Rating.findAndCountAll({
                        where: condition,
                })
                const sum = ratings.rows.map(item => item.rating).reduce((item1, item2) => item1 + item2, 0)
                const avgRating = parseFloat(sum/ratings.count)
                ratings.averageRating = avgRating
                res.send(ratings)
            } catch (err) {
                res.status(500).send({
                    error: "An error has occurred trying to fetch the ratings!"
                })
             }

    },

    async createRating(req, res){
        try {
             //const {userId, songId} = req.query - before JWT authorization
            // const userId = req.user.id // user which is confirmed to have a valid JWT token - check AuthorizationPolicy.js
             const {songRating, songId, userId} = req.body
             const foundRating = await Rating.findOne({
                 where: {
                     SongId: songId,
                     UserId: userId
                 }
             })

             if(!foundRating){
                const newRating = await Rating.create({rating: songRating, SongId: songId, UserId: userId})
                res.send(newRating)
            }else{
                res.send({
                    error: "You can't rate a song more than once!"
                })
            }

        } catch (err) {
            console.log(err);
            res.status(500).send({
                error: "An error has occurred trying to create the rating!"
            })
        }
    },

    async updateRating(req, res){
        try {
            const rating = await Rating.findOne({
                where: {

                        id: req.params.ratingId,
                        UserId: req.body.UserId

                }
            })

            if(!rating){
                res.status(400).send({
                    error: "Rating and user data do not match!"
                })
            }else{
                await Rating.update(req.body, {
                    where: {
                        id: req.params.ratingId
                    }
                })
                res.send(req.body)
            }
        } catch (err) {
            res.status(500).send({
                error: "An error has occurred trying to update the rating!"
            })
        }
    },

    async deleteRating(req, res){
        try {
            const {ratingId} = req.params
            const deletedRating = await Rating.findOne({
                where: {
                    id: ratingId
                }
            })
            await deletedRating.destroy()
            res.send(`Rating ${ratingId} deleted!`)
        } catch (error) {
            res.status(500).send({
                error: "An error has occurred trying to delete the rating!"
            })
        }
    },
}