//module with validation logic separate from main passport.js module

import passport from 'passport';

export default function (req, res, next){
    passport.authenticate('jwt', function (err, user) {//jwt stands for the authorization header which is checked
        if(err || !user) { //in passport.js we send null if the user is not defined
            res.status(403).send({
            error: 'You do not have access to this resource!'
        })
        }else{ //otherwise, if the user is proven to be logged in -
            //if the JWT token is validated against the secret string stored in config file
            req.user = user
            next() //express middleware function which calls the execution of the next middleware function

        }
    })(req, res, next) //immediately-invoked function expression within a function (passport authenticate syntax)
}