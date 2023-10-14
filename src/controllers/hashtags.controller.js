import {
  getTrendingDB,
  getHashtagDB,
  getHashtagPostsDB,
} from "../repository/hashtags.repository.js";

export async function getTrending(req, res) {
  try {
    const trends = await getTrendingDB();

    res.send(trends.rows);
  } catch (err) {
    res.status(500).send(err.message);
  }
}

export async function getHashtagPosts(req, res) {
  const { hashtag } = req.params;

  if (!hashtag) return res.status(422).send("You need to insert a hashtag");

  try {
    const existsHashtag = await getHashtagDB(hashtag);

    if (existsHashtag.rowCount === 0)
      return res.status(404).send("Hashtag not found!");

    const postsHashtag = await getHashtagPostsDB(hashtag);

    if (!postsHashtag)
      return res.status(404).send("No posts with this hashtag!");

    postsHashtag.rows.map((post) => delete post.createdAt);

    res.send(postsHashtag.rows);
  } catch (err) {
    console.log(err.message);
    res.status(500).send(err.message);
  }
}
