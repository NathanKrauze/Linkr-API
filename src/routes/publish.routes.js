import { Router } from "express";
import { validateSchema } from "../middlewares/validate.schema.js";
import { PublishSchema } from "../schemas/publish.schemas.js";
import { validateAuth } from "../middlewares/validateAuth.js";
import { getTimeline, postPublish } from "../controllers/publish.controller.js";



const publishRouter = Router();

publishRouter.post("/publish",validateAuth, validateSchema(PublishSchema), postPublish);
publishRouter.get("/timeline", validateAuth, getTimeline);

export default publishRouter;