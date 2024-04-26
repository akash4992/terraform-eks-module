/* I am going to create my first nodejs application */

const express = require("express")
const app = express();
const port = 8080
// Adding a middileware if we not put this line req.body will not work.
app.use(express.json());

let user = {
  name: "Akash",
  city: "Dharamshala"
}

app.get('/', function(req, res){
  res.status(200).send(user);
});




function sleep(ms) {
  return new Promise((resolve) => {
    setTimeout(resolve, ms);
  });
} 


async function init() {
  // await sleep(60000);
  app.listen(port, () =>{
    console.log(`Hey Akash! Your Application start listening on port ${port}`)
})
}

init()
