"use strict";

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports["default"] = void 0;

var _sequelize = _interopRequireDefault(require("sequelize"));

var _database = require("../database/database");

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { "default": obj }; }

//conexión
var usuarios = _database.sequelize.define("usuarios", {
  id_usuario: {
    type: _sequelize["default"].INTEGER,
    primaryKey: true
  },
  nombres_apellidos: {
    type: _sequelize["default"].STRING
  },
  id_tipo_identificacion: {
    type: _sequelize["default"].INTEGER
  },
  identificacion: {
    type: _sequelize["default"].STRING
  },
  id_tipo_usuario: {
    type: _sequelize["default"].INTEGER
  },
  id_organizacion: {
    type: _sequelize["default"].INTEGER
  },
  email: {
    type: _sequelize["default"].STRING
  },
  clave: {
    type: _sequelize["default"].STRING
  },
  estado: {
    type: _sequelize["default"].BOOLEAN
  },
  telefono: {
    type: _sequelize["default"].STRING
  }
}, {
  timestamps: false
});

var _default = usuarios;
exports["default"] = _default;