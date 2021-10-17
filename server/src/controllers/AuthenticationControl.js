//for storing rest endpoints
import db from "../models/index.js"
//using json web token for authentication
import jwt from 'jsonwebtoken'
import config from '../config.js'

const {User} = db

//helper function for sending a jwt token to validate user login
function jwtSignUser(user){
    const ONE_WEEK = 60 * 60 * 24 * 7
    return jwt.sign(user, config.authentication.jwtSecret, { //creates a JWT string payload which is later used for endpoint authentication
        expiresIn: ONE_WEEK
    })
}
export default {

    // with async-await instead of promises we wait for a successful register
    async register(req, res){
       try {
        const user = await User.create(req.body)
        const userJson = user.toJSON()
            res.send({
                user: userJson,
                //returning the jwt token with user info
                token: jwtSignUser(userJson)
            })
       } catch (err) {
           res.status(400).send({
               error: `This username is already in use!`
           })
        }
    },

    async login(req, res){
        try {
            const {email, password} = req.body
            //find a matching user in the database if exists
            const user = await User.findOne({
                where: {
                    email: email
                }
            })
            const isPasswordValid = await user.comparePassword(password)

            if(!user){
                //403 - authentication error
                res.status(403).send({
                    error: "User is not registered!"
                })
            }
            if(!isPasswordValid){
                res.status(403).send({
                    error: "Incorrect password!"
                })
            }

            const userJson = user.toJSON()
            res.send({
                user: userJson,
                //returning the jwt token with user info
                token: jwtSignUser(userJson)
            })
        } catch (err) {
            res.status(400).send({
                error: 'There has been an error while trying to log in!'
            })
     }
    }
}