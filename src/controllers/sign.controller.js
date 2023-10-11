import bcrypt from "bcrypt";
import { v4 as uuid } from "uuid";
import { postSessionDB } from "../repository/sign.repository.js";
import {
  postUserDB,
  getUserByEmailDB,
  getUserByIdDB,
} from "../repository/users.repository.js";

export async function postSignup(req, res) {
  const { username, email, password, pictureUrl } = req.body;

  try {
    const user = await getUserByEmailDB(email);

    if (user.rowCount > 0) return res.status(409).send("Email já cadastrado!");

    const hash = bcrypt.hashSync(password, 10);

    await postUserDB(username, email, hash, pictureUrl);

    res.sendStatus(201);
  } catch (err) {
    res.status(500).send(err.message);
  }
}

export async function postSignin(req, res) {
  const { email, password } = req.body;

  try {
    const user = await getUserByEmailDB(email);

    if (user.rowCount === 0)
      return res.status(401).send("Email não encontrado. Cadastre-se!");

    const correctPassword = bcrypt.compareSync(password, user.rows[0].password);
    if (!correctPassword) return res.status(401).send("Senha incorreta!");

    const token = uuid();

    const idUser = user.rows[0].id;
    const username = user.rows[0].username;
    const pictureUrl = user.rows[0].pictureUrl;

    await postSessionDB(token, idUser);

    res.status(200).send({ token, idUser, username, pictureUrl });
  } catch (err) {
    res.status(500).send(err.message);
  }
}
