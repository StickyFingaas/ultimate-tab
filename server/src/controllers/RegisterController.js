//for storing rest endpoints
import db from "../models/index.js"

const {User} = db
export default {

    // with async-await instead of promises we wait for a successful register
    async register(req, res){
       try {
        const user = await User.create(req.body)
        res.send(user.toJSON())
       } catch (err) {
           res.status(400).send({
               error: `This username is already in use!`
           })
    }
}
}