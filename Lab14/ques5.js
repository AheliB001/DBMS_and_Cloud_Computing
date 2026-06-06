const fs = require('fs');
const mysql = require('mysql2');
const express = require('express');

const app = express();
const port = 8012;

app.use(express.urlencoded({ extended: true }));

const dbPassword = fs.readFileSync('db_password.txt', 'utf-8').trim();

const db = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: dbPassword,
  database: 'library'
});

db.connect(err => {
  if (err) throw err;
  console.log('MySQL Connected...');
});


app.get('/update', (req, res) => {
  res.send(`
    <html>
    <head>
      <title>Update Student</title>
    </head>
    <body>
      <h2>Update Student Name</h2>

      <form method="POST" action="/update">
        <label>Student ID:</label><br>
        <input type="number" name="id" required><br><br>

        <label>New Name:</label><br>
        <input type="text" name="name" required><br><br>

        <button type="submit">Update</button>
      </form>

    </body>
    </html>
  `);
});

app.post('/update', (req, res) => {
  const { id, name } = req.body;

  const sql = 'UPDATE Students SET StudentName = ? WHERE StudentID = ?';

  db.query(sql, [name, id], (err, result) => {
    if (err) {
      return res.status(500).send(err);
    }

    res.send(`
      <h3>Student updated successfully!</h3>
      <a href="/update">Go Back</a>
    `);
  });
});


app.listen(port, () => {
  console.log(`Server running on http://localhost:${port}`);
});
