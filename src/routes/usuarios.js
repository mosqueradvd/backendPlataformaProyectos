import { Router } from "express";
const router = Router();

import {
  createUsuario,
  getUsuarios,
  getOneUsuario,
  updateUsuario,
} from "../controllers/usuarios.controller";

//api/usuarios

router.post("/", createUsuario);
router.get("/", getUsuarios);

// api/usuarios/:id_usuario
// id_uduario = id

router.get("/:id", getOneUsuario);
router.put("/:id", updateUsuario);

export default router;
