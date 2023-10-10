import Joi from "joi";


export const SignupSchema = Joi.object({
        username: Joi.string().required().min(1),
        email: Joi.string().required().min(1).email(),
        password: Joi.string().required(),
        photo_url: Joi.string().required().min(1)
});

export const SiginSchema = Joi.object({
        email: Joi.string().required().min(1).email(),
        password: Joi.string().required().min(1)        
});


