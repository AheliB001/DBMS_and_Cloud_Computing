#!/usr/bin/env python3
import cgi
import csv

form = cgi.FieldStorage()
email_to_delete = form.getvalue("email")

csv_file = "registrations.csv"
rows = []
deleted = False

# Read existing data
with open(csv_file, "r") as f:
    reader = csv.reader(f)
    header = next(reader)
    for row in reader:
        if row[1] != email_to_delete:   # row[1] = Email
            rows.append(row)
        else:
            deleted = True

# Write updated data back
with open(csv_file, "w", newline="") as f:
    writer = csv.writer(f)
    writer.writerow(header)
    writer.writerows(rows)

print("Content-Type: text/html\n")

print("<html><body>")
if deleted:
    print(f"<h2>User with email {email_to_delete} deleted successfully</h2>")
else:
    print(f"<h2>No user found with email {email_to_delete}</h2>")
print("</body></html>")
