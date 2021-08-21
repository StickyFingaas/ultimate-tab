//registration validation
import Joi from 'joi'

const register = (req, res, next) => {
    const schema = Joi.object({
        username: Joi.string().min(3).required(),
        password: Joi.string().regex(new RegExp(/[\d\w]{8,16}/))
    })

    const {error, value} = schema.validate(req.body)

    if(error){
        switch (error.details[0].context.key){
            case 'username':
                res.status(400).send({
                    error: 'Your username must contain minimum 3 characters!'
                })
                break
            case 'password':
                res.status(400).send({
                    error: 'Your password must be 8-16 characters long and only contain letters and numbers!'
                })
                break

        }
    }else{
        //executes the next middleware function it encounters
        next()
    }
}

export default register