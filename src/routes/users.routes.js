import { Router } from "express";
import { validateAuth } from "../middlewares/validateAuth.js";
import { getPostsByUser, getUsersBySearch } from "../controllers/users.controller.js";
import { validateSchema } from "../middlewares/validate.schema.js";
import { searchUserSchema } from "../schemas/users.schemas.js";

const usersRouter = Router();

usersRouter.get("/users/:idUser", validateAuth , getPostsByUser);
usersRouter.get("/users", validateAuth, validateSchema(searchUserSchema), getUsersBySearch);

export default usersRouter;