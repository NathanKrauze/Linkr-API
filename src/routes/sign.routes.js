import { Router } from "express";
import { postSignin, postSignup } from "../controllers/sign.controller.js";
import { validateSchema } from "../middlewares/validate.schema.js";
import { SiginSchema, SignupSchema } from "../schemas/app.schemas.js";



const signRouter = Router();

signRouter.post("/signup", validateSchema(SignupSchema), postSignup);
signRouter.post("/",validateSchema(SiginSchema), postSignin);

export default signRouter;