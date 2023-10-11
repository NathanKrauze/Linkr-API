import db from "../database/database.connection.js";

export async function getUserByEmailDB(email) {
  return db.query(`SELECT * FROM users WHERE email = $1;`, [email]);
}

export async function postUserDB(username, email, password, pictureUrl) {
  return db.query(
    `INSERT INTO users (username, email, password, "pictureUrl") VALUES ($1, $2, $3, $4);`,
    [username, email, password, pictureUrl]
  );
}

export async function getUserByIdDB(idUser) {
  return db.query(`SELECT * FROM users WHERE id = $1;`, [idUser]);
}
