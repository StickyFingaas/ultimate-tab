import  express from 'express'

//easily logs http requests
import morgan from 'morgan'
//essentially enables resource sharing between backend and frontend
import cors from 'cors'

//basic express server
const app = express()

//required string format from morgan API
app.use(morgan('combined'))
//easy parsing of json data
app.use(express.json())

app.use(cors())
app.post('/register', (req, res) => {
    res.send({
        message: `Hello ${req.body.username}! You've registered successfully!`
    })
})

const port = process.env.PORT || 8081

app.listen(port)

