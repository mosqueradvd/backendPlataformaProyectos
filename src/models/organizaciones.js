//modulo
import Sequelize from "sequelize";
//conexión
import { sequelize } from "../database/database";
import usuarios from "./usuarios";

const Organizacion = sequelize.define(
  "organizaciones",
  {
    id_organizacion: {
      type: Sequelize.INTEGER,
      primaryKey: true,
    },
    nombre: {
      type: Sequelize.STRING,
    },
    nit_cc: {
      type: Sequelize.STRING,
    },
    representante_legal: {
      type: Sequelize.STRING,
    },
    id_tipo_identificacion: {
      type: Sequelize.INTEGER,
    },
    identificacion: {
      type: Sequelize.STRING,
    },
    telefono: {
      type: Sequelize.STRING,
    },
    email: {
      type: Sequelize.STRING,
    },
    id_municipio: {
      type: Sequelize.INTEGER,
    },
    resguardo_cabildo: {
      type: Sequelize.STRING,
    },
  },
  {
    timestamps: false,
  }
);

// organizaciones tiene muchos usuarios
Organizacion.hasMany(usuarios, {
  foreignKey: "id_organizacion",
  sourceKey: "id_organizacion",
});
usuarios.belongsTo(Organizacion, {
  foreignKey: "id_organizacion",
  sourceKey: "id_organizacion",
});

export default Organizacion;
