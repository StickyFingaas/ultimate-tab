
export default {
    port: process.env.PORT || 8081,
    db: {
        database: process.env.DB_NAME || 'ultimatetab',
        email: process.env.DB_EMAIL || 'ultimatetab@mail.com',
        username: process.env.DB_USERNAME || 'ultimatetab',
        password: process.env.DB_PASSWORD || 'ultimatetab',
        options: {
            dialect: 'postgres',
            host: process.env.HOST || 'localhost',
            storage: './ultimatetab.postgres'
        }
    },
    //jwt authentication
    authentication: {
        //secret string known only by server, by which the incoming token validity is checked
        jwtSecret: process.env.JWT_SECRET || 'secret'
    }
}