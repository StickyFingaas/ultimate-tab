
//CommonJS used for compatibility reasons
module.exports = (sequelize, DataTypes) => {
    const Rating = sequelize.define('Rating', {
        rating: DataTypes.INTEGER,
        
    })

    Rating.associate = (models) => {
        //1-1 relation to User and Song
        Rating.belongsTo(models.User)
        Rating.belongsTo(models.Song)
    }

    return Rating
}