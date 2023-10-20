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
  return db.query(`
    SELECT posts.*, users.username, users."pictureUrl", COUNT("idPost")AS likes,
      JSON_AGG(COALESCE((likes."idUser"), 0))  AS "usersLikes"
    FROM posts
    LEFT JOIN users ON users.id = posts."idUser"
    LEFT JOIN likes ON likes."idPost" = posts.id
    GROUP BY posts.id, users.id
    ORDER BY "createdAt" DESC
    ;`);
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

export async function deleteHashTrend(id) {
  return db.query(
    `DELETE FROM trends
    WHERE "idPost" = $1;`,
    [id]
  );
}

export async function verifyPost(idPost) {
  return db.query(
    `SELECT id FROM posts
      WHERE id = $1`,
    [idPost]
  );
}

export async function likePost(idUser, idPost) {
  return db.query(
    `INSERT INTO likes ("idUser", "idPost")
      VALUES($1, $2)`,
    [idUser, idPost]
  );
}

export async function dislikePost(idUser, idPost) {
  return db.query(
    `DELETE FROM likes
      WHERE "idUser" = $1 AND "idPost" = $2`,
    [idUser, idPost]
  );
}

export async function getUsersLikesDB(idPost) {
  return db.query(
    `SELECT users.username
      FROM likes
      JOIN posts ON posts.id = likes."idPost"
      JOIN users ON users.id = likes."idUser"
      WHERE likes."idPost" = $1
      LIMIT 2;`,
    [idPost]
  );
}

