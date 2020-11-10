"use strict";

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports.getUsuarios = getUsuarios;
exports.createUsuario = createUsuario;
exports.getOneUsuario = getOneUsuario;
exports.updateUsuario = updateUsuario;

var _usuarios = _interopRequireDefault(require("../models/usuarios"));

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { "default": obj }; }

function asyncGeneratorStep(gen, resolve, reject, _next, _throw, key, arg) { try { var info = gen[key](arg); var value = info.value; } catch (error) { reject(error); return; } if (info.done) { resolve(value); } else { Promise.resolve(value).then(_next, _throw); } }

function _asyncToGenerator(fn) { return function () { var self = this, args = arguments; return new Promise(function (resolve, reject) { var gen = fn.apply(self, args); function _next(value) { asyncGeneratorStep(gen, resolve, reject, _next, _throw, "next", value); } function _throw(err) { asyncGeneratorStep(gen, resolve, reject, _next, _throw, "throw", err); } _next(undefined); }); }; }

function getUsuarios(_x, _x2) {
  return _getUsuarios.apply(this, arguments);
}

function _getUsuarios() {
  _getUsuarios = _asyncToGenerator( /*#__PURE__*/regeneratorRuntime.mark(function _callee(req, res) {
    var usuario;
    return regeneratorRuntime.wrap(function _callee$(_context) {
      while (1) {
        switch (_context.prev = _context.next) {
          case 0:
            try {
              usuario = _usuarios["default"].findAll();
              res.json({
                data: usuario
              });
            } catch (error) {
              console.error("Error trayendo datos de Usuario", error);
            }

          case 1:
          case "end":
            return _context.stop();
        }
      }
    }, _callee);
  }));
  return _getUsuarios.apply(this, arguments);
}

function createUsuario(_x3, _x4) {
  return _createUsuario.apply(this, arguments);
}

function _createUsuario() {
  _createUsuario = _asyncToGenerator( /*#__PURE__*/regeneratorRuntime.mark(function _callee2(req, res) {
    var _req$body, nombres_apellidos, id_tipo_identificacion, identificacion, id_tipo_usuario, id_organizacion, email, clave, estado, telefono, newUsuario;

    return regeneratorRuntime.wrap(function _callee2$(_context2) {
      while (1) {
        switch (_context2.prev = _context2.next) {
          case 0:
            _req$body = req.body, nombres_apellidos = _req$body.nombres_apellidos, id_tipo_identificacion = _req$body.id_tipo_identificacion, identificacion = _req$body.identificacion, id_tipo_usuario = _req$body.id_tipo_usuario, id_organizacion = _req$body.id_organizacion, email = _req$body.email, clave = _req$body.clave, estado = _req$body.estado, telefono = _req$body.telefono;
            _context2.prev = 1;
            _context2.next = 4;
            return _usuarios["default"].create({
              nombres_apellidos: nombres_apellidos,
              id_tipo_identificacion: id_tipo_identificacion,
              identificacion: identificacion,
              id_tipo_usuario: id_tipo_usuario,
              id_organizacion: id_organizacion,
              email: email,
              clave: clave,
              estado: estado,
              telefono: telefono
            }, {
              fields: ["nombres_apellidos", "id_tipo_identificacion", "identificacion", "id_tipo_usuario", "id_organizacion", "email", "clave", "estado", "telefono"]
            });

          case 4:
            newUsuario = _context2.sent;

            if (!newUsuario) {
              _context2.next = 7;
              break;
            }

            return _context2.abrupt("return", res.json({
              message: "Usuario creado satisfactóriamente!",
              data: newUsuario
            }));

          case 7:
            _context2.next = 13;
            break;

          case 9:
            _context2.prev = 9;
            _context2.t0 = _context2["catch"](1);
            console.log("Internal Error", _context2.t0);
            res.status(500).json({
              message: "Ocurrió un error",
              data: {}
            });

          case 13:
          case "end":
            return _context2.stop();
        }
      }
    }, _callee2, null, [[1, 9]]);
  }));
  return _createUsuario.apply(this, arguments);
}

