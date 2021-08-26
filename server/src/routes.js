import AuthenticationControl from "./controllers/AuthenticationControl.js"
import SongsControl from "./controllers/SongsControl.js"
import register from "./policies/RegisterPolicy.js"

const route = (app) => {
    app.post('/register', register, AuthenticationControl.register)
    app.post('/login', AuthenticationControl.login)
    app.get('/songs', SongsControl.getAllSongs)
    app.post('/songs', SongsControl.createSong)

}


export default route
