"use strict";

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports.getOrganizaciones = getOrganizaciones;
exports.createOrganizacion = createOrganizacion;
exports.getOneOrganizacion = getOneOrganizacion;
exports.updateOrganizacion = updateOrganizacion;

var _organizaciones = _interopRequireDefault(require("../models/organizaciones"));

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { "default": obj }; }

function asyncGeneratorStep(gen, resolve, reject, _next, _throw, key, arg) { try { var info = gen[key](arg); var value = info.value; } catch (error) { reject(error); return; } if (info.done) { resolve(value); } else { Promise.resolve(value).then(_next, _throw); } }

function _asyncToGenerator(fn) { return function () { var self = this, args = arguments; return new Promise(function (resolve, reject) { var gen = fn.apply(self, args); function _next(value) { asyncGeneratorStep(gen, resolve, reject, _next, _throw, "next", value); } function _throw(err) { asyncGeneratorStep(gen, resolve, reject, _next, _throw, "throw", err); } _next(undefined); }); }; }

function getOrganizaciones(_x, _x2) {
  return _getOrganizaciones.apply(this, arguments);
}

function _getOrganizaciones() {
  _getOrganizaciones = _asyncToGenerator( /*#__PURE__*/regeneratorRuntime.mark(function _callee(req, res) {
    var organizacion;
    return regeneratorRuntime.wrap(function _callee$(_context) {
      while (1) {
        switch (_context.prev = _context.next) {
          case 0:
            _context.prev = 0;
            _context.next = 3;
            return _organizaciones["default"].findAll();

          case 3:
            organizacion = _context.sent;
            res.json({
              data: organizacion
            });
            _context.next = 10;
            break;

          case 7:
            _context.prev = 7;
            _context.t0 = _context["catch"](0);
            console.log(_context.t0);

          case 10:
          case "end":
            return _context.stop();
        }
      }
    }, _callee, null, [[0, 7]]);
  }));
  return _getOrganizaciones.apply(this, arguments);
}

function createOrganizacion(_x3, _x4) {
  return _createOrganizacion.apply(this, arguments);
}

function _createOrganizacion() {
  _createOrganizacion = _asyncToGenerator( /*#__PURE__*/regeneratorRuntime.mark(function _callee2(req, res) {
    var _req$body, nombre, nit_cc, representante_legal, id_tipo_identificacion, identificacion, telefono, email, id_municipio, resguardo_cabildo, newOrganizacion;

    return regeneratorRuntime.wrap(function _callee2$(_context2) {
      while (1) {
        switch (_context2.prev = _context2.next) {
          case 0:
            // console.log(req.body);
            _req$body = req.body, nombre = _req$body.nombre, nit_cc = _req$body.nit_cc, representante_legal = _req$body.representante_legal, id_tipo_identificacion = _req$body.id_tipo_identificacion, identificacion = _req$body.identificacion, telefono = _req$body.telefono, email = _req$body.email, id_municipio = _req$body.id_municipio, resguardo_cabildo = _req$body.resguardo_cabildo;
            _context2.prev = 1;
            _context2.next = 4;
            return _organizaciones["default"].create({
              nombre: nombre,
              nit_cc: nit_cc,
              representante_legal: representante_legal,
              id_tipo_identificacion: id_tipo_identificacion,
              identificacion: identificacion,
              telefono: telefono,
              email: email,
              id_municipio: id_municipio,
              resguardo_cabildo: resguardo_cabildo
            }, {
              fields: ["nombre", "nit_cc", "representante_legal", "id_tipo_identificacion", "identificacion", "telefono", "email", "id_municipio", "resguardo_cabildo"]
            });

          case 4:
            newOrganizacion = _context2.sent;

            if (!newOrganizacion) {
              _context2.next = 7;
              break;
            }

            return _context2.abrupt("return", res.json({
              message: "Organizacion creada satisfactoriamente",
              data: newOrganizacion
            }));

          case 7:
            _context2.next = 13;
            break;

          case 9:
            _context2.prev = 9;
            _context2.t0 = _context2["catch"](1);
            console.log("Internal Error", _context2.t0);
            res.status(500).json({
              message: "Hubo un error",
              data: {}
            });

          case 13:
          case "end":
            return _context2.stop();
        }
      }
    }, _callee2, null, [[1, 9]]);
  }));
  return _createOrganizacion.apply(this, arguments);
}

