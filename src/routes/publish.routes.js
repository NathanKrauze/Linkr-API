import { Router } from "express";
import { validateSchema } from "../middlewares/validate.schema.js";
import { PublishSchema, UpdationSchema } from "../schemas/publish.schemas.js";
import { validateAuth } from "../middlewares/validateAuth.js";
import { deletePostById, getTimeline, postPublish, postUpdate } from "../controllers/publish.controller.js";



const publishRouter = Router();

publishRouter.post("/publish",validateAuth, validateSchema(PublishSchema), postPublish);
publishRouter.get("/timeline", validateAuth, getTimeline);
publishRouter.post("/update-post/:id", validateAuth,validateSchema(UpdationSchema), postUpdate);
publishRouter.delete("/delete/:id", validateAuth, deletePostById);

export default publishRouter;