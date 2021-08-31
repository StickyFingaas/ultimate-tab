//script file which populates the database with initial data, essentially a setup file
//we define it in package.json -> scripts segment

//db property from ./models/index.js
import db from '../src/models/index.js'

//CommonJS module needed
import { createRequire } from 'module';
const require = createRequire(import.meta.url);

//promise library which allows to convert node modules into promises
//in order use their functions asynchronously;
const Promise = require('bluebird')
import songs from './songs.json'
import users from './users.json'

//{force: true} drops all tables upon app build
db.sequelize.sync({force: true}).then(async function () {
    //returns an array of promises
    await Promise.all(users.map(user => {db.User.create(user)})) //creates a new user object for every item in json array of users

    await Promise.all(songs.map(song => {db.Song.create(song)})) //creates a new user object for every item in json array of users
})
