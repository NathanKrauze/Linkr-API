import db from "../database/database.connection.js";

export async function postSessionDB(token, idUser) {
  return db.query(`INSERT INTO sessions (token, "idUser") VALUES ($1, $2);`, [
    token,
    idUser,
  ]);
}
