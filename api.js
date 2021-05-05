const express = require("express");
const cors = require("cors");
const router = require("./routes");
const morgan = require("morgan");
const app = express();

app.use(express.json());
app.use(express.urlencoded());
app.use(cors());

app.use(
  morgan(":method :url :status :res[content-length] - :response-time ms :json")
);

morgan.token("json", (req, res) => JSON.stringify(req.body));

app.use("/api", router);

const PORT = process.env.PORT || 8000;
app.listen(PORT, () => console.log(`Server is running at ${PORT}`));
