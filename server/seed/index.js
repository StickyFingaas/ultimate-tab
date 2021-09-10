//script file which populates the database with initial data, essentially a setup file
//we define it in package.json -> scripts segment

//db property from ./models/index.js
import db from '../src/models/index.js'

//CommonJS module needed
import { createRequire } from 'module';
const require = createRequire(import.meta.url);

//promise library which allows to convert node modules into promises
//in order use their functions asynchronously;
const delay = require('delay')
const Promise = require('bluebird')
import songs from './songs.json'
import users from './users.json'
import bookmarks from './bookmarks.json'
import histories from './histories.json'


//{force: true} drops all tables upon app build
db.sequelize.sync({force: true}).then(async function () {
    //returns an array of promises
    await Promise.all(users.map(user => {db.User.create(user)})) //creates a new user object for every item in json array of users

    await Promise.all(songs.map(song => {db.Song.create(song)}))

    //Promise.all for bookmarks not working as expected; random solution from web searches did the trick
    //error was - "SequelizeForeignKeyConstraintError SQLITE_CONSTRAINT: FOREIGN KEY constraint failed"
    await delay(1000)

    //must come after first 2 promise functions because it's associated to both models
    await Promise.all(bookmarks.map(bookmark => {db.Bookmark.create(bookmark)}))

    await Promise.all(histories.map(history => {db.History.create(history)}))


})
