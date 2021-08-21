import RegisterController from "./controllers/RegisterController.js"
import register from "./policies/RegisterPolicy.js"

const route = (app) => {
    app.post('/register', register, RegisterController.register)
}


export default route
