// Make sure you have these at the top
const express = require("express");
const cors = require("cors");
const dotenv = require("dotenv");
// Ensure you're importing the correct path to your db connection
const connectDB = require("./config/db");
const messageRouter = require("./api/message");

// Load env vars
dotenv.config();

// Create Express app
const app = express();

// Connect to database - Make sure this is working
// Wrap in try/catch for now
try {
  connectDB();
} catch (err) {
  console.error("Database connection failed:", err);
}

// Middleware
app.use(express.json());
app.use(cors());

// Routes
app.use("/api/auth", require("./routes/authRoutes"));
app.use("/api/items", require("./routes/itemRoutes"));
app.use("/api/message", messageRouter);

// Define port
const PORT = process.env.PORT || 5000;

// Start server
app.listen(PORT, () => console.log(`Server running on port ${PORT}`));
