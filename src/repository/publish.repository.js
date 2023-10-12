import db from "../database/database.connection.js";

export async function postAtTimeline(idUser, postUrl, postText) {
    
    return db.query(`INSERT INTO posts 
    ("idUser", "postUrl", "postText") 
    VALUES ($1, $2, $3);`, [idUser, postUrl, postText]);
  }
  
export async function getAllPosts(){
    return db.query(`SELECT posts.*, users.username, users."pictureUrl" 
    FROM posts
	JOIN users ON users.id = posts."idUser"
    ORDER BY "createdAt" DESC
    LIMIT 20;`)
}