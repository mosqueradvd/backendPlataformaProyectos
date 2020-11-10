"use strict";

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports["default"] = void 0;

var _express = require("express");

var _usuarios = require("../controllers/usuarios.controller");

var router = (0, _express.Router)();
//api/usuarios
router.get("/", _usuarios.getUsuarios);
router.post("/", _usuarios.createUsuario); // api/usuarios/:id_usuario
// id_uduario = id

router.get("/", _usuarios.getOneUsuario);
router.put("/", _usuarios.updateUsuario);
var _default = router;
exports["default"] = _default;