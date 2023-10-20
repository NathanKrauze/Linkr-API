import { Router } from "express";
import signRouter from "./sign.routes.js";
import publishRouter from "./publish.routes.js";
import hashtagsRouter from "./hashtags.routes.js";
import commentsRouter from "./comments.routes.js";
import usersRouter from "./users.routes.js";

const router = Router();

router.use(signRouter);
router.use(publishRouter);
router.use(hashtagsRouter);
router.use(commentsRouter);
router.use(usersRouter);

export default router;
