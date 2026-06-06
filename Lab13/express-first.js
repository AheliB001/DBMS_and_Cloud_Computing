const express = require('express');  //require-import
const app = express();   //initializing express variable
const port = 8012;	//starting the port

app.get('/', (req, res) => {
  res.send("Hello Express");	//any base/root url, it will say hello...
});

app.listen(port, () => {	//inner func 
  console.log(`Example webapp listening at ${port}`);
});
