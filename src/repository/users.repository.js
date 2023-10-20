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

export async function getPostsByUserDB(idUser) {
  return db.query(
    `SELECT posts.*, users.username, users."pictureUrl", COUNT("idPost")AS likes,
      JSON_AGG(COALESCE((likes."idUser"), 0))  AS "usersLikes"
    FROM posts
    LEFT JOIN users ON users.id = posts."idUser"
    LEFT JOIN likes ON likes."idPost" = posts.id
    WHERE posts."idUser" = $1
    GROUP BY posts.id, users.id
    ORDER BY "createdAt" DESC
    LIMIT 20;`,
    [idUser]
  )
}

export async function searchUsersDB(searchString) {
  return db.query(
  `SELECT id, username, "pictureUrl"
    FROM users
    WHERE username like $1
  `, [searchString])
}