import db from "../models/index.js" //for storing rest endpoints
const {Bookmark, Song} = db

import _ from 'lodash' //all functionalities from lodash library

export default {
    async getBookmark (req, res){
            try {
                //const songId = req.query.songId
                //returns the user's bookmarked songs
                const {songId, userId} = req.query

                const condition = {
                    UserId: userId //for getting all of user's bookmarks we only need his id
                }

                if(songId){
                    condition.SongId = songId //optionally, for a specific bookmark
                }

                const bookmarks = await Bookmark.findAll({
                        where: condition,
                        include: [
                            {
                                model: Song//also returns the data about the song which is bookmarked
                            }
                        ]
                })
                //also it's better to map an array (of objects) after it's asynchronously retrieved
                //extend function assigns the song object to a new object containing the bookmark id
                const newBookmarks = bookmarks.map(bookmark => bookmark.toJSON()).map(bookmark => _.extend(
                    {},
                    bookmark.Song,
                    bookmark))
                res.send(newBookmarks)
            } catch (err) {
                console.log(err);
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