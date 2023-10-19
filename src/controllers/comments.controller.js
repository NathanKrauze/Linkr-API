import { postCommentDB } from "../repository/comments.repository.js";

export async function createComment(req, res) {
  const { idUser, idPost, textComment } = req.body;

  try {
    await postCommentDB(idUser, idPost, textComment);

    res.sendStatus(201);
  } catch (err) {
    console.log(err.message);
    res.status(500).send(err.message);
  }
}
