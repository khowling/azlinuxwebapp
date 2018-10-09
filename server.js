require('http').createServer((req, res) => {
  res.statusCode = 200;
  res.setHeader('Content-Type', 'text/plain');
  console.log ('sending response')
  res.end('Hello World 55\n');
}).listen(process.env.PORT || 8080, "0.0.0.0", () => {
  console.log(`Server running at http://localhost:${process.env.PORT || 8080}/`);
});
