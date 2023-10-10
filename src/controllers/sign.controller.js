

export async function postSignup(req,res){
 
  try {
 
        res.status(201).send();

      } catch (err) {
        res.status(500).send(err.message);
      }
}

export async function postSignin(req,res){

  try {
     
      res.status(200).send(token);
      
    } catch (err) {
      res.status(500).send(err.message);
    }
}
