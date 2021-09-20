
//CommonJS used for compatibility reasons
module.exports = (sequelize, DataTypes) => {
    const Song = sequelize.define('Song', {
        title: DataTypes.STRING,
        artist: DataTypes.STRING,
        album: DataTypes.STRING,
        genre: DataTypes.STRING,
        year: DataTypes.INTEGER,
        tab: DataTypes.TEXT,
        lyrics: DataTypes.TEXT,
        youtubeId: DataTypes.STRING,
        albumImage: DataTypes.STRING,
        hits: DataTypes.INTEGER
    })

    return Song
}