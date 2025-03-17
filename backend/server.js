const express = require("express");
const cors = require("cors");
require("dotenv").config();

const app = express();
app.use(express.json());
app.use(cors()); // Enable CORS

// Sample API Endpoint
app.get("/api/message", (req, res) => {
  res.json({ message: "Hello from Backend!" });
});

const PORT = process.env.PORT || 5000;
app.listen(PORT, () => console.log(`Server running on port ${PORT}`));
