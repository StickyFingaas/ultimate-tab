//database connection file

import fs from 'fs'
import path from 'path'
import Sequelize from 'sequelize'
import config from '../config.js'

//for acquiring file path of index.js
import { fileURLToPath } from 'url';
import { dirname } from 'path';

//CommonJS module needed
import { createRequire } from 'module';
const require = createRequire(import.meta.url);

const db = {}

const __filename = fileURLToPath(import.meta.url);
const __dirname = dirname(__filename);

const sequelize = new Sequelize(
    config.db.database,
    //config.db.email,
    config.db.username,
    config.db.password,
    config.db.options
)

//looks for all files in model folder and loads them into sequelize object

// __dirname - path of the folder where the current JavaScript file resides
fs.readdirSync(__dirname).filter(file => file !== 'index.js').forEach(file => {
    //const model = sequelize.import(path.join(__dirname, file))
    //exception for using CommonJS syntax
    const model = require(path.join(__dirname, file))(sequelize, Sequelize.DataTypes)
    //first argument of sequelize.define() in every model file is a name
    db[model.name] = model
})


//attaches the sequelize object to the file
db.sequelize = sequelize
//attaches the Sequelize library to the file
db.Sequelize = Sequelize

export default db