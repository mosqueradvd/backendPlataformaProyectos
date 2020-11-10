import Sequelize from "sequelize";
//conexión
import { sequelize } from "../database/database";
import Organizacion from "./organizaciones";

const usuarios = sequelize.define(
  "usuarios",
  {
    id_usuario: {
      type: Sequelize.INTEGER,
      primaryKey: true,
    },
    nombres_apellidos: {
      type: Sequelize.STRING,
    },
    id_tipo_identificacion: {
      type: Sequelize.INTEGER,
    },
    identificacion: {
      type: Sequelize.STRING,
    },
    id_tipo_usuario: {
      type: Sequelize.INTEGER,
    },
    id_organizacion: {
      type: Sequelize.INTEGER,
    },
    email: {
      type: Sequelize.STRING,
    },
    clave: {
      type: Sequelize.STRING,
    },
    estado: {
      type: Sequelize.BOOLEAN,
    },
    telefono: {
      type: Sequelize.STRING,
    },
  },
  {
    timestamps: false,
  }
);

export default usuarios;
