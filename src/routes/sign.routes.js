import { Router } from "express";
import { postSignin, postSignup } from "../controllers/sign.controller.js";
import { validateSchema } from "../middlewares/validate.schema.js";
import { SiginSchema, SignupSchema } from "../schemas/sign.schemas.js";

const signRouter = Router();

signRouter.post("/signup", validateSchema(SignupSchema), postSignup);
signRouter.post("/signin", validateSchema(SiginSchema), postSignin);

export default signRouter;
