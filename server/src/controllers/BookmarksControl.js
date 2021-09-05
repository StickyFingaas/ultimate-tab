//for storing rest endpoints
import db from "../models/index.js"
const {Bookmark} = db

export default {
    async getBookmark (req, res){
            try {
                //const songId = req.query.songId
                //returns a bookmark if the user has one for a particular song
                const {songId, userId} = req.query
                const bookmark = await Bookmark.findOne({
                        where: {
                            SongId: songId,
                            UserId: userId //both required to fetch the bookmark
                        }
                })
                res.send(bookmark)
            } catch (err) {
                res.status(500).send({
                    error: "An error has occurred trying to fetch the bookmark!"
                })
             }

    },
    async createBookmark (req, res){
        try {
            const {songId, userId} = req.body
            const bookmark = await Bookmark.findOne({
                where: {
                    SongId: songId,
                    UserId: userId
                }
            })
            if(bookmark){
                res.status(400).send({
                    error: "You have already bookmarked this song!"
                })
            }
            const newBookmark = await Bookmark.create({UserId: userId, SongId: songId})
            res.send(newBookmark)
        } catch (err) {
            res.status(500).send({
                err: "An error has occurred trying to create the bookmark!"
            })
         }
    },
    async deleteBookmark (req, res){
        try {
            const {bookmarkId} = req.params
            const deletedBookmark = await Bookmark.findByPk(bookmarkId)
            await deletedBookmark.destroy()
            res.send(deletedBookmark)
        } catch (err) {
            res.status(500).send({
                error: "An error has occurred trying to delete the bookmark!"
            })
         }
    }
}