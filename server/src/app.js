import  express from 'express'
//easily logs http requests
import morgan from 'morgan'
//essentially enables resource sharing between backend and frontend
import cors from 'cors'
//port is in its separate file, for db connection needs
import config from './config.js'
//db property from ./models/index.js
import db from './models/index.js'
//all http requests are set in this file
import route from './routes.js'

//basic express server
const app = express()

//required string format from morgan API
app.use(morgan('combined'))
//easy parsing of json data
app.use(express.json())
app.use(cors())


route(app)

//force: true drops all tables upon app build
db.sequelize.sync({force: true}).then(() => {
    app.listen(config.port)
    console.log(`Server started on port ${config.port}`);
}).catch((err) => {
    console.log(err);
})

