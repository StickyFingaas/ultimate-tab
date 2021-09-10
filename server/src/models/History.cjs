
//CommonJS used for compatibility reasons
module.exports = (sequelize, DataTypes) => {
    const History = sequelize.define('History', {}) //an empty object at first

    History.associate = (models) => {
        //1-1 relation to User and Song
        History.belongsTo(models.User)
        History.belongsTo(models.Song)
    }

    return History
}