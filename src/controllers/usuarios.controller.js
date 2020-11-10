import Usuario from "../models/usuarios";

export async function getUsuarios(req, res) {
  try {
    const usuario = Usuario.findAll();
    res.json({
      data: usuario,
    });
  } catch (error) {
    console.error("Error trayendo datos de Usuario", error);
  }
}

export async function createUsuario(req, res) {
  const {
    nombres_apellidos,
    id_tipo_identificacion,
    identificacion,
    id_tipo_usuario,
    id_organizacion,
    email,
    clave,
    estado,
    telefono,
  } = req.body;

  try {
    let newUsuario = await Usuario.create(
      {
        nombres_apellidos,
        id_tipo_identificacion,
        identificacion,
        id_tipo_usuario,
        id_organizacion,
        email,
        clave,
        estado,
        telefono,
      },
      {
        fields: [
          "nombres_apellidos",
          "id_tipo_identificacion",
          "identificacion",
          "id_tipo_usuario",
          "id_organizacion",
          "email",
          "clave",
          "estado",
          "telefono",
        ],
      }
    );
    if (newUsuario) {
      return res.json({
        message: "Usuario creado satisfactóriamente!",
        data: newUsuario,
      });
    }
  } catch (error) {
    console.log("Internal Error", error);
    res.status(500).json({
      message: "Ocurrió un error",
      data: {},
    });
  }
}

export async function getOneUsuario(req, res) {
  try {
    const { id } = req.params;
    const usuario = await Usuario.findOne({
      where: {
        id_usuario: id,
      },
    });
    res.json({
      message: usuario,
    });
  } catch (error) {
    console.log("Ocurrió un error", error);
  }
}

export async function updateUsuario(req, res) {
  const { id } = req.params;
  const {
    nombres_apellidos,
    id_tipo_identificacion,
    identificacion,
    id_tipo_usuario,
    id_organizacion,
    email,
    clave,
    estado,
    telefono,
  } = req.body;

  try {
    const usuarios = await Usuario.findAll({
      attributes: [
        "nombres_apellidos",
        "id_tipo_identificacion",
        "identificacion",
        "id_tipo_usuario",
        "id_organizacion",
        "email",
        "clave",
        "estado",
        "telefono",
      ],
      where: {
        id_usuaro: id,
      },
    });

    if (usuarios.length > 0) {
      usuarios.forEach(async (usuario) => {
        await usuario.update({
          nombres_apellidos,
          id_tipo_identificacion,
          identificacion,
          id_tipo_usuario,
          id_organizacion,
          email,
          clave,
          estado,
          telefono,
        });
      });

      res.json({
        message: "Usuario actualizado",
        data: usuarios,
      });
    }
  } catch (e) {
    console.error("An error occurred", error);
    res.status(500).json({
      message: "Error Interno",
      data: {},
    });
  }
}
