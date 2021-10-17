import db from "../models/index.js" //for storing rest endpoints
const {History, Song} = db

import _ from 'lodash' //all functionalities from lodash library

export default {
    async getHistory (req, res){
            try {
                //const songId = req.query.songId
                //returns the user's bookmarked songs
                const userId = req.user.id // user which is confirmed to have a valid JWT token - check AuthorizationPolicy.js
                const histories = await History.findAll({
                    where: {
                        UserId: userId
                    }   ,
                    include: [
                            {
                                model: Song//also returns the data about the song which is bookmarked
                            }
                        ]
                })
                //also it's better to map an array (of objects) after it's asynchronously retrieved
                //extend function assigns the song object to a new object containing the bookmark id
                const newHistory = histories.map(history => history.toJSON()).map(history => _.extend(
                    {},
                    history.Song,
                    history))
                res.send(_.uniqBy(newHistory, history => history.SongId)) //lodash function which returns unique/non-duplicate songs in the histories array
            } catch (err) {
                res.status(500).send({
                    error: "An error has occurred trying to fetch the history!"
                })
             }

    },
    async createHistory (req, res){
        try {
            const userId = req.user.id // user which is confirmed to have a valid JWT token - check AuthorizationPolicy.js
            const {songId} = req.body
            const history = await History.create({ SongId: songId, UserId: userId})
            res.send(history)
        } catch (err) {
            res.status(500).send({
                err: "An error has occurred trying to create the history!"
            })
         }
    }
}