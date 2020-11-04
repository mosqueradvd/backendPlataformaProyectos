import { Router } from "express";
const router = Router();

import {
  createOrganizacion,
  getOrganizaciones,
  getOneOrganizacion,
  updateOrganizacion,
} from "../controllers/organizacion.controller";

//api/organizaciones
router.post("/", createOrganizacion);
router.get("/", getOrganizaciones);

//api/organizaciones/:id_organizacion
// id_organizacion = id
router.get("/:id", getOneOrganizacion);
router.put("/:id", updateOrganizacion);

export default router;
