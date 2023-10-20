import { Router } from "express";
import { validateAuth } from "../middlewares/validateAuth.js";
import { getPostsByUser, getUsersBySearch } from "../controllers/users.controller.js";

const usersRouter = Router();

usersRouter.get("/users/:idUser", validateAuth , getPostsByUser);
usersRouter.get("/users", validateAuth, getUsersBySearch);

export default usersRouter;