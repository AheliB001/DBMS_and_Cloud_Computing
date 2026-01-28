#!/usr/bin/env python3
import csv

print("Content-Type: text/html\n")

print("""
<html>
<head>
<title>Registered Users</title>
</head>
<body>
<h2>Registered Users</h2>
<table border="1" cellpadding="5">
<tr>
<th>Name</th><th>Email</th><th>Category</th><th>DOB</th><th>State</th>
</tr>
""")

with open("registrations.csv", "r") as f:
    reader = csv.reader(f)
    next(reader)  
    for row in reader:
        print("<tr>")
        for col in row:
            print(f"<td>{col}</td>")
        print("</tr>")

print("""
</table>
</body>
</html>
""")
