import { Router } from "express";
import signRouter from "./sign.routes.js";



const router = Router();

router.use(signRouter);



export default router;