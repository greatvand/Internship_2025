const express = require('express');

const port = process.env.PORT;
const host = process.env.HOST;

const app = express();

app.get("/test", (req, res) => {
  res.send("Hello from the server!");
});

app.listen(port, () => {
  console.log(`Server is running on ${host}:${port}/test`);
});