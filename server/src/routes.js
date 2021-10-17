import AuthenticationControl from "./controllers/AuthenticationControl.js"
import SongsControl from "./controllers/SongsControl.js"
import BookmarksControl from "./controllers/BookmarksControl.js"
import HistoriesControl from "./controllers/HistoriesControl.js"
import RatingsControl from "./controllers/RatingsControl.js"
import register from "./policies/RegisterPolicy.js"
import authorize from './policies/AuthorizationPolicy.js' // REST endpoints for which we want to check user authorization should contain this imported module

//we initialize the http request routes and expect an express object argument,
//defined in app.js file, and it gets the control over the http request methods defined below
const route = (app) => {
    app.post('/register', register, AuthenticationControl.register)
    app.post('/login', AuthenticationControl.login)
    app.get('/songs', SongsControl.getAllSongs)
    app.get('/songs/:songId', SongsControl.showSong)
    app.post('/songs', SongsControl.createSong)
    app.put('/songs/:songId', SongsControl.updateSong)
    app.get('/bookmarks', authorize, BookmarksControl.getBookmark)
    app.post('/bookmarks', authorize, BookmarksControl.createBookmark)
    app.delete('/bookmarks/:bookmarkId', authorize, BookmarksControl.deleteBookmark)
    app.get('/history', authorize, HistoriesControl.getHistory)
    app.post('/history', authorize, HistoriesControl.createHistory)
    app.post('/ratings', RatingsControl.createRating)
    // app.put('/ratings/:ratingId', authorize, RatingsControl.updateRating)
    // app.delete('/ratings/:ratingId', authorize, RatingsControl.deleteRating)
    app.get('/ratings/:songId', RatingsControl.getSongRatings)

}


export default route
