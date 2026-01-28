#!/usr/bin/env python3
import cgi
import cgitb
import csv
import os

cgitb.enable()

form = cgi.FieldStorage()

name = form.getvalue("name", "")
email = form.getvalue("email", "Not provided")
category = form.getvalue("category", "Not provided")
dob = form.getvalue("dob", "Not provided")
state = form.getvalue("state", "Not provided")

csv_file = "registrations.csv"
file_exists = os.path.isfile(csv_file)

with open(csv_file, "a", newline="") as f:
    writer = csv.writer(f)

    if not file_exists:
        writer.writerow(["Name", "Email", "Category", "DOB", "State"])

    writer.writerow([name, email, category, dob, state])

print("Content-Type: text/html\n")

print(f"""
<html>
<head>
    <title>Registration Status</title>
</head>
<body>
    <h2>Registration Successful</h2>
    <p>Thank you <b>{name}</b>, you have been registered successfully.</p>
</body>
</html>
""")
