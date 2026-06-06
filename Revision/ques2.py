import mysql.connector

conn = mysql.connector.connect(
    host="localhost",
    user="root",
    password="your_password",
    database="revision"
)

cursor = conn.cursor()

query = """
SELECT r.Name AS Researcher,
       d.disease_name AS Disease
FROM Researcher r
JOIN Researcher_Project rp
    ON r.researcher_id = rp.researcher_id
JOIN Project_Disease pd
    ON rp.project_id = pd.project_id
JOIN Disease d
    ON pd.disease_id = d.disease_id;
"""

cursor.execute(query)

records = cursor.fetchall()

print("Researchers and Diseases they work on:\n")

for row in records:
    print("Researcher:", row[0], "| Disease:", row[1])

cursor.close()
conn.close()
