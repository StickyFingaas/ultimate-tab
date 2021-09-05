
//CommonJS used for compatibility reasons
module.exports = (sequelize, DataTypes) => {
    const Bookmark = sequelize.define('Bookmark', {}) //an empty object at first

    Bookmark.associate = (models) => {
        //1-1 relation to User and Song
        Bookmark.belongsTo(models.User)
        Bookmark.belongsTo(models.Song)
    }

    return Bookmark
}