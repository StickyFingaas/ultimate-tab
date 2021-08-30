import AuthenticationControl from "./controllers/AuthenticationControl.js"
import SongsControl from "./controllers/SongsControl.js"
import register from "./policies/RegisterPolicy.js"

//we initialize the http request routes and expect an express object argument,
//defined in app.js file, and it gets the control over the http request methods defined below
const route = (app) => {
    app.post('/register', register, AuthenticationControl.register)
    app.post('/login', AuthenticationControl.login)
    app.get('/songs', SongsControl.getAllSongs)
    app.get('/songs/:songId', SongsControl.showSong)
    app.post('/songs', SongsControl.createSong)
    app.put('/songs/:songId', SongsControl.updateSong)

}


export default route