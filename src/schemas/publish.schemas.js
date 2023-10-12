import Joi from "joi";

export const PublishSchema = Joi.object({
    postUrl: Joi.string().required().min(1),
    postText: Joi.string().allow('')
})