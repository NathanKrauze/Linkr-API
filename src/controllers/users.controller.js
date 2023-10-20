import { getPostsByUserDB, searchUsersDB } from "../repository/users.repository.js";
import { getUserByIdDB } from "../repository/users.repository.js";

export async function getPostsByUser(req, res) {
    const  { idUser } = req.params;
    try {
      const existUser = await getUserByIdDB(idUser);
      if (existUser.rowCount === 0)
        return res.status(404).send("Did not find user");
  
      const usersPosts = await getPostsByUserDB(idUser);
      res.status(200).send(usersPosts.rows)
    } catch (error) {
      res.status(500).send(error.message);
    }
  }
  
  export async function getUsersBySearch(req, res) {
    const {searchString} = req.body;
    try {
      const users = await searchUsersDB(searchString);
      res.status(200).send(users.rows);
    } catch (error) {
      res.status(500).send(error.message);
    }
  }