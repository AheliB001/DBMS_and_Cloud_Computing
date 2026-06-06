const fs = require('fs');
const mysql = require('mysql2');
const express = require('express');

const app = express();   
const port = 8012;

const dbPassword = fs.readFileSync('db_password.txt', 'utf-8').trim();

const db = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: dbPassword,
  database: 'ensembl_local'   
});

db.connect(err => {
  if (err) throw err;
  console.log('Connected to Ensembl DB');
});

app.get('/gene', (req, res) => {
  const keyword = req.query.name;

  if (!keyword) {
    return res.status(400).send('Please provide a search keyword');
  }

  const sql = 'SELECT * FROM gene WHERE description LIKE ?';

  db.query(sql, [`%${keyword}%`], (err, results) => {
    if (err) {
      return res.status(500).send(err);
    }

    res.json(results);
  });
});

app.listen(port, () => {
  console.log(`Server running on http://localhost:${port}`);
});
