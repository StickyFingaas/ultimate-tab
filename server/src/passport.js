import passport from 'passport';
import config from './config.js' //for the secret authentication string
import db from "./models/index.js" //for storing rest endpoints
const {User} = db

//for CommonJS module functions
import { createRequire } from 'module';
const require = createRequire(import.meta.url);

//A Passport strategy (module) for authorizing endpoints with a JSON Web Token.
//It is intended to be used to secure RESTful endpoints without sessions.
const JwtStrategy = require('passport-jwt').Strategy
const ExtractJwt = require('passport-jwt').ExtractJwt; //helper function

passport.use(new JwtStrategy({ //takes in options (object) and callbacks functions as arguments
    jwtFromRequest: ExtractJwt.fromAuthHeaderAsBearerToken(), //function which requests the JWT token, returns either the string w/ the token or null
    secretOrKey: config.authentication.jwtSecret //string which verifies token's signature
}, async function(jwtPayload, done){ //function for sending responses based on JWT payload validity
    try {
        const user = await User.findOne({
            where: {
                id: jwtPayload.id
            }
        })
        return (!user) ? done(new Error(), false) : done(null, user)
    } catch (error) {
        return done(new Error(), false)
    }
}))

export default null