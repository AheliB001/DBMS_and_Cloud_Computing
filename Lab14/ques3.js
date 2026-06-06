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
  database: 'library'
});


db.connect(err => {
  if (err) {
    console.error('MySQL connection error:', err);
    return;
  }
  console.log('MySQL Connected...');
});



app.get('/Student', (req, res) => {
  const StudentName = req.query.name;

  if (!StudentName) {
    return res.status(400).send('Please provide a student name');
  }

  const sql = 'SELECT * FROM Students WHERE StudentName LIKE ?';

  db.query(sql, [`%${StudentName}%`], (err, results) => {
    if (err) {
      return res.status(500).send(err);
    }


    let html = `
    <html>
    <head>
      <title>Student Results</title>
      <style>
        table { border-collapse: collapse; }
        th, td { padding: 8px; border: 1px solid black; }
        th { background-color: #ddd; }
      </style>
    </head>
    <body>

    <h2>Student Results</h2>

    <table>
      <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Department</th>
        <th>Email</th>
        <th>DOB</th>
      </tr>
    `;

    results.forEach(s => {
      html += `
      <tr>
        <td>${s.StudentID}</td>
        <td>${s.StudentName}</td>
        <td>${s.Department}</td>
        <td>${s.Email}</td>
        <td>${s.DOB}</td>
      </tr>
      `;
    });

    html += `
    </table>

    </body>
    </html>
    `;

    res.send(html);
  });
});



app.listen(port, () => {
  console.log(`Server running on http://localhost:${port}`);
});
