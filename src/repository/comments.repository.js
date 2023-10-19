import db from "../database/database.connection.js";

export async function getCommentsDB() {
  return db.query(`
    SELECT JSON_AGG(JSON_BUILD_OBJECT('idPost', comments."idPost", 'username',users.username, 
            'picture', users."pictureUrl",
            'textComment', comments."textComment"))
            AS comments
        FROM comments
    JOIN users ON comments."idUser" = users.id
    GROUP BY comments."idPost";
    `);
}

export async function postCommentDB(idUser, idPost, textComment) {
  return db.query(
    `INSERT INTO comments ("idUser", "idPost", "textComment")
      VALUES ($1, $2, $3);`,
    [idUser, idPost, textComment]
  );
}
