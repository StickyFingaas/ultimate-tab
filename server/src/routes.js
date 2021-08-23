import AuthenticationControl from "./controllers/AuthenticationControl.js"
import register from "./policies/RegisterPolicy.js"

const route = (app) => {
    app.post('/register', register, AuthenticationControl.register)
    app.post('/login', AuthenticationControl.login)

}


export default route
