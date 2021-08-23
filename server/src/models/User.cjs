//promise library which allows to convert node modules into promises
//in order use their functions asynchronously;
//in our case, that would be hashing passwords
const Promise = require('bluebird')
const bcrypt = Promise.promisifyAll(require('bcrypt'))

//does the actual password hashing
function hashPassword(user){
    //salt - random data used as an additional input to a one-way function that hashes data
    const SALT_FACTOR = 8

    //return if User's password property hasn't been changed
    if(!user.changed('password')){
        return
    }

    //using .then keyword because bcrypt is a Promise
    //first asynchronously generate salt, then hash the password, then update the password database value
    return bcrypt.genSalt(SALT_FACTOR)
    .then(salt => bcrypt.hash(user.password, salt, null))
    .then(hash => user.setDataValue('password', hash))
}

//CommonJS used for compatibility reasons
module.exports = (sequelize, DataTypes) => {
    const User = sequelize.define('User', {
        email: {
            type: DataTypes.STRING,
            unique: true
        },
        username: {
            type: DataTypes.STRING,
            unique: true
        },
        password: DataTypes.STRING
    },
    {
        //sequelize hooks - functions which are called before/after a certain sequelize call
        //ex. beforeUpdate can set a value on a model before saving it
        //hooks are only used with models, not instances
        hooks: {
            beforeSave: hashPassword
        }
    }
    )

    //we give the User prototype object a function which compares the input and stored passwords
    User.prototype.comparePassword = function (password) {
        return bcrypt.compare(password, this.password)
    }

    return User
}