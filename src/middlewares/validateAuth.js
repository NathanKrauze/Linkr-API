import db from "../database/database.connection.js";

export async function validateAuth(req, res, next) {
  const { authorization } = req.headers;
  const token = authorization?.replace("Bearer ", "");

  if (!token) return res.status(401).send("Send a token!");

  try {
    const session = await db.query(`SELECT * FROM sessions WHERE token = $1;`, [
      token,
    ]);
    if (!session.rowCount)
      return res.status(401).send("Your token is not valid!");

    res.locals.sessions = session.rows[0];

    next();
  } catch (err) {
    res.status(500).send(err.message);
  }
}
