const fs = require('fs');
const mysql = require('mysql2');
const express = require('express');
const app=express();
// Read password from file
const dbPassword = fs.readFileSync('db_password.txt', 'utf-8').trim();
// MySQL connection
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
app.get('/student', (req, res) => {
  const StudentName = req.query.name;

  if (!StudentName) {
    return res.status(400).send('Please provide a student name');
  }

  const sql = 'SELECT * FROM Students WHERE StudentName LIKE ?';

  db.query(sql, [`%${StudentName}%`], (err, results) => {
    if (err) {
      return res.status(500).send(err);
    }

    res.json(results);
  });
});

app.listen(8012, () => {
console.log('Server running on http://localhost:8012');
});
