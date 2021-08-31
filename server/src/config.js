import path from 'path'
import { dirname } from 'path';

const __dirname = dirname('../../ultimatetab.postgres');

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
            //storage: './ultimatetab.postgres' //path for the file which loads the configuration
            storage: path.resolve(__dirname)
        }
    },
    //jwt authentication
    authentication: {
        //secret string known only by server, by which the incoming token validity is checked
        jwtSecret: process.env.JWT_SECRET || 'secret'
    }
}