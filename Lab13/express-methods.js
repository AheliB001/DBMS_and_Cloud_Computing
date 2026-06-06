const path = require('path');	//path is a built-in Node.js module, used to get the absolute file path

const exp = require('express');

const app = exp();  	//instantiating exp into an app

const port = 8012;

app.use(exp.static('public-pages'));

// Respond to GET request on the root route

app.get('/', (req, res) => {
res.send('GET request to the homepage');	//respond changed 
});

// Respond to POST request on the root route
app.post('/', (req, res) => {	//http method post
res.send('POST request to the homepage');
});

// Respond to GET request on the /about route
//app.get('/about', (req, res) => {	//if url has about, "About page" gets printed
//res.send('About page');
//});
// Catch all other routes


app.get('/about', (req, res) => {
  res.sendFile(path.join(__dirname, 'public-pages','aboutme.html'));
});

app.use((req, res) => {		//in case of invalid roots
res.status(404).send('404 - Page not found');
});
// Start the server

app.listen(port, () => {
console.log(`Example app listening at http://localhost:${port}`);
});
