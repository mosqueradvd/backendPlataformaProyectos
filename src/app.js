import express, { json } from "express";
import morgan from "morgan";

//Importing routes
import organizacionRoutes from "./routes/organizaciones";
import usuarioRoutes from "./routes/usuarios";

//initializantion
const app = express();

//middlewares
//muestra por consola lo que va llegando
app.use(morgan("dev"));
//poder consumir un json
app.use(json());

//routes
app.use("/api/organizaciones", organizacionRoutes);
app.use("/api/usuarios", usuarioRoutes);

export default app;
