
//CommonJS used for compatibility reasons
module.exports = (sequelize, DataTypes) => {
    const Rating = sequelize.define('Rating', {
        rating: DataTypes.INTEGER,
        
    })

    Rating.associate = (models) => {
        //1-1 relation to User and Song

        //*for User* This is almost the same as belongsTo with one exception - The foreign key will be defined on the target model. 
        //*has to be defined as well in the foreign key model*
        Rating.hasOne(models.User, {as: 'User', foreignKey: 'UserId'})
        Rating.belongsTo(models.Song, {as: 'Song', foreignKey: 'SongId'})
    }

    return Rating
}