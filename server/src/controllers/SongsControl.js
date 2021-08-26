//for storing rest endpoints
import db from "../models/index.js"

const {Song} = db


export default {
    async getAllSongs (req, res){
        try {
            const songs = await Song.findAll({
                limit: 10 // for testing purposes
            })
            res.send(songs)
        } catch (err) {
            res.status(500).send({
                error: "An error has occurred trying to fetch the songs!"
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
    }

}