
export default {
    port: process.env.PORT || 8081,
    db: {
        database: process.env.DB_NAME || 'ultimatetab',
        username: process.env.DB_USERNAME || 'ultimatetab',
        password: process.env.DB_PASSWORD || 'ultimatetab',
        options: {
            dialect: process.env.DIALECT || 'postgres',
            host: process.env.HOST || 'localhost',
            storage: './ultimatetab.postgres'
        }
    }
}