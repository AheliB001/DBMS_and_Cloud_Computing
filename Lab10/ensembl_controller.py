#!/usr/bin/python3

import cgi
import cgitb
import mysql.connector

cgitb.enable()

print("Content-Type: text/html\n")

print("<html><body>")

form = cgi.FieldStorage()
action = form.getvalue("action")

conn = mysql.connector.connect(
    host="localhost",
    user="root",
    password="mypassword",
    database="ensembl_local"
)

cursor = conn.cursor()

#1. Gene details
if action == "gene":
    gene = form.getvalue("gene_id")

    cursor.execute("SELECT * FROM gene WHERE stable_id LIKE %s", (gene+"%",))
    rows = cursor.fetchall()

    print("<h2>Gene Details</h2>")
    for row in rows:
        print(row, "<br>")


#2. Transcripts
elif action == "transcript":
    gene = form.getvalue("trans_gene")

    cursor.execute("""
        SELECT t.*
        FROM transcript t
        JOIN gene g ON t.gene_id = g.gene_id
        WHERE g.stable_id LIKE %s
    """, (gene+"%",))

    rows = cursor.fetchall()

    print("<h2>Transcripts</h2>")
    for row in rows:
        print(row, "<br>")


#3. Chromosome genes
elif action == "chromosome":
    chr_val = form.getvalue("chr")

    cursor.execute("""
        SELECT g.*
        FROM gene g
        JOIN seq_region s ON g.seq_region_id = s.seq_region_id
        WHERE s.name = %s
    """, (chr_val,))

    rows = cursor.fetchall()

    print("<h2>Genes in Chromosome</h2>")
    for row in rows:
        print(row, "<br>")

else:
    print("<h3>No valid action selected</h3>")

print("</body></html>")

cursor.close()
conn.close()