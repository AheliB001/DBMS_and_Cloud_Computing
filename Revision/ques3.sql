const mysql = require('mysql2');

// Create connection
const connection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'your_password',
    database: 'revision'
});

// Researcher ID to search
const researcherId = 1;

// SQL Query
const query = `
SELECT DISTINCT d.disease_name
FROM Disease d
JOIN Project_Disease pd
    ON d.disease_id = pd.disease_id
JOIN Researcher_Project rp
    ON pd.project_id = rp.project_id
WHERE rp.researcher_id = ?;
`;

// Execute query
connection.query(query, [researcherId], (err, results) => {
    if (err) {
        console.error("Error:", err);
        return;
    }

    console.log("Diseases worked on by Researcher ID", researcherId);

    results.forEach(row => {
        console.log(row.disease_name);
    });

    connection.end();
});
