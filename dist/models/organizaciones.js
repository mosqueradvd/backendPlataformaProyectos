"use strict";

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports["default"] = void 0;

var _sequelize = _interopRequireDefault(require("sequelize"));

var _database = require("../database/database");

var _usuarios = _interopRequireDefault(require("./usuarios"));

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { "default": obj }; }

//modulo
//conexión
var Organizacion = _database.sequelize.define("organizaciones", {
  id_organizacion: {
    type: _sequelize["default"].INTEGER,
    primaryKey: true
  },
  nombre: {
    type: _sequelize["default"].STRING
  },
  nit_cc: {
    type: _sequelize["default"].STRING
  },
  representante_legal: {
    type: _sequelize["default"].STRING
  },
  id_tipo_identificacion: {
    type: _sequelize["default"].INTEGER
  },
  identificacion: {
    type: _sequelize["default"].STRING
  },
  telefono: {
    type: _sequelize["default"].STRING
  },
  email: {
    type: _sequelize["default"].STRING
  },
  id_municipio: {
    type: _sequelize["default"].INTEGER
  },
  resguardo_cabildo: {
    type: _sequelize["default"].STRING
  }
}, {
  timestamps: false
}); // organizaciones tiene muchos usuarios


Organizacion.hasMany(_usuarios["default"], {
  foreingKey: "id_organizacion",
  sourceKey: "id_organizacion"
});

_usuarios["default"].belongsTo(Organizacion, {
  foreingKey: "id_organizacion",
  sourceKey: "id_organizacion"
});

var _default = Organizacion;
exports["default"] = _default;