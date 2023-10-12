import { Router } from "express";
import signRouter from "./sign.routes.js";
import publishRouter from "./publish.routes.js";



const router = Router();

router.use(signRouter);
router.use(publishRouter);


export default router;