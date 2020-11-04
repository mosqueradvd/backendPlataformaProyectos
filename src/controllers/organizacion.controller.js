import Organizacion from "../models/organizaciones";

export async function getOrganizaciones(req, res) {
  try {
    const organizacion = await Organizacion.findAll();
    res.json({
      data: organizacion,
    });
  } catch (e) {
    console.log(e);
  }
}

export async function createOrganizacion(req, res) {
  // console.log(req.body);
  const {
    nombre,
    nit_cc,
    representante_legal,
    id_tipo_identificacion,
    identificacion,
    telefono,
    email,
    id_municipio,
    resguardo_cabildo,
  } = req.body;

  try {
    let newOrganizacion = await Organizacion.create(
      {
        nombre,
        nit_cc,
        representante_legal,
        id_tipo_identificacion,
        identificacion,
        telefono,
        email,
        id_municipio,
        resguardo_cabildo,
      },
      {
        fields: [
          "nombre",
          "nit_cc",
          "representante_legal",
          "id_tipo_identificacion",
          "identificacion",
          "telefono",
          "email",
          "id_municipio",
          "resguardo_cabildo",
        ],
      }
    );
    if (newOrganizacion) {
      return res.json({
        message: "Organizacion creada satisfactoriamente",
        data: newOrganizacion,
      });
    }
  } catch (e) {
    res.status(500).json({
      message: "Hubo un error",
      data: {},
    });
  }
}

export async function getOneOrganizacion(req, res) {
  try {
    const { id } = req.params;
    const organizacion = await Organizacion.findOne({
      where: {
        id_organizacion: id,
      },
    });
    res.json({
      data: organizacion,
    });
  } catch (e) {
    console.log(e);
  }
}

export async function updateOrganizacion(req, res) {
  const { id } = req.params;
  const {
    id_organizacion,
    nombre,
    nit_cc,
    representante_legal,
    id_tipo_identificacion,
    identificacion,
    telefono,
    email,
    id_municipio,
    resguardo_cabildo,
  } = req.body;

  try {
    const organizaciones = await Organizacion.findAll({
      atributes: [
        "id_organizacion",
        "nombre",
        "nit_cc",
        "representante_legal",
        "id_tipo_identificacion",
        "identificacion",
        "telefono",
        "email",
        "id_municipio",
        "resguardo_cabildo",
      ],
      where: {
        id_organizacion: id,
      },
    });

    if (organizaciones.length > 0) {
      organizaciones.forEach(async (organizacion) => {
        await organizacion.update({
          nombre,
          nit_cc,
          representante_legal,
          id_tipo_identificacion,
          identificacion,
          telefono,
          email,
          id_municipio,
          resguardo_cabildo,
        });
      });
    }

    return res.json({
      message: "proyecto actualizado",
      data: organizaciones,
    });
  } catch (e) {
    console.log(e),
      res.status(500).json({
        message: "problema interno",
        data: {},
      });
  }
}
