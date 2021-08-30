//for storing rest endpoints
import db from "../models/index.js"
//CommonJS module needed
import { createRequire } from 'module';
const require = createRequire(import.meta.url);
//sequelize object Operator which comes handy to use in where clauses
const { Op } = require("sequelize");

const {Song} = db

export default {
    async getAllSongs (req, res){
        try {
            let songs = null
            const search = req.query.search //in client/SongsService.js the parameter defined inside a get request
            if(search){
                songs = await Song.findAll({
                    where: {
                        [Op.or]: ['title', 'artist', 'album', 'genre']
                        .map(key => ({
                            [key]: {
                                [Op.iLike]: `%${search}%`
                                //basically, returns songs where any of its 4 attributes defined above
                                //contains the input value in their name
                            }
                        }))
                    }
                })
            }else{
                //findAll, create, update etc. are built-in Sequelize methods
             songs = await Song.findAll({
                limit: 10 // for testing purposes
            })
            }
            res.send(songs)
        } catch (err) {
            res.status(500).send({
                error: "An error has occurred trying to fetch the songs!"
            })
         }
     },

     async showSong (req, res){
        try {
            //findByPk instead of findById - it fetches the song by the passed id, in any case
            const song = await Song.findByPk(req.params.songId)
            res.send(song)
        } catch (err) {
            res.status(500).send({
                error: "An error has occurred trying to fetch the song!"
            })
         }
     },
    async createSong (req, res){
       try {
            const song = await Song.create(req.body)
            res.send(song)
       } catch (err) {
            res.status(500).send({
                error: "An error has occurred trying to create the song!"
            })
        }
    },
    async updateSong (req, res){
        try {
            //only update the song which matches the request param id
             const song = await Song.update(req.body, {
                 where: {
                     id: req.params.songId
                 }
             })
             //it should return the updated song info
             //res.send(song)
             res.send(req.body)
        } catch (err) {
             res.status(500).send({
                 error: "An error has occurred trying to update the song!"
             })
         }
     }

}