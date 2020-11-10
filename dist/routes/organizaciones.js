"use strict";

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports["default"] = void 0;

var _express = require("express");

var _organizacion = require("../controllers/organizacion.controller");

var router = (0, _express.Router)();
//api/organizaciones
router.post("/", _organizacion.createOrganizacion);
router.get("/", _organizacion.getOrganizaciones); //api/organizaciones/:id_organizacion
// id_organizacion = id

router.get("/:id", _organizacion.getOneOrganizacion);
router.put("/:id", _organizacion.updateOrganizacion);
var _default = router;
exports["default"] = _default;