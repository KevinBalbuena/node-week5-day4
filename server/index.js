const express = require("express");
const massive = require("massive");
require("dotenv").config();
const app = express();

app.use(express.json());
massive(process.env.CONECTION_STRING).then(db => {
  app.set("db", db);
  console.log("db connected");
});

app.get("/api/students", (req, res, next) => {
  req.app
    .get("db")
    .get_students()
    .then(students => {
      res.status(200).send(students);
    });
});

app.post("/api/students", (req, res, next) => {
  const db = req.app.get("db");
  const { student, cohort, campus_id } = req.body;
  db.insert_student([student, cohort, campus_id]).then(students => {
    res.status(200).send(students);
  });
});

app.put("/api/students/:id", (req, res, next) => {
  const db = req.app.get("db");
  const { new_name } = req.query;
  const { id } = req.params;
  db.update_name([new_name, id]).then(students => {
    res.status(200).send(students);
  });
});

const port = 4050;
app.listen(port, () => {
  console.log(`Server listening on port ${port}`);
});
