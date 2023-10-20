import Joi from "joi";

export const searchUserSchema = Joi.object({
    searchString: Joi.string().pattern(/%$/).required()
})