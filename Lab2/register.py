# from datetime import date
# cgitb.enable()
# form=cgi.FieldStorage()
# name=form.getvalue("name", "Unknown")
# email=form.getvalue("email", "Not provded")
# category=form.getvalue("category", "Not specified")
# dob=form.getvalue("dob")
# age = "Unknown"
# print(f"""""")

#!/usr/bin/python3
import cgi
import cgitb
import csv
import os

cgitb.enable()

form = cgi.FieldStorage()

name = form.getvalue("name", "Unknown")
email = form.getvalue("email", "Not provided")
category = form.getvalue("category", "Not provided")
dob = form.getvalue("dob")
state = form.getvalue("state", "Not provided")


csv_file = "/var/www/html/cgi-bin/registrations.csv"
file_exists = os.path.isfile(csv_file)



print("Content-Type: text/html\n")
csv_file = "register.csv"
file=os.path.isfile(csv_file)
with open(csv_file, "a", newline="") as f:
    writer = csv.writer(f)
    if not file:
        writer.writerow(["Name", "Email", "Category",
            "DOB", "State"])
    writer.writerow([name, email, category,
 ])
print(f"""
<html>
<body>
<h2>Registration Successful</h2>
<p>Thank you <b>{name}</b>, you have been registered successfully.</p>
</body>
</html>
""")

