import db from "../models/index.js" //for storing rest endpoints
const {Rating, Song} = db

import _ from 'lodash' //all functionalities from lodash library

export default {
    async getRating (req, res){
            try {
                //const {userId, songId} = req.query - before JWT authorization
                const userId = req.user.id // user which is confirmed to have a valid JWT token - check AuthorizationPolicy.js
                const {songId} = req.query //returns the user's bookmarked songs
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
                    error: "An error has occurred trying to fetch the ratings!"
                })
             }

    },
    async createRating (req, res){
        try {
            //const {userId, songId} = req.query - before JWT authorization
            const userId = req.user.id // user which is confirmed to have a valid JWT token - check AuthorizationPolicy.js
            const {songId} = req.body
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
    async deleteRating (req, res){
        try {
            const userId = req.user.id // user which is confirmed to have a valid JWT token - check AuthorizationPolicy.js
            const {bookmarkId} = req.params
            const bookmark = await Bookmark.findOne({
                where: {
                    id: bookmarkId,
                    UserId: userId
                }
            })
            if(!bookmark){
                return res.status(403).send({
                    error: "You do not have access to this bookmark!"
                })
            }
            await bookmark.destroy()
            res.send(bookmark)
        } catch (err) {
            res.status(500).send({
                error: "An error has occurred trying to delete the bookmark!"
            })
         }
    }
}