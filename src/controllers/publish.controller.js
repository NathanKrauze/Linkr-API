

import { deletePublication, getAllPosts, postAtTimeline, updatePublish, verifyUser } from "../repository/publish.repository.js";


export async function postPublish(req, res) {
    const { postUrl, postText } = req.body;
    const {idUser} = res.locals.sessions;

    try {
        
        await postAtTimeline(idUser, postUrl, postText);
        res.sendStatus(201);

    } catch (err) {
      res.status(500).send("Houve um erro ao publicar seu link");
    }
  }


export async function getTimeline(req, res){
    
    try {

        const timeline = await getAllPosts();
        if (timeline.rowCount == 0) return res.status(404).send("There are no posts yet");
        
        res.status(200).send(timeline.rows)
    } catch (error) {
        res.status(500).send("An error occured while trying to fetch the posts, please refresh the page");
    }
  }


  export async function postUpdate(req, res){
    const {postText} = req.body;
    const {id} = req.params;
    const {idUser} = res.locals.sessions

    try {
        const userPost = await verifyUser(id);
        if (userPost.rowCount == 0) return res.status(400).send("Did not find post");
        if(userPost.rows[0].idUser != idUser) return res.status(400).send("You can not edit this post");

        await updatePublish(postText, id);
       
        res.status(200).send()
    } catch (error) {
        res.status(500).send("An error occured while trying to update the posts, please refresh the page");
    }
  }
  
export async function deletePostById(req,res){
  const {id} = req.params;
  const {idUser} = res.locals.sessions
  try {
    const userPost = await verifyUser(id);
    if (userPost.rowCount == 0) return res.status(400).send("Did not find post");
    if(userPost.rows[0].idUser != idUser) return res.status(400).send("You can not delete this post");

    await deletePublication(id)
    
    res.status(204).send();

  } catch (error) {

    res.status(500).send(error.message);
  }
}