function getOneOrganizacion(_x5, _x6) {
  return _getOneOrganizacion.apply(this, arguments);
}

function _getOneOrganizacion() {
  _getOneOrganizacion = _asyncToGenerator( /*#__PURE__*/regeneratorRuntime.mark(function _callee3(req, res) {
    var id, organizacion;
    return regeneratorRuntime.wrap(function _callee3$(_context3) {
      while (1) {
        switch (_context3.prev = _context3.next) {
          case 0:
            _context3.prev = 0;
            id = req.params.id;
            _context3.next = 4;
            return _organizaciones["default"].findOne({
              where: {
                id_organizacion: id
              }
            });

          case 4:
            organizacion = _context3.sent;
            res.json({
              data: organizacion
            });
            _context3.next = 11;
            break;

          case 8:
            _context3.prev = 8;
            _context3.t0 = _context3["catch"](0);
            console.error("Error fetching data", _context3.t0);

          case 11:
          case "end":
            return _context3.stop();
        }
      }
    }, _callee3, null, [[0, 8]]);
  }));
  return _getOneOrganizacion.apply(this, arguments);
}

function updateOrganizacion(_x7, _x8) {
  return _updateOrganizacion.apply(this, arguments);
}

function _updateOrganizacion() {
  _updateOrganizacion = _asyncToGenerator( /*#__PURE__*/regeneratorRuntime.mark(function _callee5(req, res) {
    var id, _req$body2, id_organizacion, nombre, nit_cc, representante_legal, id_tipo_identificacion, identificacion, telefono, email, id_municipio, resguardo_cabildo, organizaciones;

    return regeneratorRuntime.wrap(function _callee5$(_context5) {
      while (1) {
        switch (_context5.prev = _context5.next) {
          case 0:
            id = req.params.id;
            _req$body2 = req.body, id_organizacion = _req$body2.id_organizacion, nombre = _req$body2.nombre, nit_cc = _req$body2.nit_cc, representante_legal = _req$body2.representante_legal, id_tipo_identificacion = _req$body2.id_tipo_identificacion, identificacion = _req$body2.identificacion, telefono = _req$body2.telefono, email = _req$body2.email, id_municipio = _req$body2.id_municipio, resguardo_cabildo = _req$body2.resguardo_cabildo;
            _context5.prev = 2;
            _context5.next = 5;
            return _organizaciones["default"].findAll({
              atributes: ["id_organizacion", "nombre", "nit_cc", "representante_legal", "id_tipo_identificacion", "identificacion", "telefono", "email", "id_municipio", "resguardo_cabildo"],
              where: {
                id_organizacion: id
              }
            });

          case 5:
            organizaciones = _context5.sent;

            if (organizaciones.length > 0) {
              organizaciones.forEach( /*#__PURE__*/function () {
                var _ref = _asyncToGenerator( /*#__PURE__*/regeneratorRuntime.mark(function _callee4(organizacion) {
                  return regeneratorRuntime.wrap(function _callee4$(_context4) {
                    while (1) {
                      switch (_context4.prev = _context4.next) {
                        case 0:
                          _context4.next = 2;
                          return organizacion.update({
                            nombre: nombre,
                            nit_cc: nit_cc,
                            representante_legal: representante_legal,
                            id_tipo_identificacion: id_tipo_identificacion,
                            identificacion: identificacion,
                            telefono: telefono,
                            email: email,
                            id_municipio: id_municipio,
                            resguardo_cabildo: resguardo_cabildo
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
            }

            return _context5.abrupt("return", res.json({
              message: "organización actualizada",
              data: organizaciones
            }));

          case 10:
            _context5.prev = 10;
            _context5.t0 = _context5["catch"](2);
            console.log(_context5.t0), res.status(500).json({
              message: "problema interno",
              data: {}
            });

          case 13:
          case "end":
            return _context5.stop();
        }
      }
    }, _callee5, null, [[2, 10]]);
  }));
  return _updateOrganizacion.apply(this, arguments);
}