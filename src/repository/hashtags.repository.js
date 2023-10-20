import db from "../database/database.connection.js";

export async function postHashtagDB(hashtag) {
  return db.query(
    `INSERT INTO hashtags ("hashtagText") VALUES ($1) RETURNING id;`,
    [hashtag]
  );
}

export async function postTrendsDB(idPost, idHashtag) {
  return db.query(
    `INSERT INTO trends ("idPost", "idHashtag") VALUES ($1, $2);`,
    [idPost, idHashtag]
  );
}

export async function getTrendingDB() {
  return db.query(`
    SELECT hashtags."hashtagText", COUNT(trends."idPost") AS "count"
        FROM hashtags
    JOIN trends ON hashtags.id = trends."idHashtag"
        GROUP BY hashtags."hashtagText"
        ORDER BY "count" DESC LIMIT 10;`);
}

export async function getHashtagDB(hashtag) {
  return db.query(`SELECT * FROM hashtags WHERE "hashtagText" = $1;`, [
    hashtag,
  ]);
}

export async function getHashtagPostsDB(hashtag) {
  return db.query(
    `
    SELECT posts.*, users.username, users."pictureUrl", COUNT(likes."idPost")AS likes,
        JSON_AGG(COALESCE((likes."idUser"), 0))  AS "usersLikes"
      FROM posts
    JOIN users ON users.id = posts."idUser"
    JOIN trends ON trends."idPost" = posts.id
    JOIN hashtags ON hashtags.id = trends."idHashtag"
    LEFT JOIN likes ON likes."idPost" = posts.id
      WHERE hashtags."hashtagText" = $1
    GROUP BY posts.id, users.username, users."pictureUrl"
      ORDER BY "createdAt" DESC
      LIMIT 20;`,
    [hashtag]
  );
}
