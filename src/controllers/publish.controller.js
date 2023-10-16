import {
  deletePublication,
  dislikePost,
  getAllPosts,
  getUsersLikesDB,
  likePost,
  postAtTimeline,
  updatePublish,
  verifyPost,
  verifyUser,
} from "../repository/publish.repository.js";
import {
  getHashtagDB,
  postHashtagDB,
  postTrendsDB,
} from "../repository/hashtags.repository.js";

export async function postPublish(req, res) {
  const { postUrl, postText } = req.body;
  const { idUser } = res.locals.sessions;

  const hashtags = postText.match(/#\w+/g);

  try {
    const idPost = await postAtTimeline(idUser, postUrl, postText);

    if (hashtags) {
      hashtags.map(async (hash) => {
        let existsHashtag = await getHashtagDB(hash.replace("#", ""));

        if (existsHashtag.rowCount === 0) {
          existsHashtag = await postHashtagDB(hash.replace("#", ""));
        }

        await postTrendsDB(idPost.rows[0].id, existsHashtag.rows[0].id);
      });
    }

    res.sendStatus(201);
  } catch (err) {
    res.status(500).send("Houve um erro ao publicar seu link");
  }
}

export async function getTimeline(req, res) {
  try {
    const timeline = await getAllPosts();

    res.status(200).send(timeline.rows);
  } catch (error) {
    res
      .status(500)
      .send(
        "An error occured while trying to fetch the posts, please refresh the page"
      );
  }
}

export async function postUpdate(req, res) {
  const { postText } = req.body;
  const { id } = req.params;
  const { idUser } = res.locals.sessions;

  try {
    const userPost = await verifyUser(id);
    if (userPost.rowCount == 0)
      return res.status(400).send("Did not find post");
    if (userPost.rows[0].idUser != idUser)
      return res.status(400).send("You can not edit this post");

    await updatePublish(postText, id);

    res.status(200).send();
  } catch (error) {
    res
      .status(500)
      .send(
        "An error occured while trying to update the posts, please refresh the page"
      );
  }
}

export async function deletePostById(req, res) {
  const { id } = req.params;
  const { idUser } = res.locals.sessions;
  try {
    const userPost = await verifyUser(id);
    if (userPost.rowCount == 0)
      return res.status(400).send("Did not find post");
    if (userPost.rows[0].idUser != idUser)
      return res.status(400).send("You can not delete this post");

    await deletePublication(id);

    res.status(204).send();
  } catch (error) {
    res.status(500).send(error.message);
  }
}


export async function likesPost(req, res){
  const { liked } = req.body;
  const { idPost } = req.params;
  const { idUser } = res.locals.sessions;
  try{
    const existPost = await verifyPost(idPost);
    if( existPost.rowCount === 0 )return res.status(404).send("Did not find post");

    if(liked){
      await likePost(idUser, idPost);
      
    }else{
      await dislikePost(idUser, idPost);
    };
    res.sendStatus(201)
  }catch(error){
    res.status(500).send(error.message);
  }
}

export async function getUsersLikes(req, res){
  const {idPost} =req.params;
  try {
    const existPost = await verifyPost(idPost);
    if( existPost.rowCount === 0 )return res.status(404).send("Did not find post");

    const usersLike = await getUsersLikesDB(idPost);
    res.status(200).send(usersLike.rows)
  } catch (error) {
    res.status(500).send(error.message);
  }
}