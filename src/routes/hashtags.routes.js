import { Router } from "express";
import { validateAuth } from "../middlewares/validateAuth.js";
import {
  getTrending,
  getHashtagPosts,
} from "../controllers/hashtags.controller.js";

const hashtagsRouter = Router();

hashtagsRouter.get("/trending", validateAuth, getTrending);
hashtagsRouter.get("/hashtag/:hashtag", getHashtagPosts);

export default hashtagsRouter;
