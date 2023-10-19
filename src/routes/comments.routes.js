import { Router } from "express";
import { validateAuth } from "../middlewares/validateAuth.js";
import { createComment } from "../controllers/comments.controller.js";

const commentsRouter = Router();

commentsRouter.post("/comments", validateAuth, createComment);

export default commentsRouter;
