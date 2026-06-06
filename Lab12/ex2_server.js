const http=require('http');
function handleRequest(req,res) {
res.write("Hello from node js server");
res.end();
}

//const server=http.createServer((req,res => {
//	res.write("Hello from node js server");
//	res.end();
//});

const server = http.createServer(handleRequest);

server.listen(3000, '0.0.0.0', () => {
console.log("Server running at http://localhost:3000");
});
