import db from "../database/database.connection.js";

export async function postAtTimeline(idUser, postUrl, postText) {
  return db.query(
    `INSERT INTO posts 
    ("idUser", "postUrl", "postText") 
    VALUES ($1, $2, $3) RETURNING id;`,
    [idUser, postUrl, postText]
  );
}

export async function getAllPosts() {
  return db.query(`SELECT posts.*, users.username, users."pictureUrl" 
    FROM posts
	JOIN users ON users.id = posts."idUser"
    ORDER BY "createdAt" DESC
    LIMIT 20;`);
}

export async function verifyUser(postId) {
  return db.query(
    `SELECT posts."idUser"
    FROM posts
    WHERE id = $1;`,
    [postId]
  );
}

export async function updatePublish(postText, id) {
  return db.query(
    `UPDATE posts
    SET "postText" = $1
    WHERE id = $2;`,
    [postText, id]
  );
}

export async function deletePublication(id) {
  return db.query(
    `DELETE FROM posts
    WHERE id = $1;`,
    [id]
  );
}
