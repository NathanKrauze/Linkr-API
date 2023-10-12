
import { getAllPosts, postAtTimeline } from "../repository/publish.repository.js";


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