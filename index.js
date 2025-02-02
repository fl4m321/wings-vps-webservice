// index.js
const express = require("express");
const app = express();
const port = process.env.PORT || 8081;  // Changed port to 8081

app.get("/", (req, res) => {
  res.send("Wings VPS Web Service is running!");
});

app.listen(port, () => {
  console.log(`Server listening on port ${port}`);
});