function getOneUsuario(_x5, _x6) {
  return _getOneUsuario.apply(this, arguments);
}

function _getOneUsuario() {
  _getOneUsuario = _asyncToGenerator( /*#__PURE__*/regeneratorRuntime.mark(function _callee3(req, res) {
    var id, usuario;
    return regeneratorRuntime.wrap(function _callee3$(_context3) {
      while (1) {
        switch (_context3.prev = _context3.next) {
          case 0:
            _context3.prev = 0;
            id = req.params.id;
            _context3.next = 4;
            return _usuarios["default"].findOne({
              where: {
                id_usuario: id
              }
            });

          case 4:
            usuario = _context3.sent;
            res.json({
              message: usuario
            });
            _context3.next = 11;
            break;

          case 8:
            _context3.prev = 8;
            _context3.t0 = _context3["catch"](0);
            console.log("Ocurrió un error", _context3.t0);

          case 11:
          case "end":
            return _context3.stop();
        }
      }
    }, _callee3, null, [[0, 8]]);
  }));
  return _getOneUsuario.apply(this, arguments);
}

function updateUsuario(_x7, _x8) {
  return _updateUsuario.apply(this, arguments);
}

function _updateUsuario() {
  _updateUsuario = _asyncToGenerator( /*#__PURE__*/regeneratorRuntime.mark(function _callee5(req, res) {
    var id, _req$body2, nombres_apellidos, id_tipo_identificacion, identificacion, id_tipo_usuario, id_organizacion, email, clave, estado, telefono, usuarios;

    return regeneratorRuntime.wrap(function _callee5$(_context5) {
      while (1) {
        switch (_context5.prev = _context5.next) {
          case 0:
            id = req.params.id;
            _req$body2 = req.body, nombres_apellidos = _req$body2.nombres_apellidos, id_tipo_identificacion = _req$body2.id_tipo_identificacion, identificacion = _req$body2.identificacion, id_tipo_usuario = _req$body2.id_tipo_usuario, id_organizacion = _req$body2.id_organizacion, email = _req$body2.email, clave = _req$body2.clave, estado = _req$body2.estado, telefono = _req$body2.telefono;
            _context5.prev = 2;
            _context5.next = 5;
            return _usuarios["default"].findAll({
              attributes: ["nombres_apellidos", "id_tipo_identificacion", "identificacion", "id_tipo_usuario", "id_organizacion", "email", "clave", "estado", "telefono"],
              where: {
                id_usuaro: id
              }
            });

          case 5:
            usuarios = _context5.sent;

            if (usuarios.length > 0) {
              usuarios.forEach( /*#__PURE__*/function () {
                var _ref = _asyncToGenerator( /*#__PURE__*/regeneratorRuntime.mark(function _callee4(usuario) {
                  return regeneratorRuntime.wrap(function _callee4$(_context4) {
                    while (1) {
                      switch (_context4.prev = _context4.next) {
                        case 0:
                          _context4.next = 2;
                          return usuario.update({
                            nombres_apellidos: nombres_apellidos,
                            id_tipo_identificacion: id_tipo_identificacion,
                            identificacion: identificacion,
                            id_tipo_usuario: id_tipo_usuario,
                            id_organizacion: id_organizacion,
                            email: email,
                            clave: clave,
                            estado: estado,
                            telefono: telefono
                          });

                        case 2:
                        case "end":
                          return _context4.stop();
                      }
                    }
                  }, _callee4);
                }));

                return function (_x9) {
                  return _ref.apply(this, arguments);
                };
              }());
              res.json({
                message: "Usuario actualizado",
                data: usuarios
              });
            }

            _context5.next = 13;
            break;

          case 9:
            _context5.prev = 9;
            _context5.t0 = _context5["catch"](2);
            console.error("An error occurred", error);
            res.status(500).json({
              message: "Error Interno",
              data: {}
            });

          case 13:
          case "end":
            return _context5.stop();
        }
      }
    }, _callee5, null, [[2, 9]]);
  }));
  return _updateUsuario.apply(this, arguments);
}